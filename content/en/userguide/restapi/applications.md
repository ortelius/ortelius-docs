---
title: "Application APIs"
linkTitle: "Applications APIs"
weight: 10
description: >
  APIs for Applications.
---

## Get a List _Applications_

This call returns an array of JSON objects representing each _Application_ to which the logged-in _User_ has access.

If the "all" parameters is not specified then only the _Applications_ associated with the _User's_ home _Domain_ are listed. If the "all" parameter is specified by setting it to "y" then the result includes the _Applications_ in all accessible _Subdomains_.

**REST Api Endpoint**

| HTTP Verb | URL |
| ---- | ----------- |
| GET |  /dmadminweb/API/applications |

**Parameters**

| Name | Located in | Value| Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| all | query | y or n | No | string |

{{% include "userguide/reusable/Model Application Result.md" %}}
{{% include "userguide/reusable/Model Application.md" %}}
{{% include "userguide/reusable/Model Application Version.md" %}}

## Retrieve specific _Application_ or _Application Version_

This call returns a JSON object representing the specified _Application_. The resulting JSON will vary slightly depending on whether the specified _Application_ is an _Application Base Version_ or an _Application Version_.

**REST Api Endpoint**

| HTTP Verb | URL |
| ---- | ----------- |
| GET | /dmadminweb/API/application/{identifier} |

**Parameters**

| Name | Located in | Value | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| latest | query | If latest is set to "Y" then the latest version of the _Application_ is returned.  To use this flag, the specified identifier must refer to a _Application Base Version_, otherwise the flag has no effect. | No | string |
| branch | query | If branch is set along with latest then the latest version on the specified branch name is returned. | Yes | string |
| identifier | path | Is the identifier of the _Application_. Either its name, its qualified name with its parent _Domains_ included in dot notation (i.e GLOBAL.Product) or its internal ID. | Yes | string |

{{% include "userguide/reusable/Model Application Version Result.md" %}}
{{% include "userguide/reusable/Model Application Version.md" %}}

## Create New Application Version

This call creates a new _Application Version_. The new _Application Version_ inherits all the attributes of the predecessor _Application_. In order for this to work through the permission model, there has to be a _Create Version Task_ either in the _Domain_ in which the specified _Application_ is located or in any of the parent _Domains_ as long as the _Create Version Task_ is set to be "available" to _Subdomains_.

This mechanism ensures that the invoking user has permission to create a new version of the _Application_ (since the permissions are checked against the _Task_) and also the target _Domain_ (i.e. the _Domain_ in which the new _Application_ is created) is determined from the _Task_. Also, by specifying the _Task_ to execute, any pre and post link _Actions_ are executed just as if the _Task_ had been invoked via the Web UI.

**REST Api Endpoint**

| HTTP Verb | URL |
| ---- | ----------- |
| GET | /dmadminweb/API/new/appver/{app_id} |

**Parameters**

| Name | Located in | Value| Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| app_id | path | Is the ID of the_Application_which will be the parent of the new_Application Version_. Either its name, its qualified name with its parent_Domains_included in dot notation (i.e. GLOBAL.products) or its internal ID. The newly created_Application Version_will inherit all the attributes from this_Application_. | Yes | integer |
| task | query | Is the identifier of a _Task_ to execute in order to create the new _Application Version_. Either its name, its qualified name with its _Domain_ and any parent _Domains_ included in dot notation (i.e. GLOBAL.Product) or its internal ID. If the _Task_ is not specified, the first accessible _Create Version Task_ within the _Application's_ _Domain_ is used (or any _Create Version Task_ in parent _Domains_ as long as they are set to be "available" to _Subdomains_). | No | string |

{{% include "userguide/reusable/Model Success.md" %}}

## Replace Component

Replace a _Component_ within an _Application_. This call replaces a specific _Component_ within an _Application_. You can use this to update the version of a _Component_ within an _Application_ by replacing the old _Component Version_ with the new.

**REST Api Endpoint**

| HTTP Verb | URL |
| ---- | ----------- |
| GET | /dmadminweb/API/new/replace/{app_id}/{old_comp_id}/{new_comp_id} |

**Parameters**

