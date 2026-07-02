---
title: "Deployment Tracking using GitHub and GitLab"
linkTitle: "Deployment Tracking using GitHub and GitLab"
weight: 5
---

The Release Scanner (`relscanner-job`) is a Kubernetes CronJob that automatically discovers new software releases from GitHub and GitLab, enriches each with SBOM data, Git provenance, and OpenSSF Scorecard results, and syncs the release records to the Ortelius/DeployHub backend (`ortelius`) via the `/api/v1/releases` API.

This component runs alongside the Ortelius backend and complements the [Deployment Tracking for GKE](https://github.com/ortelius/deployment-gke) capability by capturing releases at their source — the CI/CD pipeline / release process — rather than at runtime cluster observation.

## What It Does

Each run makes three passes over different repo sources, deduplicating by owner/repo so a repo tracked in more than one place is only scanned once:

1. **GitHub App installations** — for every user in the Ortelius database with a connected GitHub App installation (`GITHUB_APP_ID`/`GITHUB_PRIVATE_KEY` must be set, otherwise this pass is skipped), queries all accessible repositories via the GitHub Apps API
2. **Org-level tracked repos** — repos explicitly tracked by an org (`org.tracked_repos`, GitOps-managed), on either GitHub or GitLab, using the org's GitHub App installation, an org-level encrypted PAT, or a system-wide fallback token
3. **System-wide public tracked repos** — public repos anyone has favorited by name (`system_tracked_repos`, GitHub or GitLab), scanned using the `GITHUB_TOKEN`/`GITLAB_TOKEN` system tokens, no org credential required

For each in-scope repository, the scanner:

- Finds the most recent successful workflow run on `main` or `master` triggered by a `push`, `workflow_dispatch`, or `release` event, downloads and parses the workflow logs to detect published Docker image references — **or**, separately, scans the repo's published GitHub Releases directly (including downloading release assets, with special handling for Java build artifacts)
- Reads OCI image labels (`org.opencontainers.image.*`) to extract Git commit SHA, source URL, and author metadata; for repos it clones directly, also collects deeper Git metadata (contributor counts, lines added/deleted, commit signature verification, sign-off info)
- Acquires an SBOM using the priority order below
- For C/C++ repositories with no other SBOM source, generates one via [cdxgen](https://github.com/CycloneDX/cdxgen) after detecting build markers (CMakeLists.txt, Makefile, etc.) in a clone of the repo
- Fetches an [OpenSSF Scorecard](https://securityscorecards.dev) result for the repository
- Posts the complete release record — including SBOM and scorecard — to the Ortelius backend
- Persists scan state to ArangoDB to avoid reprocessing already-synced workflow runs and releases

## How It Fits Into Ortelius

Ortelius tracks _what_ is deployed _where_ across your environment. This scanner feeds the **Release** side of that picture: for each container image, application version, or published release built via GitHub Actions/Releases or GitLab CI, it creates a versioned release record in Ortelius enriched with:

- **Component name** derived from the GitHub/GitLab org (or group) and repo
- **Version** from the Docker image tag, Git tag, or release tag
- **SBOM** (CycloneDX JSON) listing all packages and dependencies
- **Git metadata**: branch, commit SHA, commit timestamp, repository URL
- **OpenSSF Scorecard** security posture score, via the [securityscorecards.dev](https://securityscorecards.dev) API (parameterized by platform, so results depend on that project's own GitLab coverage)

Once synced, these records are available in the Ortelius UI and API for dependency mapping, vulnerability correlation, and deployment audit trails.

## Getting Your Repositories Scanned

There are three ways a repo gets picked up, matching the three passes above — you don't need to do all of them:

- **Connect the GitHub App** (covers Pass 1): in the Ortelius UI, connect your GitHub account via the Welcome page or Profile → GitHub Integration. This installs the Ortelius GitHub App and stores your installation ID in ArangoDB, which the scanner uses to generate a short-lived token and access your repositories on every run.
- **Org-level tracked repos** (Pass 2): an org owner adds a repo via `POST /api/v1/orgs/:org/tracked-repos` (GitHub or GitLab, public or private with credentials configured).
- **Favorite a public repo by name** (Pass 3): any authenticated user can add a public GitHub or GitLab repo via `POST /api/v1/tracked-repos` — no GitHub App connection needed.

See the [backend repo's README](https://github.com/ortelius/ortelius#connect-your-github-repositories) and the [frontend repo's README](https://github.com/ortelius/frontend#quick-start-github-integration) for the current UI walkthrough of these flows.

## Schedule

The CronJob runs every 15 minutes by default (`*/15 * * * *`) with `concurrencyPolicy: Forbid` to prevent overlapping runs during long scans.

## SBOM Acquisition Priority

The exact order depends on whether the scanner is working from a **container image** (workflow-run path) or a **GitHub Release** (release-asset path), but both fall back through roughly the same tiers before giving up:

**Container image path:**
1. **OCI Referrers API** — looks for an attached artifact with a media type containing `sbom` or `cyclonedx`
2. **Cosign DSSE attestation** — looks for a DSSE envelope referrer and decodes the predicate
3. **GitHub Actions artifact** — downloads a workflow-run artifact whose name contains `sbom` or `cyclonedx` and extracts the first JSON file
4. **Syft (on-the-fly)** — pulls the container image and generates a CycloneDX JSON SBOM locally
5. **cdxgen** — as a further fallback, particularly for C/C++ repositories Syft can't characterize well

**GitHub Release path:**
1. **Release asset** — downloads a release asset whose name matches an SBOM/CycloneDX pattern
2. **Syft or cdxgen on the downloaded asset** — if the asset itself isn't an SBOM (e.g. a Java build artifact), generates one from it
3. **cdxgen on a repo clone** — for C/C++ repos, after detecting build markers (CMakeLists.txt, Makefile, etc.)
4. **Syft on a repo clone** — final fallback, generates a CycloneDX SBOM from the cloned source tree

## State Persistence

Scan state lives in a single ArangoDB document at `metadata/relscanner_state` — not one document per repo. It holds two maps, `processed_repos` (last processed workflow-run ID per `owner/repo`) and `processed_releases` (last processed GitHub Release per `owner/repo`), both updated and re-saved as one document after each run. This prevents duplicate release records on subsequent runs.

> **Collision warning:** this shares the `metadata` collection with the [`osvdev-job`](https://github.com/ortelius/osvdev-job) CronJob's per-ecosystem high-water marks and the backend's generic `GET/PUT /api/v1/metadata/:key` API. Avoid using the key `relscanner_state` through that API — doing so will corrupt or reset this job's scan state.

## Configuration

| Environment Variable | Default | Description |
|---|---|---|
| `API_BASE_URL` | `http://localhost:3000` (chart default: `https://app.deployhub.com`) | Base URL of the Ortelius backend to sync releases to |
| `GITHUB_APP_ID` | _(none)_ | GitHub App ID — required for Pass 1 (GitHub App installation discovery); Pass 1 is skipped entirely if unset |
| `GITHUB_PRIVATE_KEY` | _(none)_ | GitHub App private key (PEM) — required alongside `GITHUB_APP_ID` for Pass 1 |
| `GITHUB_TOKEN` | _(none)_ | System-level GitHub token used for Pass 3 (public tracked repos) and as a fallback for org-tracked public GitHub repos |
| `GITLAB_TOKEN` | _(none)_ | System-level GitLab token used for Pass 3 (public tracked repos) |
| `ARANGO_HOST` / `ARANGO_PORT` / `ARANGO_USER` / `ARANGO_PASS` | see [backend architecture guide](https://github.com/ortelius/ortelius/blob/main/docs/architecture.md#environment-variables-reference) | ArangoDB connection, shared with the main backend |

For Pass 2 (org-tracked private repos), credentials come from the org document itself (GitHub App installation ID, or an encrypted GitHub/GitLab PAT set via `POST /api/v1/orgs/:org/credentials`) rather than from this job's own environment variables.