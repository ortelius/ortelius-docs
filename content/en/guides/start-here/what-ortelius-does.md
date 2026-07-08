---
title: "What Ortelius Does"
linkTitle: "What Ortelius Does"
weight: 10
type: guides
description: >
  A quick summary of the problem Ortelius solves and how it solves it.
aliases:
  - /guides/userguide/
---

When a critical open source vulnerability is disclosed, most security teams face the same four questions in rapid succession — and struggle to answer any of them quickly:

- **What exactly is the threat?** The CVE ID, CVSS score, and enough detail to know whether it's exploitable in your environment.
- **Where in your codebase do you fix it?** Which repo, which package, and which version introduced the vulnerable dependency.
- **Where is that code actually running right now?** Not where it was deployed last quarter — where it is live in production today, whether that's a Kubernetes cluster, a cloud function, or an edge device in the field.
- **How do you actually fix it?** The upgraded version and a clear remediation path so nothing falls through the cracks.

Ortelius answers all four questions in a single platform. It ingests your Software Bill of Materials (SBOM) at build time, matches your deployed components against the OSV vulnerability database every 15 minutes, tracks every CVE from the moment it is introduced into a release through every environment it reaches until it is remediated, and measures how long each step takes against your SLA targets.

## The short version

1. Ortelius learns what's in your software (SBOMs) and where it runs (endpoints).
2. It continuously matches those components against known vulnerabilities (CVEs).
3. It tracks each vulnerability from detection to remediation, measured against your SLA policy.
4. Your dashboard shows exactly where you stand — and where to focus next.

## Where to go next

- New here and not sure if Ortelius fits your team? See [Who Should Use Ortelius](../who-should-use-ortelius/).
- Ready to see it without setting anything up? See [Quick Tour with Sample Data](../quick-tour-with-sample-data/).
- Ready to get your own data in? See [Choose Your Installation Type](../choose-your-path/) to sign up or install.
