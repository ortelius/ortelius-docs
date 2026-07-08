---
title: "Configure Mission-Critical Endpoints"
linkTitle: "Configure Mission-Critical Endpoints"
weight: 50
type: guides
description: >
  Apply tighter SLA targets to your most important endpoints.
---

Endpoints with `endpoint_type: mission_asset` use tighter SLA targets than standard endpoints:

| Severity | Standard Endpoint | Mission-Critical Endpoint |
|-----------|--------------------|-----------------------------|
| Critical | 15 days            | 7 days                      |
| High     | 30 days            | 15 days                     |
| Medium   | 90 days            | 90 days                     |
| Low      | 180 days           | 180 days                    |

Mark your highest-value production endpoints — customer-facing services, payment processing, anything with elevated compliance requirements — as mission-critical so their SLA breaches are surfaced sooner. See [Configure Endpoints](../configure-endpoints/) for the general endpoint configuration, and [SLA Reference](../../reference/sla-reference/) for how these targets are used across the dashboard.
