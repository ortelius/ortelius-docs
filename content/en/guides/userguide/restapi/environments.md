---
title: "Environment APIs"
linkTitle: "Environment APIs"
weight: 26
description: >
  Get a list of Environments.
---

## Retrieve SBOM PDF for a Environment

See [ms-sbom-export microservice Swagger](https://github.com/ortelius/ms-sbom-export?tab=readme-ov-file#readme)


## List Environments

This call returns an array of JSON objects representing each _Environment_ to
which the logged-in _User_ has access.

If the all parameter is not specified then only the _Environments_ associated with the _User's_ home _Domain_ are listed. If the all parameter is specified and is set to "y", for yes, then the result includes the _Environments_ included in any accessible _Subdomains_.

### REST Api Endpoint

| HTTP Verb | URL                          |
|-----------|------------------------------|
| GET       | /dmadminweb/API/environments |

### Parameters

| Name | Located in | Description | Required | Schema |
|------|------------|-------------|----------|--------|
| all  | query      | y or n      | No       | string |

{{% include "/guides/userguide/reusable/Model Environments Result.md" %}}
{{% include "/guides/userguide/reusable/Model Environment.md" %}}

## Retrieve specific _Environment_

This call returns a JSON object representing the specified _Environment_.

### REST Api Endpoint

| HTTP Verb | URL |
| ---- | ----------- |
| GET | /dmadminweb/API/environment/{identifier}

### Parameters

| Name       | Located in | Description                                                                                                                                                               | Required | Schema |
|------------|------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|--------|
| identifier | path       | Is the identifier of the _Environment_. Either its name, its qualified name with its parent _Domains_ included in dot notations (i.e. GLOBAL.Product) or its internal ID. | Yes      | string |

{{% include "/guides/userguide/reusable/Model Success.md" %}}
{{% include "/guides/userguide/reusable/Model Environments Result.md" %}}


