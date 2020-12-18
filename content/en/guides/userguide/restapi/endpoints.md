---
title: "Endpoint APIs"
linkTitle: "Endpoint APIs"
weight: 24
description: >
  APIs for retrieving and updating Endpoints..

---

## Get a List of _EndPoints_

This call returns an array of JSON objects representing each _Endpoint_ to which the logged-in _User_ has access.

If the all parameter is not specified then only the _Endpoint_ associated with the _User's_ home _Domain_ are listed. If the "all" parameter is specified and is set to "y", for Yes, then the result includes the _Applications_ included in any accessible _Subdomains.

### REST Api Endpoint

| HTTP Verb | URL |
| ---- | ----------- |
| GET | /dmadminweb/API/servers |

### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| all | query | y or n | No | string |

{{% include "guides/userguide/reusable/Model Endpoints Result.md" %}}
{{% include "guides/userguide/reusable/Model Endpoints.md" %}}

## Retrieve Specific _Endpoint_

This call returns a JSON object representing the specified _Endpoint_.

### REST Api Endpoint

| HTTP Verb | URL |
| ---- | ----------- |
| GET | /dmadminweb/API/server/{identifier} |

### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| identifier | path | Is the identifier of the _Endpoint_. Either its name, its qualified name with its parent _Domains_ included in dot notation (i.e. GLOBAL.Product) or its internal ID. | Yes | string |

{{% include "guides/userguide/reusable/Model Endpoint Result.md" %}}
{{% include "guides/userguide/reusable/Model Endpoints.md" %}}

## Assign an _Endpoint_ to an _Environment_**

This call allows an existing _Endpoint_ to be associated with an existing _Environment_. Once the _Endpoint_ is associated with an _Environment_ it can receive _Components_ during a deployment.

_Endpoint_ can be associated with more than one _Environment_. Assigning an _Endpoint_ to an _Environment_ will not disassociate the _Endpoint_ from any other _Environment_ with which it may be already associated. To move an _Endpoint_ between _Environments_ see  the "Disassociate an _Endpoint_ from and _Environment_" below to remove the _Endpoint_ from the original _Environment_.

### REST Api Endpoint

| HTTP Verb | URL |
| ---- | ----------- |
| GET | /dmadminweb/API/assign/server/{server_id}/{env_id} |

### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| server_id | path | Is the identifier of the_Endpoint_to be assigned. Either its name, its qualified name with its parent_Domains_ included in dot notation (i.e. GLOBAL.Product)) or its internal ID. | Yes | integer |
| env_id | path | Is the identifier of the_Environment_to which the_Endpoint_should be assigned. Either its name, its qualified name with its parent_Domains_ included in dot notation (i.e. GLOBAL.Product)) or its internal ID. | Yes | string |

{{% include "guides/userguide/reusable/Model Success.md" %}}

## Disassociate a _Endpoint_ from an _Environment_

### Description

This call disassociates a server from an environment. When the server is disassociated from the environment then any subsequent deployments to that environment will not result in any files or operations being directed at the server.

This call does not delete the server - it simply disassociates it from the environment. To delete a server use the API/del/server call.

### REST Api Endpoint

| HTTP Verb | URL |
| ---- | ----------- |
| GET | /dmadminweb/API/unassign/server/{server_id}/{env_id}

### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| server_id | path | Is the identifier of the_Endpoint_to be assigned. Either its name, its qualified name its parent_Domains_ included in dot notation (i.e. GLOBAL.Product) or its internal ID. | Yes | integer |
| env_id | path | Is the identifier of the_Environment_to which the_Endpoint_should be assigned. Either its name, its qualified name with its parent_Domains_ included in dot notation (GLOBAL.Product) or its internal ID. | Yes | string |

{{% include "guides/userguide/reusable/Model Success.md" %}}
