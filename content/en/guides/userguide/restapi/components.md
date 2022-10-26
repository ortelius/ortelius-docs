---
title: "Component APIs"
linkTitle: "Component APIs"
weight: 14
description: >
  APIs for _Components_.
---


## Retrieve a _Component_

Retrieve specific _Component_ or _Component_ version. This call returns a JSON Object representing the specified _Component_. It is useful to determine the _Application_(s) which include the _Component_, whether the _Application_ is approved, which other _Components_ are used alongside the specified _Component_ and so on.

### REST Api Endpoint

| HTTP Verb | URL |
| ---- | ----------- |
| GET |  dmadminweb/API/component/{identifier} |

### Parameters

| Name | Located in | Value | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| latest | query | If latest is set to Y, for "Yes",  then the latest version of the _Component_ is returned.  To use this flag, the specified identifier must refer to a  _Component Base Version_, otherwise the flag has no effect. | No | string |
| branch | query | If branch is set along with latest then the latest version on the specified branch name is returned. | Yes | string |
| identifier | path | Is the identifier of the _Component_. Either its name, its qualified name with its parent _Domains_ included in dot notation (i.e. GLOBAL.Products) or its internal ID. | Yes | string |

{{% include "guides/userguide/reusable/Model Component Result.md" %}}
{{% include "guides/userguide/reusable/Model Component.md" %}}
{{% include "guides/userguide/reusable/Model Component Predecessor.md" %}}
{{% include "guides/userguide/reusable/Model Component Version Result.md" %}}
{{% include "guides/userguide/reusable/Model Component Version Full.md" %}}
{{% include "guides/userguide/reusable/Model Application Version Full.md" %}}
{{% include "guides/userguide/reusable/Model Application Version.md" %}}
{{% include "guides/userguide/reusable/Model Request.md" %}}
{{% include "guides/userguide/reusable/Model Approve or Reject.md" %}}

## Create New _Component Version_

This call creates a new _Component Version_. The new _Component_ inherits all the attributes of the predecessor _Component_ including its _Domain_.

### REST Api Endpoint

| HTTP Verb | URL |
| ---- | ----------- |
| GET |  /dmadminweb/API/new/compver/{comp_id} |

### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| comp_id | path | Is the ID of the_Component_which will be the parent of the new_Component Version_. Either its name, its qualified name with its parent_Domains_included in dot notation (i.e. GLOBAL.Product) or its internal ID. The newly created_Component Version_will inherit all the attributes from this_Component_. | Yes | integer |

{{% include "guides/userguide/reusable/Model Component Result.md" %}}
{{% include "guides/userguide/reusable/Model Success.md" %}}

## Associate a Build with a _Component_

This call associates a build number with a specified _Component_. It is typically used with _CD Engines_ to notify that a new build has been performed. If the _Component_ is associated with an approved _Application_ then a new version of the _Component_ and _Application_ is created automatically and the new _Component_ version replaces the old _Component_ version in the newly created _Application_ version.

In order for this to work through the permission model, the associated "Create _Application_ Version" Task needs to be specified. This ensures that the invoking user has permission to create a new version of the _Application_ (since the permissions are checked against the named Task) and also the target _Domain_ (i.e. the domain in which the new _Application_ is created) is determined from the Task. Also, by specifying the Task to execute, any Pre and Post link _Actions_ are executed just as if the Task had been invoked via the Web UI.

### REST Api Endpoint

| HTTP Verb | URL |
| ---- | ----------- |
| GET |  /dmadminweb/API/buildid/{comp_id}/{build_id} |

### Parameters

| Name | Located in | Value | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| comp_id | path | Is the ID of a_Component Base Version_. The latest version of this_Component_will be found and associated to the build with that_Component Version_. If "branch" is specified then the latest version on the branch is located. The_Component_can be specified using either its name, its qualified name with its parent_Domains_ included in dot notation (i.e. GLOBAL.Products) or its internal ID. | Yes | integer |
| build_id | path | Is the numeric build ID to associate with the latest version of_Component_ID (comp_id). | Yes | integer |
| taskname | query | Is the identifier of a "Create New _Application_ Task" to execute in order to create the new _Application Version_. Either its name, its qualified name with its _Domain_ and any parent _Domains_ included in dot notation (i.e. GLOBAL.Product) or its internal ID. | Yes | string |
| commit | query | Is the commit ID which triggered the build. | No | string |
| issue | query | Is a change request id to associate with this build. If you add an issue then the specified _Component_ must have an associated Change Request _Data Source_ associated with it. This is because the API  will query the change tracking tool in order to retrieve the description of the change and the current status. If the _Component_ does not have such a Change Request _Data Source_ an error is returned.  You can specify one or more issue parameters if you need to associate multiple change requests with this build or use the issues parameter to specify multiple change requests. | No | string |
| issues | query | Is a comma-separated list of change request ids. This is equivalent to specifying multiple issue parameters. | No | string |
| file | query | Is a filename to record against the build. This is typically a file that was changed that resulted in a build being performed. You can specify one or more file parameters if you need to associate multiple files with this build or use the files parameter to specify multiple files. | No | string |
| files | query | Is a comma-separated list of files. This is equivalent to specifying multiple file parameters. | No | string |

{{% include "guides/userguide/reusable/Model Component Result.md" %}}
{{% include "guides/userguide/reusable/Model Success.md" %}}
