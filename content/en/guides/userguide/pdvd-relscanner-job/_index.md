---
title: "Deployment Tracking Using GitHub"
linkTitle: "Deployment Tracking Using GitHub"
weight: 5
---

The Release Scanner (`pdvd-relscanner-job`) is a Kubernetes CronJob that automatically discovers new software releases by monitoring GitHub Actions workflow runs across all repositories connected to your GitHub App installation. It enriches each release with SBOM data, Git provenance, and OpenSSF Scorecard results, then syncs the release records to the Ortelius/DeployHub backend (`pdvd-backend`) via the `/api/v1/releases` API.

This component runs alongside the Ortelius backend and complements the [Deployment Tracking for GKE](./deployment-tracking-gke/) capability by capturing releases at their source — the CI/CD pipeline — rather than at runtime cluster observation.

## What It Does

For every GitHub App installation associated with a user in the Ortelius ArangoDB database, the scanner:

1. Queries all accessible repositories via the GitHub Apps API
2. Finds the most recent successful workflow run on `main` or `master` triggered by a `push`, `workflow_dispatch`, or `release` event
3. Downloads and parses the workflow logs to detect published Docker image references
4. Reads OCI image labels (`org.opencontainers.image.*`) to extract Git commit SHA, source URL, and author metadata
5. Acquires an SBOM using the following priority order:
   - OCI Referrers API (attached SBOM artifact)
   - Cosign DSSE attestation
   - GitHub Actions artifact named `sbom` or `cyclonedx`
   - On-the-fly generation via [Syft](https://github.com/anchore/syft)
6. Fetches an [OpenSSF Scorecard](https://securityscorecards.dev) result for the repository
7. Posts the complete release record — including SBOM and scorecard — to the Ortelius backend
8. Persists scan state to ArangoDB to avoid reprocessing already-synced workflow runs

## How It Fits Into Ortelius

Ortelius tracks _what_ is deployed _where_ across your environment. This scanner feeds the **Release** side of that picture: for each container image or application version built in GitHub Actions, it creates a versioned release record in Ortelius enriched with:

- **Component name** derived from the GitHub org/repo
- **Version** from the Docker image tag or Git tag
- **SBOM** (CycloneDX JSON) listing all packages and dependencies
- **Git metadata**: branch, commit SHA, commit timestamp, repository URL
- **OpenSSF Scorecard** security posture score

Once synced, these records are available in the Ortelius UI and API for dependency mapping, vulnerability correlation, and deployment audit trails.

## Connect Your GitHub Repositories

Before the scanner can discover your releases, connect your GitHub account via **Profile → Connect GitHub** in the Ortelius UI. This installs the PDVD GitHub App on your account or organization and stores your installation ID in ArangoDB, which the scanner uses to generate a short-lived token and access your repositories on every run. Full instructions are in [Connect Your GitHub Repositories](https://docs.ortelius.io/guides/userguide/) in the Getting Started guide.

## Schedule

The CronJob runs every 15 minutes by default (`*/15 * * * *`) with `concurrencyPolicy: Forbid` to prevent overlapping runs during long scans.

## SBOM Acquisition Priority

The scanner attempts to obtain an SBOM in the following order, stopping at the first success:

1. **OCI Referrers API** — looks for an attached artifact with a media type containing `sbom` or `cyclonedx`
2. **Cosign DSSE attestation** — looks for a DSSE envelope referrer and decodes the predicate
3. **GitHub Actions artifact** — downloads an artifact whose name contains `sbom` or `cyclonedx` and extracts the first JSON file
4. **Syft (on-the-fly)** — pulls the container image and generates a CycloneDX JSON SBOM locally

## State Persistence

Processed workflow run IDs are stored in ArangoDB under `metadata/relscanner_state`. This prevents duplicate release records on subsequent runs. State is keyed by `owner/repo`.
