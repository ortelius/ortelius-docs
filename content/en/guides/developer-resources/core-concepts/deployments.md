---
title: "Deployments"
linkTitle: "Deployments"
weight: 80
type: guides
description: >
  What it means for a release to be "deployed" in Ortelius.
---

A **deployment**, in Ortelius' data model, is expressed as a [sync record](../sync-records/) connecting a specific [release](../releases/) to a specific [endpoint](../endpoints/) at a point in time. There's no separate "deployment" collection — the sync record itself is the deployment event.

## Where deployment data comes from

- GitHub Actions workflow runs, captured when you [connect GitHub](../../../start-here/connect-github/)
- The [`relscanner-job`](../../../integrations/deployment-tracking-github-gitlab/) scanner, for GitHub/GitLab CI pipelines
- The [GKE deployment tracker](../../../integrations/deployment-tracking-gke/), for Google Kubernetes Engine, via Cloud Audit Logs

See [Track Deployments](../../../start-here/track-deployments/) for the setup-flow explanation, and [Review Deployment and DORA Metrics](../../../using-ortelius/review-deployment-and-dora-metrics/) for how this data shows up on your dashboard.
