---
title: "Self-Hosted"
linkTitle: "Self-Hosted"
weight: 20
type: guides
description: >
  Run Ortelius on your own infrastructure.
aliases:
  - /guides/initial-setup/choose-your-path/self-hosted-installation/
---

Self-hosting Ortelius means running the backend, database (ArangoDB), and optional scanner components (`relscanner-job`, `osvdev-job`, `deployment-gke`) yourself, typically on Kubernetes.

This is the right choice if:

- You need full control over data residency
- You're operating in a regulated or air-gapped environment
- You want to customize or extend the platform's deployment topology

Platform engineers, infrastructure teams, and security reviewers evaluating a self-hosted deployment should also read the [Architecture Guide](../../../developer-resources/core-concepts/architecture-guide/) for the full non-functional requirements, technology stack, and deployment architecture.

## Install with Helm

The supported way to deploy Ortelius on Kubernetes is the official Helm chart, published on ArtifactHub:

**[artifacthub.io/packages/helm/ortelius/ortelius](https://artifacthub.io/packages/helm/ortelius/ortelius)**

Follow the install instructions on that page for chart values, resource sizing, and upgrade notes.

## Install with Terraform

[**github.com/ortelius/platform-iac**](https://github.com/ortelius/platform-iac) is the GitOps platform for the full Ortelius application stack. Terraform provisions the underlying infrastructure (EKS or GKE) and bootstraps FluxCD, which then manages all application deployments via Helm — including the same [chart on ArtifactHub](https://artifacthub.io/packages/helm/ortelius/ortelius) described above.

This is the recommended path for a production-grade, on-premise/cloud install, since it handles cluster provisioning, secret management, DNS, and the Helm release together as one repeatable pipeline.

### Prerequisites

The `deploy.sh` script auto-installs its required tools (`age`, `sops`, `kubectl`, `flux`, `helm`) if they're missing. You still need:

- The `aws` CLI, if deploying to EKS
- Credentials for your target cloud, exported before running:

```bash
# Both clusters — a GitHub PAT with repo + admin:public_key scopes
export TF_VAR_github_token="ghp_..."

# GKE
gcloud auth application-default login

# EKS
aws configure   # or set AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_DEFAULT_REGION
```

### Configure your cluster

Edit the `terraform.tfvars` for your target platform before deploying:

**EKS** — `terraform/eks/terraform.tfvars`:

```hcl
aws_region    = "us-east-1"         # AWS region
cluster_name  = "ortelius-eks"      # EKS cluster name
vpc_cidr      = "10.0.0.0/16"       # VPC CIDR
domain        = "eks.deployhub.com" # Domain for ACM cert and ingress
github_org    = "ortelius"
github_repo   = "platform-iac"
dns_provider  = "cloudflare"        # "cloudflare" or "route53"
dns_zone_name = "deployhub.com"     # Parent DNS zone
```

**GKE** — `terraform/gke/terraform.tfvars`:

```hcl
project_id   = "your-gcp-project-id"
region       = "us-central1"
cluster_name = "ortelius-gke"
github_org   = "ortelius"
github_repo  = "platform-iac"
```

### Deploy

`deploy.sh` is the single entrypoint for installing on either platform:

```bash
./terraform/deploy.sh <gke|eks> [plan|apply|destroy]
```

```bash
./terraform/deploy.sh eks apply      # Deploy to AWS EKS
./terraform/deploy.sh gke apply      # Deploy to GCP GKE
./terraform/deploy.sh eks plan       # Preview changes
./terraform/deploy.sh eks destroy    # Tear down the cluster
```

On the first run, it generates an age encryption keypair and prompts for the application secrets it needs (SMTP credentials, ArangoDB password, GitHub App ID/client ID/client secret/private key, RBAC repo token, base URL, and — for EKS with Cloudflare — an API token). These are encrypted with SOPS and committed to the repo as `clusters/<cluster>/ortelius/secrets.enc.yaml`.

> **Back up the generated age key** at `~/.ssh/<cluster-name>.sops.key` — losing it means losing access to all encrypted secrets. Subsequent runs skip the prompts once `secrets.enc.yaml` already exists.

Behind the scenes, `deploy.sh` runs `terraform init`/`apply` to provision the infrastructure (VPC, cluster, IAM, ACM certificate), then runs `flux bootstrap github` to install Flux and hand off the ortelius Helm release to it — so ongoing upgrades happen via GitOps rather than by re-running Terraform.

### Verify

```bash
kubectl get pods -n flux-system
kubectl get pods -n ortelius
kubectl get helmrelease -n ortelius
kubectl get ingress -n ortelius
```

If you deployed to EKS, ExternalDNS creates the DNS records automatically; you'll still need to add the CNAME shown by `aws acm describe-certificate` to complete ACM certificate validation. See the [platform-iac README](https://github.com/ortelius/platform-iac) for the full directory layout and troubleshooting notes.

Next: [Log In for the First Time](../../log-in-for-the-first-time/).
