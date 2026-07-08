---
title: "Configure Endpoints"
linkTitle: "Configure Endpoints"
weight: 40
type: guides
description: >
  Set the type and environment for a deployment endpoint.
---

Most endpoints are created automatically as a byproduct of deployment tracking (see [Track Deployments](../../start-here/track-deployments/)), but you can also configure their metadata directly:

```json
{
  "name": "prod-us-east-1",
  "org": "acme",
  "endpoint_type": "eks",
  "environment": "production",
  "is_public": true
}
```

- **`endpoint_type`** — Kubernetes, Docker, VM, or Serverless, used for filtering on the dashboard.
- **`environment`** — Production, Staging, Development, or Test.

See [Endpoints](../../developer-resources/core-concepts/endpoints/) for the full object model, and [Configure Mission-Critical Endpoints](../configure-mission-critical-endpoints/) for tightening SLA targets on specific endpoints.
