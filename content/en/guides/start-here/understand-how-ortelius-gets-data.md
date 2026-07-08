---
title: "Understand How Ortelius Gets Data"
linkTitle: "Understand How Ortelius Gets Data"
weight: 60
type: guides
description: >
  The three kinds of data Ortelius needs, and where each one comes from.
---

Before connecting anything, it helps to know what "having data" in Ortelius actually means. There are three layers, and each one arrives a different way:

## 1. Release and deployment metadata

Comes from connecting GitHub (or GitLab) — see [Connect GitHub](../connect-github/) and [Select Repositories to Watch](../select-repositories-to-watch/). This gives you release records and, for successful CI runs, deployment/endpoint records. On its own, this does **not** include vulnerability data.

## 2. SBOM data

Needed for CVE matching. Reaches Ortelius automatically through a scanner component (typically [`relscanner-job`](https://github.com/ortelius/relscanner-job)), with no changes required to your CI/CD pipeline. See [Attach or Discover SBOMs](../attach-or-discover-sboms/).

## 3. Vulnerability (CVE) data

Refreshed from the OSV.dev database on a schedule, independent of your own repositories, by the [`osvdev-job`](https://github.com/ortelius/osvdev-job) component. See [Sync Vulnerability Data](../sync-vulnerability-data/).

Ortelius correlates all three: it matches the packages listed in your SBOMs against the vulnerability intelligence ingested from OSV.dev, then tracks each match against the endpoint(s) where that release is actually deployed.

Continue to [Connect GitHub](../connect-github/) to start bringing in your own data.