| Name | Located in | Value | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| app_id | path | Is the ID of the_Application_with which the old_Component_ID (Comp_id) is associated. Either its name, its qualified name with its parent _Domains_ included in dot notation, (i.e GLOBAL.Product) or its internal ID. | Yes | integer |
| old_comp_id | path | Is the ID of the _Component_ (Comp_id) which is to be replaced. Either its name, its qualified name with its parent_Domains_ included in dot notation (i.e. GLOBAL.Products) or its internal ID. | Yes | integer |
| new_comp_id | path | Is the ID of the _Component_ which will replace old _Component_ ID (comp_id). Either its name, its qualified name with its parent_Domains_ included in dot notation (i.e GLOBAL.Product)  or its internal ID. | Yes | integer |

{{% include "userguide/reusable/Model Success.md" %}}

## Approving an Application

This call allows the API to approve/reject an _Application_ for a specified _Domain_.
In order for this to work through the permission model, there has to be an _Approve Task_ either in the _Domain_ in which the specified _Application_ is located or in any of the parent _Domains_ as long as the _Approve Task_ is set to be "available" to _Subdomains_.

This mechanism ensures that the invoking user has permission to approve the _Application_ (since the permissions are checked against the named _Task_) and also the target _Domain_ (i.e. the _Domain_ to which the _Application_ is being approved/rejected) is determined from the _Task_. Also, by specifying the _Task_ to execute, any Pre and Post _Actions_ are executed just as if the _Task_ had been invoked via the Web UI.

**REST Api Endpoint**

| HTTP Verb | URL |
| ---- | ----------- |
| GET | /dmadminweb/API/approve/{app_id} |

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| app_id | path | Is the identifier of the_Application_to be approved/rejected. Either its name, its qualified name with its parent_Domains_ included in dot notation (i.e.GLOBAL.Products) or its internal ID. | Yes | integer |
| task | query | Is the identifier of a task to execute in order to approve the _Application_. Either its name, its qualified name with its _Domain_ and any parent _Domains_ included in dot notation (i.e GLOBAL.Product) or its internal ID. If the _Task_ is not specified, the first accessible _Approve Task_ within the _Application's_ _Domain_ is used or any _Approve task_ in the parent _Domains_ as long as they are set to be "available" to _Subdomains_. | No | string |
| approve | query | Is optional. If specified and set to N for "no," then the _Application_ is rejected. If this parameter is not specified or is set to Y for "yes," then the _Application_ is approved. | No | string |
| notes | query | Any free-text notes that should be associated with the approval/rejection. | No | string |

{{% include "userguide/reusable/Model Success.md" %}}

## Associate an _Application_ to an _Environment_

This call associates an existing _Application_ with an _Environment_. This association allows the _Application_ (or any of its Versions) to be deployed to that _Environment_. An _Application_ needs to be assigned to an _Environment_ before it can be deployed to that _Environment_.

**REST Api Endpoint**

| HTTP Verb | URL |
| ---- | ----------- |
| GET | /dmadminweb/API/approve/{app_id} |/dmadminweb/API/assign/application/{app_id}/{env_id} |

**Parameters**

| Name | Located in | Value | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| app_id | path | Is the identifier of the_Application_to be assigned. Either its name, its qualified name with its parent_Domains_ included in dot notation (i.e GLOBAL.Product) or its internal ID. | Yes | integer |
| env_id | path | Is the identifier of the_Environment_to which the_Endpoint_should be assigned. Either its name, its qualified name with its parent_Domains_ included in dot notation (i.e GLOBAL.Product)  or its internal ID. | Yes | string |

{{% include "userguide/reusable/Model Success.md" %}}

## Disassociates an _Application_ from an _Environment_

This call removes, or disassociates, an _Application_ from an _Environment_. Once the _Application_ has been disassociated from the _Environment_ neither it nor any of its Versions can be deployed to that _Environment_.

Disassociating an _Application_ from an _Environment_ does not physically remove the _Application_ from the _Environment_. It simply prevents deploying any Version of the _Application_ to the _Environment_.

**REST Api Endpoint**

| HTTP Verb | URL |
| ---- | ----------- |
| GET | /dmadminweb/API/unassign/application/{app_id}/{env_id} |

**Parameters**

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| app_id | path | Is the identifier of the_Application_to be assigned. Either its name, its qualified name with its parent_Domains_ included in dot notation (i.e GLOBAL.Product) or its internal ID. | Yes | integer |
| env_id | path | Is the identifier of the_Environment_to which the server should be assigned. Either its name, its qualified name with its parent_Domains_ included in dot notation (i.e GLOBAL.Product)  or its internal ID. | Yes | string |

{{% include "userguide/reusable/Model Success.md" %}}
