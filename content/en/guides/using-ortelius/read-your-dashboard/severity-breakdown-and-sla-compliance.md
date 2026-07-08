---
title: "Severity Breakdown and SLA Compliance"
linkTitle: "Severity Breakdown and SLA Compliance"
weight: 20
type: guides
description: >
  The per-severity remediation table.
---

A table segmented by Critical, High, Medium, and Low with six columns per row:

| Column             | What it means                                                                           |
|--------------------|-------------------------------------------------------------------------------------------|
| **MTTR (Days)**    | Σ(Fix − Detect) / Fixed — average remediation time for closed CVEs at this severity     |
| **MTTR (Post)**    | Σ(Fix − Detect) / Post-deploy fixed — same but restricted to post-deployment CVEs       |
| **% Fixed in SLA** | (Fixed ≤ SLA / Total) × 100 — what fraction were resolved before the deadline           |
| **Mean Age**       | Σ(Now − Detect) / Open — average age of currently open CVEs at this severity            |
| **Oldest**         | Max open age — the single oldest unresolved CVE at this severity                        |
| **% > SLA**        | (Open > SLA / Total Open) × 100 — how many open CVEs have already breached the deadline |

See [Review SLA Status](../../review-sla-status/) for how to act on this table, and [SLA Reference](../../../reference/sla-reference/) for the underlying targets.
