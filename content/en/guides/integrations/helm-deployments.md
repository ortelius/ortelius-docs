---
title: "Helm Deployments"
linkTitle: "Helm Deployments"
weight: 80
type: guides
description: >
  Deploying Ortelius components with Helm.
---

Ortelius' self-hosted components — the backend, and the optional scanner jobs (`relscanner-job`, `osvdev-job`) — are designed to run on Kubernetes and are typically deployed via Helm charts.

The `osvdev-job` Helm chart, for example, sets a `MITRE_MAPPING_URL` environment variable — though note this is not currently read anywhere in that job's code, so treat it as reserved rather than a functioning setting (see [OSV.dev](../osv-dev/)).

For the full Kubernetes deployment example (replica configuration, resource limits, liveness probes), see the [Architecture Guide](../../developer-resources/core-concepts/architecture-guide/#deployment-architecture) in Core Concepts.
