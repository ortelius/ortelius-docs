---
title: "Credential APIs"
linkTitle: "Credentials APIs"
weight: 16
description: >
  Create a new Credential.
---

## Create a _Credential_

This call creates a new credential. All of the attributes of the new _Credential_ are set through parameters to the API. If "_Domain_" is not specified then the _Environment_ is created in the logged in _User's_ home _Domain_.

### REST Api Endpoint

| HTTP Verb | URL |
| ---- | ----------- |
| GET | /dmadminweb/API/new/credential/{cred_id} |

### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| cred_id | path | Is the name of the_Credential_ to be created. | Yes | string |
| domain | query | Is the identifier of the _Domain_ in which the _Credential_ is to be created. Either its name, its qualified name with its parent _Domains_ included in dot notation (i.e. GLOBAL.Product) or its internal ID. | Yes | string |
| summary | query | Is the summary text for the _Credential_. | No | string |
| kind | query | The type of _Credential_ to create. Must be one of -<li>encrypted - The username and password are held encrypted in the database.</li><li>vars - The username and password contain variable names to be expanded when the _Credential_ is used. Held un-encrypted in the database.</li><li>ppk - Public/Private Key file.</li><li>dfo- DFO filename for use with CA Harvest.</li>| No | string |
| username | query | Required for _Credential_ of kind encrypted, vars or ppk. The username to be stored against the _Credential_. | No | string |
| password | query | Required for _Credential_ of kind encrypted and vars. The password to be stored against the credential. | No | string |
| keyfile | query | Required for _Credential_ of kind ppk. The path of the private keyfile to be used by the _Credential_. | No | string |
| filename | query | Required for _Credential_ of kind dfo. The path of the Harvest DFO file containing the encrypted username/password. | No | string |

{{% include "userguide/reusable/Model Success.md" %}}

## Modify a _Credential_

This call modifies an existing _Credential_. The attributes of the _Credential_ are modified through parameters to the API.

### REST Api Endpoint

| HTTP Verb | URL |
| ---- | ----------- |
| GET | /dmadminweb/API/new/credential/{cred_id} |

### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| cred_id | path | Is the ID of the_Credential_ to be modified. Either its name, its qualified name (i.e. with its parent domain(s) included in dot notation) or its internal ID. | Yes | string |
| domain | query | Is the identifier of the _Domain_ in which the _Credential_ is to be created. Either its name, its qualified name with its parent _Domains_ included in dot notation (i.e. GLOBAL.Products) or its internal ID. | Yes | string |
| summary | query | Is the summary text for the _Credential_. | No | string |
| kind | query | The type of _Credential_ to create. Must be one of -<li>encrypted - The username and password are held encrypted in the database.</li><li>vars - The username and password contain variable names to be expanded when the _Credential_ is used. Held un-encrypted in the database.</li><li>ppk - Public/Private Key file.</li><li>dfo- DFO filename for use with CA Harvest.</li>| No | string |
| username | query | Required for _Credential_ of kind encrypted, vars or ppk. The username to be stored against the credential. | No | string |
| password | query | Required for _Credential_ of kind encrypted and vars. The password to be stored against the credential. | No | string |
| keyfile | query | Required for _Credential_ of kind ppk. The path of the private keyfile to be used by the credential. | No | string |
| filename | query | Required for _Credential_ of kind dfo. The path of the Harvest DFO file containing the encrypted username/password. | No | string |

{{% include "userguide/reusable/Model Success.md" %}}

## Deleting a Credential

This call deletes a _Credential_.

### REST Api Endpoint

| HTTP Verb | URL |
| ---- | ----------- |
| GET | /dmadminweb/API/del/credential/{cred_id} |

### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| cred_id | path | Is the ID of the_Credential_to be deleted. Either its name, its qualified name with its parent_Domain_ included in dot notation (i.e. GLOBAL.Products) or its internal ID. | Yes | string |

{{% include "userguide/reusable/Model Success.md" %}}
