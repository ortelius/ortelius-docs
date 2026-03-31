---
title: "On Premise Installation"
linkTitle: "On Premise Installation"
weight: 2
---

This repository contains the GitOps platform for the Ortelius application stack. Terraform provisions infrastructure (EKS or GKE) and bootstraps FluxCD, which then manages all application deployments via Helm.

---

## Prerequisites

### Required tools (auto-installed by `deploy.sh` if missing)
- `age` and `sops` — for secret encryption
- `aws` CLI (EKS only)
- `kubectl`, `flux`, `helm`

### Credentials

**Both clusters:**
```bash
export TF_VAR_github_token="ghp_..."   # GitHub PAT with repo + admin:public_key scopes
```

**GKE:**
```bash
gcloud auth application-default login
```

**EKS:**
```bash
aws configure   # or set AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_DEFAULT_REGION
```

---

## Files to Update Before Deploying

### EKS — `terraform/eks/terraform.tfvars`

```hcl
aws_region    = "us-east-1"         # AWS region
cluster_name  = "pdvd-eks"          # EKS cluster name
vpc_cidr      = "10.0.0.0/16"       # VPC CIDR
domain        = "eks.deployhub.com" # Domain for ACM cert and ingress
github_org    = "ortelius"
github_repo   = "pdvd-platform"
dns_provider  = "cloudflare"        # "cloudflare" or "route53"
dns_zone_name = "deployhub.com"     # Parent DNS zone
```

### GKE — `terraform/gke/terraform.tfvars`

```hcl
project_id   = "your-gcp-project-id"
region       = "us-central1"
cluster_name = "pdvd-gke"
github_org   = "ortelius"
github_repo  = "pdvd-platform"
```

---

## Deploying

`deploy.sh` is the single entrypoint for installing Ortelius on either EKS or GKE.

```bash
./terraform/deploy.sh <gke|eks> [plan|apply|destroy]
```

Examples:
```bash
./terraform/deploy.sh eks apply      # Deploy to AWS EKS
./terraform/deploy.sh gke apply      # Deploy to GCP GKE
./terraform/deploy.sh eks plan       # Preview changes
./terraform/deploy.sh eks destroy    # Tear down the cluster
```

The script requires `TF_VAR_github_token` to be set in the environment before running.

---

## Interactive Prompts During `deploy.sh`

On the **first run**, `deploy.sh` generates an age encryption keypair and then prompts for all application secrets. These are encrypted with SOPS and committed to the repo as `clusters/<cluster>/pdvd/secrets.enc.yaml`.

| Prompt | Description |
|---|---|
| `smtp.username` | SMTP email address for outbound mail |
| `pdvd-arangodb.arangodb_pass` | ArangoDB root password |
| `pdvd-backend.rbac_repo_token` | GitHub PAT for the RBAC config repo |
| `pdvd-backend.clientSecret` | GitHub OAuth app client secret |
| `pdvd-backend.appId` | GitHub App ID |
| `pdvd-backend.clientId` | GitHub OAuth app client ID |
| `pdvd-backend.baseUrl` | Public base URL (e.g. `https://eks.deployhub.com`) |
| `smtp.password` | SMTP account password |
| `pdvd-backend.privateKey` | GitHub App private key (paste PEM block, then Ctrl-D) |
| `cloudflare.apiToken` *(EKS + Cloudflare only)* | Cloudflare API token for ExternalDNS (or set `TF_VAR_cloudflare_api_token`) |

The age private key is saved to `~/.ssh/<cluster-name>.sops.key`. **Back this up — losing it means losing access to all encrypted secrets.**

Subsequent runs skip the prompts if `secrets.enc.yaml` already exists.

---

## What `deploy.sh` Does

1. Installs `age` and `sops` if missing
2. Generates (or reuses) an age keypair at `~/.ssh/<cluster-name>.sops.key`
3. Prompts for application secrets and writes the encrypted `secrets.enc.yaml`
4. Commits `.sops.yaml` and `secrets.enc.yaml` to the repo
5. Runs `terraform init` and `terraform apply`
6. Terraform provisions infrastructure (VPC, cluster, IAM, ACM cert)
7. Injects the `sops-age` Kubernetes secret into `flux-system` before Flux bootstrap
8. Runs `flux bootstrap github` — installs Flux controllers and registers a deploy key
9. Writes and commits `clusters/<cluster>/flux-system/kustomization.yaml` with the SOPS patch
10. Flux reconciles the stack: ALB/GLB controller → ExternalDNS → pdvd HelmRelease

### After `eks apply` — DNS Setup

ExternalDNS automatically creates DNS records for the ALB. For ACM certificate validation, add the CNAME shown by:

```bash
aws acm describe-certificate \
  --certificate-arn $(terraform -chdir=terraform/eks output -raw acm_certificate_arn) \
  --query 'Certificate.DomainValidationOptions[0].ResourceRecord'
```

---

## Directory Structure

```
pdvd-platform/
├── terraform/
│   ├── deploy.sh                        # Single entrypoint — run this to install Ortelius
│   ├── eks/
│   │   ├── main.tf                      # VPC, EKS, ALB IAM, ACM, Flux bootstrap
│   │   ├── sops.tf                      # age keypair, sops-age secret, kustomization patch
│   │   └── terraform.tfvars            # ← Edit before deploying EKS
│   └── gke/
│       ├── main.tf                      # VPC, GKE cluster, static IP, Flux bootstrap
│       ├── sops.tf                      # age keypair, sops-age secret, kustomization patch
│       └── terraform.tfvars            # ← Edit before deploying GKE
│
└── clusters/
    ├── .sops.yaml                       # age public key routing (written by deploy.sh)
    ├── eks/
    │   ├── flux-system/                 # Flux controllers and kustomizations
    │   └── pdvd/
    │       ├── values.yaml              # Auto-written by Terraform with cert ARN + subnets
    │       └── secrets.enc.yaml        # ← SOPS-encrypted secrets (written by deploy.sh)
    └── gke/
        ├── flux-system/
        └── pdvd/
            ├── values.yaml
            └── secrets.enc.yaml        # ← SOPS-encrypted secrets (written by deploy.sh)
```

---

## Verifying the Deployment

```bash
# Check Flux controllers
kubectl get pods -n flux-system

# Check application pods
kubectl get pods -n pdvd

# Check HelmRelease status
kubectl get helmrelease -n pdvd

# Check ingress
kubectl get ingress -n pdvd
```

Expected HelmRelease output:
```
NAME            READY   STATUS
pdvd-frontend   True    Release reconciliation succeeded
pdvd-backend    True    Release reconciliation succeeded
pdvd-arangodb   True    Release reconciliation succeeded
```
