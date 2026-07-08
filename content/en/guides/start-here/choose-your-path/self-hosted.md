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

## Install

### 1. Start ArangoDB

```bash
docker run -d \
  --name arangodb \
  -p 8529:8529 \
  -e ARANGO_ROOT_PASSWORD=password \
  arangodb:latest
```

### 2. Configure environment

```bash
export ARANGO_HOST=localhost
export ARANGO_PASS=password
export JWT_SECRET=local-dev-secret
export ADMIN_USERNAME=admin
export ADMIN_PASSWORD=changeme
export BASE_URL=http://localhost:3000
```

### 3. Run the backend

```bash
go run main.go
```

### 4. Verify

```bash
curl http://localhost:3000/
# {"status":"healthy"}
```

The admin user is bootstrapped automatically on first startup if no users exist. Log in at `POST /api/v1/auth/login` with the credentials from `ADMIN_USERNAME` / `ADMIN_PASSWORD`.

> **Signup without a Git repo:** The signup endpoint requires `RBAC_REPO` to be configured. For local or initial development, create users directly via `POST /api/v1/users` (admin auth required) or set `RBAC_CONFIG_PATH` to a local `rbac.yaml` file instead.

## Optional components

A self-hosted deployment is more useful once you also deploy the scanner and sync components that keep data current:

- [`relscanner-job`](https://github.com/ortelius/relscanner-job) — discovers releases from GitHub/GitLab and attaches SBOMs automatically (see [Deployment Tracking Using GitHub and GitLab](../../../integrations/deployment-tracking-github-gitlab/))
- [`osvdev-job`](https://github.com/ortelius/osvdev-job) — syncs vulnerability data from OSV.dev every 15 minutes (see [OSV.dev](../../../integrations/osv-dev/))
- [`deployment-gke`](https://github.com/ortelius/deployment-gke) — tracks deployments on GKE (see [Deployment Tracking for GKE](../../../integrations/deployment-tracking-gke/))

For GitHub App credentials, Kafka, and full production configuration, continue with the [Architecture Guide](../../../developer-resources/core-concepts/architecture-guide/).

Next: [Log In for the First Time](../../log-in-for-the-first-time/).
