---
title: "Onboard Repositories"
linkTitle: "Onboard Repositories"
weight: 20
type: guides
description: >
  What happens technically when a repository is onboarded.
---

From **Profile → GitHub Integration**, a user picks which of their installed repositories to onboard (`POST /api/v1/github/onboard`). For each selected `owner/repo`, Ortelius:

1. **Fetches GitHub Releases** for the repo via the App installation token and creates a `release` record per release tag (version = tag name; visibility is set from the repo's public/private status).
2. **Fetches recent GitHub Actions workflow runs** and, for each run that completed successfully, creates a `github-actions/<owner>/<repo>` endpoint and a `sync` record (release version = first 7 characters of the run's head commit SHA).

This gives you a release and deployment timeline for the repo. Repeated onboarding calls simply re-run this same import — this REST endpoint itself has no automatic SBOM discovery, container image inspection, or OpenSSF Scorecard lookup.

A separate, optionally-deployed component, [`relscanner-job`](../../deployment-tracking-github-gitlab/), *does* provide a persistent background scanner with exactly those capabilities.

For the beginner-facing version of this step, see [Select Repositories to Watch](../../../start-here/select-repositories-to-watch/). For the endpoint reference, see the [Repository Onboarding API](../../../developer-resources/rest-api-reference/repository-onboarding-api/).
