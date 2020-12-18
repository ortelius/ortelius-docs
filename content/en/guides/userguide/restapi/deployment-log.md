---
title: "Deployment Log APIs"
linkTitle: "Deployment Log APIs"
weight: 22
description: >
  Retrieve a deployment log.
---

Retrieve deployment log. This call returns a JSON object representing the specified deployment log.

### REST Api Endpoint

| HTTP Verb | URL |
| ---- | ----------- |
| GET | /dmadminweb/API/log/{lognumber} |

### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| lognumber | path | Is the deployment ID being retrieved. Note if the deployment log relates to an _Application_ outside of your _Domain_ access or to an _Application_ to which you do not have read access, then you will receive an error. | Yes | integer |

{{% include "guides/userguide/reusable/Model Deployment Log Result.md" %}}
{{% include "guides/userguide/reusable/Model Deployment Log.md" %}}
