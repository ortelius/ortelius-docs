---
title: "GitHub Actions Deployment Tracking"
linkTitle: "GitHub Actions Deployment Tracking"
weight: 30
type: guides
description: >
  How a successful GitHub Actions workflow run becomes a deployment record.
---

When a repository is onboarded (see [Onboard Repositories](../onboard-repositories/)), Ortelius inspects recent GitHub Actions workflow runs. For each run that completed successfully, it creates:

- A `github-actions/<owner>/<repo>` [endpoint](../../../developer-resources/core-concepts/endpoints/)
- A [sync record](../../../developer-resources/core-concepts/sync-records/), with the release version set to the first 7 characters of the run's head commit SHA

This is a lightweight way to get *some* deployment signal without deploying a separate scanner component, but it only reflects that a workflow ran successfully — not that a specific artifact reached a specific runtime environment. For deeper deployment tracking that follows a release into GitHub/GitLab CI/CD and into running container images, see [Deployment Tracking Using GitHub and GitLab](../../deployment-tracking-github-gitlab/) and, for GKE specifically, [Deployment Tracking for GKE](../../deployment-tracking-gke/).
