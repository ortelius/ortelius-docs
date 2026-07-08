---
title: "Read Your Dashboard"
linkTitle: "Read Your Dashboard"
weight: 10
type: guides
description: >
  How to interpret every section of the Ortelius dashboard.
aliases:
  - /guides/userguide/read-your-dashboard/
  - /guides/userguide/frontend/
---

The dashboard is organized into five sections. All metrics use a **rolling 180-day window** and reflect the **NIST Recommended SLA Policy** (Critical 15d · High 30d · Medium 90d · Low 180d) unless you configure a different policy — see [Configure SLA Policy](../../configure-ortelius/configure-sla-policy/).

## Filtering what you see

- **Vulnerability filters**: Severity (Critical, High, Medium, Low, Clean), OpenSSF Score (High 8.0+, Medium 6.0–7.9, Low <6.0), Name/Package, CVE ID.
- **Endpoint filters**: Status (Active, Inactive, Error), Environment (Production, Staging, Development, Test), Endpoint Type (Kubernetes, Docker, VM, Serverless).
- **Org visibility**: My Orgs (repos/releases under your organizations) vs. Public (any publicly tracked repo).

## Views available beyond the dashboard

- **Organizations** — portfolio-level security overview
- **Synced Endpoints** — where software is running (K8s, Docker, VMs)
- **Project Releases** — vulnerability tracking by release version
- **Vulnerabilities** — CVE database with CVSS scoring (see [Investigate Vulnerabilities](../investigate-vulnerabilities/))
- **Mitigations** — actionable remediation view of open vulnerabilities

## Compliance frameworks

Dashboard metrics are designed to support reporting against:

- NIST SP 800-53 Rev. 5 — SI-2 (Flaw Remediation)
- NIST SP 800-137 — Information Security Continuous Monitoring
- NIST SP 800-190 — Application Container Security Guide
- NIST SP 800-218 (SSDF) — RV.1 (Identify and Confirm Vulnerabilities), RV.2 (Assess, Prioritize, and Remediate Vulnerabilities)
- Executive Order 14028 — Improving the Nation's Cybersecurity
- DoD Continuous ATO — DevSecOps Requirements
