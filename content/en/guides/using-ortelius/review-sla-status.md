---
title: "Review SLA Status"
linkTitle: "Review SLA Status"
weight: 30
type: guides
description: >
  Check whether open vulnerabilities are within their remediation deadline.
---

SLA targets define how many days your team has to remediate a CVE before it counts as overdue. The clock starts when the CVE is first detected on a deployed endpoint.

| Severity | Standard Endpoint | Mission-Critical Endpoint |
|----------|--------------------|----------------------------|
| Critical | 15 days            | 7 days                     |
| High     | 30 days            | 15 days                    |
| Medium   | 90 days            | 90 days                    |
| Low      | 180 days           | 180 days                   |

Endpoints marked as mission-critical use the tighter targets in the right column — see [Configure Mission-Critical Endpoints](../../configure-ortelius/configure-mission-critical-endpoints/).

Use the **% Open > SLA** figure on your [Executive Summary Cards](../read-your-dashboard/executive-summary-cards/) and the per-severity breach percentages in [Severity Breakdown and SLA Compliance](../read-your-dashboard/severity-breakdown-and-sla-compliance/) to see where you're at risk of breaching. To change the targets themselves, see [Configure SLA Policy](../../configure-ortelius/configure-sla-policy/). For the full definitions, see [SLA Reference](../../reference/sla-reference/).
