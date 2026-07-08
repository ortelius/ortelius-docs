---
title: "Attach or Discover SBOMs"
linkTitle: "Attach or Discover SBOMs"
weight: 100
type: guides
description: >
  How SBOM data reaches Ortelius so CVE matching can run.
aliases:
  - /guides/userguide/why-am-i-seeing-zero-cves/
---

GitHub onboarding imports release and deployment *metadata* — it does not attach an SBOM, so there is nothing yet for CVE matching to run against. No changes to your CI/CD pipeline, no CLI, and no direct API calls from your pipeline are required to fix this — SBOM data reaches Ortelius automatically via a scanner component:

- [`relscanner-job`](https://github.com/ortelius/relscanner-job) — a CronJob that discovers releases from GitHub/GitLab and auto-attaches an SBOM via OCI attestations, Cosign, GitHub Release assets, or Syft/cdxgen generation.

Ask your platform team whether this is deployed alongside your backend — that's the only setup step. Once it is, give it up to one scan cycle (15 minutes by default) after a repo is connected.

## Building custom tooling

If you're integrating with Ortelius programmatically, `POST /api/v1/releases` also accepts an SBOM directly — see the [REST API Reference](../../developer-resources/rest-api-reference/) — but this isn't something you need to add to your CI/CD pipeline for normal use; the scanner components above cover that.

## Where SBOMs can come from

Ortelius (via `relscanner-job`) discovers SBOMs from several sources, in priority order — OCI attestations, Cosign attestations, GitHub Release assets, or generated on-the-fly with Syft or cdxgen. See [SBOM Integration](../../integrations/sbom-integration/) for the full source-by-source breakdown.

Next: [Track Deployments](../track-deployments/).
