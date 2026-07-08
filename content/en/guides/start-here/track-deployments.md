---
title: "Track Deployments"
linkTitle: "Track Deployments"
weight: 110
type: guides
description: >
  How Ortelius learns where your software is actually running.
---

Ortelius tracks deployments — where a release is actually running right now — separately from release metadata. There are a few ways this data arrives:

- **GitHub Actions workflow runs**: onboarding a repository (see [Select Repositories to Watch](../select-repositories-to-watch/)) automatically creates a `github-actions/<owner>/<repo>` endpoint and sync record for each successful workflow run.
- **`relscanner-job`**: the same scanner component that discovers SBOMs also detects deployments from GitHub/GitLab CI, container images, and published releases. See [Deployment Tracking Using GitHub and GitLab](../../integrations/deployment-tracking-github-gitlab/).
- **GKE deployments**: if you run on Google Kubernetes Engine, a separate component tails Cloud Audit Logs to detect new pod deployments automatically. See [Deployment Tracking for GKE](../../integrations/deployment-tracking-gke/).

You generally don't need to configure this yourself beyond connecting GitHub/GitLab or deploying the relevant scanner component — ask your platform team which of these is running in your environment.

Once deployment data is flowing, you can review it under [Review Deployment and DORA Metrics](../../using-ortelius/review-deployment-and-dora-metrics/).

Next: [Sync Vulnerability Data](../sync-vulnerability-data/).
