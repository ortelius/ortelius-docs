---
title: "Configure SLA Policy"
linkTitle: "Configure SLA Policy"
weight: 30
type: guides
description: >
  Change remediation deadlines from the NIST default.
---

By default, every dashboard and SLA calculation reflects the **NIST Recommended SLA Policy**:

| Severity | Standard Endpoint | Mission-Critical Endpoint |
|-----------|--------------------|-----------------------------|
| Critical | 15 days            | 7 days                      |
| High     | 30 days            | 15 days                     |
| Medium   | 90 days            | 90 days                     |
| Low      | 180 days           | 180 days                    |

Org admins can configure a different policy for their organization if the NIST defaults don't match internal compliance requirements. Once changed, every SLA-based metric on the dashboard — [Executive Summary Cards](../../using-ortelius/read-your-dashboard/executive-summary-cards/), [Severity Breakdown and SLA Compliance](../../using-ortelius/read-your-dashboard/severity-breakdown-and-sla-compliance/), and [Security Velocity and Impact Metrics](../../using-ortelius/read-your-dashboard/security-velocity-and-impact-metrics/) — recalculates against the new targets.

See [SLA Reference](../../reference/sla-reference/) for the full definition of how SLA windows are calculated, and [Configure Mission-Critical Endpoints](../configure-mission-critical-endpoints/) for how the tighter column applies.
