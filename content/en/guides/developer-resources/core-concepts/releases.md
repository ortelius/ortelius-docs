---
title: "Releases"
linkTitle: "Releases"
weight: 40
type: guides
description: >
  The versioned unit Ortelius tracks SBOMs, CVEs, and deployments against.
---

A **release** is a specific version of a component — a container image, application version, or published release. It's the object everything else attaches to: SBOMs, CVE matches, and deployment history.

```json
{
  "_key": "acme-payment-service_2.1.0",
  "name": "acme/payment-service",
  "version": "2.1.0",
  "version_major": 2,
  "version_minor": 1,
  "version_patch": 0,
  "version_prerelease": "",
  "org": "acme",
  "shortname": "payment-service",
  "is_public": false,
  "contentsha": "abc123def456",
  "projecttype": "docker",
  "gitcommit": "abc123def456",
  "dockersha": "sha256:...",
  "openssf_scorecard_score": 8.5,
  "objtype": "ProjectRelease"
}
```

## Deduplication

Releases are deduplicated by the composite key `(name, version, contentsha)`, where `contentsha` comes from `gitcommit` (preferred) or `dockersha`. Uploading the same release twice with the same git commit is a no-op; a different git commit creates a new record even with an identical name and version, to handle build-reproducibility cases.

## How releases get created

- Automatically, from GitHub Releases or successful GitHub Actions workflow runs, when you [connect GitHub](../../../start-here/connect-github/)
- Automatically, by the [`relscanner-job`](../../../integrations/deployment-tracking-github-gitlab/) scanner component
- Directly via `POST /api/v1/releases` — see the [REST API Reference](../rest-api-reference/releases-api/)

See [How Ortelius Objects Relate](../how-ortelius-objects-relate/) for how a release connects to SBOMs and CVEs.
