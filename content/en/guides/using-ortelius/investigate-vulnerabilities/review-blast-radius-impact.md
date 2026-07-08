---
title: "Review Blast Radius / Impact"
linkTitle: "Review Blast Radius / Impact"
weight: 30
type: guides
description: >
  See every endpoint a vulnerable package actually reaches.
---

**Blast radius** is how far a vulnerable component's impact actually reaches — every deployed endpoint running a release that includes it, not just the release itself. See the [Glossary](../../../reference/glossary/) for the short definition.

From a CVE or package, Ortelius traces:

**Release → Endpoint**, using the sync records that describe what's currently deployed where, so you can see every Kubernetes cluster, VM, or serverless endpoint affected by a given vulnerability — not just the code repository it originated in.

This is the view to use when deciding remediation priority: a Critical CVE in a package deployed to twenty production endpoints is a very different problem than the same CVE in a package that only reaches a single staging environment.
