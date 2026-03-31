---
title: "Deployment Tracking For GKE"
linkTitle: "Deployment Tracking For GKE"
weight: 5
---

A Google Cloud Function that automatically detects new pod deployments in GKE clusters by tailing Cloud Audit Logs, then syncs release metadata — including SBOMs, Git provenance, and container image details — to a [DeployHub](https://www.deployhub.com) / Ortelius backend via the `/api/v1/sync` API.

## What It Does

- Polls GCP Cloud Audit Logs for `pods.create` events across all GKE clusters in a project
- Extracts image references, tags, namespaces, and cluster names from each pod creation event
- Resolves image digest (SHA) from the container registry
- Reads OCI image labels (`org.opencontainers.image.*`) to extract Git source URL and commit SHA
- Clones the Git repository to enrich the release with branch and commit timestamp
- Attempts to fetch a CycloneDX SBOM from a Cosign attestation attached to the image; falls back to generating one on-the-fly using [Syft](https://github.com/anchore/syft)
- Maps cluster/namespace pairs to organization names via environment variables
- POSTs all release data in a single batch to the DeployHub sync API

## Architecture

```
Cloud Scheduler → Cloud Function (HTTP trigger)
                      ↓
              GCP Cloud Audit Logs
                      ↓
         Image Registry (digest + labels)
                      ↓
          Git Repo (branch + commit info)
                      ↓
        Cosign Attestation / Syft SBOM
                      ↓
         DeployHub /api/v1/sync API
```

## Prerequisites

- A GCP project with GKE clusters
- Terraform >= 1.3
- Go 1.26 (handled automatically by Cloud Build)
- A running DeployHub or Ortelius instance reachable from the function
- `gcloud` CLI authenticated with sufficient permissions

## Installation

### 1. Clone the repository

```bash
git clone <your-repo-url>
cd <repo-directory>
```

### 2. Configure variables

Copy and edit the tfvars file:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars`:

```hcl
project_id = "your-gcp-project-id"
region     = "us-central1"
```

Optionally override org mappings in `variables.tf` or your tfvars:

```hcl
org_mappings = {
  "my-cluster/production" = "my-org"
  "my-cluster/staging"    = "staging-org"
}
```

### 3. Set the DeployHub URL

The function defaults to `https://app.deployhub.com`. To override, set the `DEPLOYHUB_URL` environment variable by adding it to the `environment_variables` block in `main.tf`:

```hcl
environment_variables = merge(
  {
    GCP_PROJECT   = var.project_id
    DEPLOYHUB_URL = "https://your-deployhub-instance.com"
  },
  ...
)
```

### 4. Deploy with Terraform

```bash
terraform init
terraform plan
terraform apply
```

Terraform will:
- Enable required GCP APIs
- Create service accounts with appropriate IAM roles
- Package and upload the function source to GCS
- Deploy the Cloud Function (Gen 2 / Cloud Run)
- Output the function URL and a ready-to-use `curl` invocation

### 5. Invoke the function

Trigger it manually using the `curl_example` output:

```bash
terraform output curl_example
# then run the printed command
```

Or set up a Cloud Scheduler job to invoke it on a schedule (e.g., every 30 minutes).

## Configuration

| Environment Variable | Default | Description |
|---|---|---|
| `DEPLOYHUB_URL` | `https://app.deployhub.com` | Base URL for the DeployHub API |
| `GCP_PROJECT` | _(required)_ | GCP project ID to scrape audit logs from |
| `LOOKBACK_MINUTES` | `30` | How far back in time to look for new deployments |
| `DRY_RUN` | `false` | If `true`, logs the sync payload but does not POST it |
| `ORG_<base64url(cluster/namespace)>` | _(none)_ | Maps a cluster/namespace key to an org name (managed by Terraform via `org_mappings`) |

## IAM Permissions Required

The function's service account needs

- `roles/logging.viewer` — to read Cloud Audit Logs

The invoker service account needs:

- `roles/run.invoker` — to call the deployed Cloud Run function

## Development

To test locally with dry-run mode, set environment variables and run:

```bash
export GCP_PROJECT=your-project
export DRY_RUN=true
export LOOKBACK_MINUTES=60
# invoke via functions-framework or a local HTTP server
```
