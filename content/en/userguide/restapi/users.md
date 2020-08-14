---
title: "User APIs"
linkTitle: "User APIs"
weight: 30
description: >
  Associate a User to a UserGroup (Pro Feature).
---


## Associate a User with a UserGroup

This call assigns an existing _User_ to a _Group_. Once a user has been assigned to the group then the _User_ will have access to any object to which the _Group_ has been granted appropriate access.

### REST Api Endpoint

| HTTP Verb | URL |
| ---- | ----------- |
| GET | /dmadminweb/API/assign/user/{user_id}/{group_id} |

### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| user_id | path | Is the identifier of the_User_to be assigned. Either its Name, its qualified name with its parent_Domains_ included in dot notation (i.e. GLOBAL.Product) or its internal ID. | Yes | integer |
| group_id | path | Is the identifier of the_Group_to which the_User_should be assigned. Either its name, with its parent_Domains_ included in dot notation (i.e. GLOBAL.Product) or its internal ID. | Yes | string |

{{% include "userguide/reusable/Model Success.md" %}}

## Disassociate a User from a User Group

This call disassociates a _User_ from a _Group_. Once a _User_ has been removed from the _Group_ they no longer have access to any object to which access has been granted through the _Group_.

### REST Api Endpoint

| HTTP Verb | URL |
| ---- | ----------- |
| GET | /dmadminweb/API/unassign/user/{user_id}/{group_id} |

### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| user_id | path | Is the identifier of the_User_to be assigned. Either its name, its qualified name with its parent_Domains_ included in dot notation (i.e. GLOBAL.Product) or its internal ID. | Yes | integer |
| group_id | path | Is the identifier of the_Group_to which the_User_should be assigned. Either its qualified name with its parent_Domains_ included in dot notation (i.e. GLOBAL.Product) or its internal ID. | Yes | string |

{{% include "userguide/reusable/Model Success.md" %}}
