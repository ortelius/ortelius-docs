---
title: "Executive Summary Cards"
linkTitle: "Executive Summary Cards"
weight: 10
type: guides
description: >
  The five headline metrics at the top of the dashboard.
---

Five cards give you the headline numbers at a glance:

| Card                         | What it means                                                                     | Calculation                                                                                                                                                  |
|------------------------------|-------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Total New CVEs**           | Total vulnerabilities detected within the rolling 180-day window                  | CVEs where Detected Date is within the last 180 days                                                                                                         |
| **Post-Deploy CVEs**         | Currently open CVEs that were disclosed *after* the software was already deployed | Open CVEs where Disclosure Date > Deployment date                                                                                                            |
| **MTTR (Pre + Post Deploy)** | Average days to remediate across all endpoint CVEs fixed in the period            | Σ(Fix Date − First Introduced Date) / Total Fixed CVEs                                                                                                       |
| **MTTR (Post-Deploy)**       | Average days to remediate for post-deployment CVEs only                           | Σ(Fix Date − First Introduced Date) / Total Fixed Post-Deploy CVEs. Clock starts at `root_introduced_at` — the first known version where the CVE was present |
| **% Open > SLA**             | Percentage of open CVEs exceeding their severity-based SLA                        | (Count of Open CVEs > SLA / Total Open CVEs) × 100                                                                                                           |

See [SLA Reference](../../../reference/sla-reference/) for how SLA targets are defined per severity.
