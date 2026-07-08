---
title: "Select Repositories to Watch"
linkTitle: "Select Repositories to Watch"
weight: 80
type: guides
description: >
  Onboard the repositories you want Ortelius to track.
aliases:
  - /guides/userguide/repository-onboarding/
---

Once GitHub is connected, choose which repositories Ortelius should actually onboard.

## From the Welcome page

1. Check the boxes next to the repos you want and click **Import Selected**.
2. Or, **favorite a public repo by name** *(optional)*: search by name or `owner/repo` (GitHub or GitLab) and click **Add to Favorites** — useful for public repos you don't have GitHub access to yourself.
3. Click **Go to Organizations** at the bottom of the Welcome page — your tracked repos and their security posture appear in the Organizations and Dashboard views.

## From Profile → GitHub Integration

You can also pick which of your installed repositories to onboard from **Profile → GitHub Integration**. For each selected `owner/repo`, Ortelius:

1. **Fetches GitHub Releases** for the repo and creates a `release` record per release tag (version = tag name; visibility is set from the repo's public/private status).
2. **Fetches recent GitHub Actions workflow runs** and, for each run that completed successfully, creates a `github-actions/<owner>/<repo>` endpoint and a sync record (release version = first 7 characters of the run's head commit SHA).

This gives you a release and deployment timeline for the repo. Repeated onboarding calls simply re-run this same import — onboarding itself does not attach an SBOM, inspect container images, or fetch an OpenSSF Scorecard. A separate, optionally-deployed scanner component provides those capabilities automatically — see [Attach or Discover SBOMs](../attach-or-discover-sboms/).

Next: [Verify Your Data](../verify-your-data/).
