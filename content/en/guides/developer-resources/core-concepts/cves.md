---
title: "CVEs"
linkTitle: "CVEs"
weight: 60
type: guides
description: >
  How vulnerability records are stored, scored, and matched against your releases.
---

A **CVE** document represents a single vulnerability, sourced from OSV.dev and refreshed every 15 minutes.

```json
{
  "_key": "CVE-2024-1234",
  "id": "CVE-2024-1234",
  "summary": "Buffer overflow in lodash",
  "published": "2024-11-15T00:00:00Z",
  "database_specific": {
    "cvss_base_score": 9.8,
    "severity_rating": "CRITICAL"
  },
  "affected": [
    {
      "package": { "ecosystem": "npm", "name": "lodash" },
      "ranges": [
        { "type": "SEMVER", "events": [{"introduced": "0"}, {"fixed": "4.17.21"}] }
      ]
    }
  ]
}
```

## CVSS scoring and severity

CVSS vector strings are parsed and pre-calculated at ingestion time using `github.com/pandatix/go-cvss`, so severity queries use a simple indexed string comparison rather than parsing vectors at query time.

| Severity     | CVSS Score Range | Notes                                              |
|---------------|--------------------|------------------------------------------------------|
| **CRITICAL** | 9.0 – 10.0        |                                                    |
| **HIGH**     | 7.0 – 8.9         |                                                    |
| **MEDIUM**   | 4.0 – 6.9         |                                                    |
| **LOW**      | 0.1 – 3.9         | Also assigned to CVEs with missing/unparseable data |
| **NONE**     | 0.0               |                                                    |

CVEs without a parseable CVSS vector are assigned `severity_rating: "LOW"` and `cvss_base_score: 0.1` rather than being discarded — this keeps tracking comprehensive rather than silently dropping ambiguous records.

## How CVEs reach Ortelius

The [`osvdev-job`](../../../integrations/osv-dev/) component continuously syncs the OSV.dev database. See [Sync Vulnerability Data](../../../start-here/sync-vulnerability-data/) for the setup-flow explanation and [Supported Ecosystems](../../../reference/supported-ecosystems/) for which package ecosystems are covered.

## How CVEs match your releases

See [How Ortelius Objects Relate](../how-ortelius-objects-relate/) for the hub-and-spoke design that connects CVEs to SBOMs efficiently, and [Sync Records](../sync-records/) for how a match becomes a tracked lifecycle event on a specific deployed endpoint.
