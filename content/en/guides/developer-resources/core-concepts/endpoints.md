---
title: "Endpoints"
linkTitle: "Endpoints"
weight: 70
type: guides
description: >
  Where software actually runs.
---

An **endpoint** is a running environment where software is deployed — a Kubernetes cluster, cloud function, VM, or edge device.

```json
{
  "_key": "prod-us-east-1",
  "name": "prod-us-east-1",
  "org": "acme",
  "endpoint_type": "eks",
  "environment": "production",
  "is_public": true,
  "objtype": "Endpoint"
}
```

Endpoints can be filtered by **Status** (Active, Inactive, Error), **Environment** (Production, Staging, Development, Test), and **Endpoint Type** (Kubernetes, Docker, VM, Serverless) — see [Read Your Dashboard](../../../using-ortelius/read-your-dashboard/).

Endpoints marked `endpoint_type: mission_asset` use tighter SLA targets — see [Configure Mission-Critical Endpoints](../../../configure-ortelius/configure-mission-critical-endpoints/) and [SLA Reference](../../../reference/sla-reference/).

Endpoints are created automatically as a byproduct of [deployment tracking](../deployments/) — you generally don't create them by hand.
