---
title: "Define Your Endpoints"
linkTitle: "Define Your Endpoints"
weight: 7
description: >
  How to Define Endpoints for Environments
---
## Introduction to Endpoints

An _Endpoint_ is an object representing a container deployment host, virtual image, or physical server in an enterprise's data center. A Ortelius _Environment_ is a collection of _Endpoints_ to which your _Application_ will be deployed or from where your container will be deployed (container deployment host).

_Endpoints_ can be the location where you will run your Helm Chart for a Kubernetes deployment, a database server, cloud images, request routers, or WebSphere server. There is a many-to-many relationship between _Environments_ and _Endpoints_, so that an _Endpoint_ can be assigned to more than one _Environment_, and an _Environment_ can contain many _Endpoints_.

## Use the _Endpoint_ List View to Add or Delete

The _Endpoint_ menu is on the left of the main panel. Select the _Endpoint_ menu to view a list of all _Endpoints_ to which you have access. Or use the Search bar, represented by a funnel icon, to reorder _Endpoints_ based on Name or _Domain_.

The _Endpoints_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|**Refresh** | Refreshes the browser. |
| **Add** | Allows you to Add a new _Endpoint_. |
| **Delete** | Deletes the selected item. |

Double click on an item in the list to see the _Dashboard_.

## Use the _Endpoint_ Dashboard to View and Edit

The Dashboard view displays all information related to a specific _Endpoint_.

### Endpoint Details

| Field | Description |
| --- | --- |
| **Full Domain** | The fully qualified name of the _Domain_ to which the _Endpoint_ is defined.|
| **Name** | The name of the _Endpoint_ object. For managing Kubernetes clusters, you should name your _Endpoint_ to match the cluster name that the _Endpoint_ is deploying to.  This will allow Ortelius to track what has been deployed to each cluster.  |
| **Owner Type** | Group or User |
| **Owner** | The owner defaults to the _User_ or _Group_ who created it. |
| **Summary** | A short text description of the _Endpoint_. |
| **Created** | The date and time the _Endpoint_ was created. |
| **Modified**| The date and time the _Endpoint_ was last modified. |
| **Endpoint Operating System Type** | The platform type of the physical or virtual server that the _Endpoints_ resides on, the list currently includes Unix, Windows, Tandem, Stratus, and OpenVMS. For containers you should select Unix. |
| **Endpoint Types** | Used to indicate what types of _Components_ will be deployed to this _Endpoint_.  Used to route specific types of _Components_ to the matching _EndPoint_ across _Environments_.|
| **Hostname**| The unique name of a server that is used to identify it on the network. |
| **Protocol** | The protocol used to communicate with the _Endpoint_. Options are ssh and winrm. |
| **ssh Port Number** | The ssh Port used to connect to the _Endpoint_ if the selected Protocol is ssh. |
| **Base Directory** | If you would like to force all deployments to occur in a specific high level directory, enter it into this field. The _Endpoint_ Base Directory will override the _Component_ Base Directory. For more information see [Formatting Directories](/userguide/publishing-components/2-define-components/#formatting-of-the-deployment-directory-with-base-and-target-directories-for-database-and-application-file-deployments) on the order of how the deployment directory is formatted.|
| **Credential** | The Username and Password pair needed to login to the _Endpoint_. |
|**Test Connection Result**| The following fields display the result of the last "Test Connection" executed, performed by using the "Test Connection" option from the _Endpoint_ Dashboard.<ul><li>Name Resolution - Checks to see if the DNS name can be resolved. Returns "OK" on success or "Failed" if not. </li><li> Ping - Checks to see if the _Endpoint_ responds to ping. Returns "OK" on success or "Failed" if not.</li><li>Base Directory Check -Checks to ensure the Base Directory is available on the _EndPoint_ </li><li>Ping Time - Time in milliseconds (ms) for the Ping to respond.</li><li>IPV4 Address - The IP address of the Hostname.</li><li>Last Checked - Timestamp of when the last "Test Connection" was performed.</li><li>Test Results - Success or Failed message for the last "Test Connection" executed.</li></ul>|

{{% include "userguide/reusable/Attributes.md" %}}

### _Endpoint_ Access Control

The Access Section allows _Users_ within designated _Groups_ to update the _Endpoint_. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ within one of the Access lists will be granted access to the _Endpoint_ in the following ways:

| Access | Description |
| --- | --- |
|**View**| Any _User_ in any _Group_ in this list can see the selected _EndPoint_. |
|**Change**| Any _User_ in any _Group_ in this list can make changes to the _Endpoint_. |
|**Available Groups**|This list contains all the Groups within the Ortelius installation. Dragging and dropping back and forth between this list and the other two lists allows or prevents access to viewing and changing the selected _EndPoint_.

{{% include "userguide/reusable/AuditTrail.md" %}}

### Trends

The Trends graph shows you your success or failure rates overtime as well at the time required for the last 10 deployments. If an _Application_ deployment is taking longer than previous deployments, this might indicate an issue with your deployment logic.

### Deployed _Components_

This section provides a list of all current versions of _Components_ that have been installed on the _Endpoint_ with the Deployment Number. The Deployment Number is generated by Ortelius for each unique deployment.
