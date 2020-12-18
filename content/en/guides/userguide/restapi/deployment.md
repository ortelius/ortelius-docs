---
title: "Deployment APIs"
linkTitle: "Deployment APIs"
weight: 20
description: >
  Start a deployment for a specified Application
---

## Start Deployment

This call starts a deployment of the specified _Application_ into the specified _Environment_.

In order for API deployments to work through the permission model, there has to be a Deploy task either in the _Domain_ in which the specified _Application_ is located or in any of the parent _Domains_ if the Deploy task is set to be available to _Subdomains_. This mechanism ensures that the invoking user has permission to deploy the _Application_ (since the permissions are checked against the Task). Also, by specifying the Task to execute, any Pre and Post link _Actions_ are executed just as if the task had been invoked via the Web UI.

Note - Any additional parameters are created as Global Variables accessible with a url_prefix. For example, if you passed "myparam=123" as a parameter in the "deploy" api call, it would be available as $url_myparam.

### REST Api Endpoint

| HTTP Verb | URL |
| ---- | ----------- |
| GET | /dmadminweb/API/deploy/{app_id}/{env_id} |

### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| wait | query | If the wait parameter is not specified - or is specified and set to Y - then the call does not return until the deployment is complete. If the wait parameter is set to N then the call returns as soon as the deployment has been instigated but before it completes. In both cases, the deployment id is returned.  | No | string |
| task | query | Is the identifier of a Deploy task to execute in order to perform the deployment. Either its name, its qualified name with its domain and any parent _Domains_ included in dot notation(i.e. GLOBAL.Product) or its internal ID. If the task is not specified, the first accessible Deploy Task within the _Application's_ _Domain_ is used (or any Deploy Task in parent _Domain_ if they are set to be "available" to _Subdomains).  | No | string |
| app_id | path | Is the identifier of an_Application_. Either its name, its qualified name with its parent_Domain included in dot notation (i.e. GLOBAL.Product) or its internal ID. | Yes | string |
| env_id | path | Is the identifier of an_Environment_. Either its name, its qualified name with its parent_Domains_ included in dot notation (i.e. GLOBAL.Product) or its internal ID. | Yes | string |

{{% include "guides/userguide/reusable/Model Deployment Result.md" %}}
