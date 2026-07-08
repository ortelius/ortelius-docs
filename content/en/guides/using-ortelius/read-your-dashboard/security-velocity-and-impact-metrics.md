---
title: "Security Velocity and Impact Metrics"
linkTitle: "Security Velocity and Impact Metrics"
weight: 50
type: guides
description: >
  Operational effectiveness metrics and the three summary numbers.
---

Four metric cards focused on operational effectiveness:

| Metric                 | What it means                                               | Calculation                             |
|-------------------------|---------------------------------------------------------------|--------------------------------------------|
| **Fix Velocity**       | CVEs remediated per week over the last 180 days             | Fixed CVEs / 26 weeks                   |
| **High-Risk Backlog**  | Total open Critical + High CVEs right now                   | Count of open Critical + open High      |
| **Shift-Left Success** | Percentage of CVEs caught before they reached production    | Pre-Deploy / (Pre-Deploy + Total) × 100 |
| **SLA Burn Rate**      | How many SLA deadlines are being breached per 30-day period | Open CVEs where (SLA − Age) < 30d       |

Three summary numbers appear at the bottom of this section:

| Number                | What it means                                                                                                                                 |
|-----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| **CVE-Days Exposure** | Total accumulated exposure across all open CVEs — Σ(Mean Age) across all open CVEs. A high number means many CVEs have been open a long time. |
| **Weeks to Clear**    | Estimated weeks to resolve the current backlog at the current fix velocity — Open / Weekly Velocity                                           |
| **Risk Score**        | Weighted sum of open CVEs by severity — Weighted Open (C×8 H×3 M×1 L×1)                                                                       |
