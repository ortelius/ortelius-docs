---
title: "Review Deployment and DORA Metrics"
linkTitle: "Review Deployment and DORA Metrics"
weight: 40
type: guides
description: >
  Monitor what's deployed where, and how frequently.
---

Ortelius tracks deployments as they happen — via GitHub Actions workflow runs, the [`relscanner-job`](../../integrations/deployment-tracking-github-gitlab/) scanner, or [GKE deployment tracking](../../integrations/deployment-tracking-gke/) — and surfaces them under the **Synced Endpoints** view, showing exactly where each release is currently running (Kubernetes, Docker, VMs, or serverless).

This deployment history is also what powers [blast radius analysis](../investigate-vulnerabilities/review-blast-radius-impact/) — knowing where a release is deployed is what lets Ortelius tell you which endpoints a given CVE actually affects.

If your setup doesn't yet have deployment data flowing, revisit [Track Deployments](../../start-here/track-deployments/) in Start Here.
