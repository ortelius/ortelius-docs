---
title: "Deployment Integrations"
linkTitle: "Deployment Integrations"
weight: 305
description: >
  Integrating Ortelius with your Deployment Solution.
---

## Tracking Your Deployments in Ortelius

Ortelius uses the Command Line Interface for recording what occurs at both the build and deploy steps of your DevOps Pipeline. By recording the deployment activity Ortelius can track the location of each _Component Version_ and _Application Version_ running across all of your Environments. 

The benefit of allowing Ortelius to track your deployments is to create a unified high-level dashboard of where you are experiencing drift. Because each _Component_ may be deployed with a different deployment process, the data that displays this information is often stored in different tools. Ortelius serves as a centralized location of deployment intelligence and tracks your complete inventory in a single dashboard.


### The Ortelius Command Line Interface

The Ortelius Command Line Interface performs the action of monitoring the deployments executed by your pipeline.  

Install the Ortelius CLI to begin recording your deployments. Install the Ortelius CLI where your CI/CD server is running. Refer to the [Ortelius GitHub CLI Documentation](https://github.com/Ortelius/cli/blob/main/doc/dh.md) for installation instructions and usage. 

### Understanding Environments and Endpoints

Ortelius uses the concepts of _Environments_ and _Endpoints_ to track where a _Component_ has been deployed. The Command Line Interface will create these objects, but it is useful to understand how they are used. 


#### Intro to _Environments_

_Environments_ represent where you execute your _Application_ and _Components_ such as a Kubernetes Cluster for Dev, Test or Production. An _Environment_ could be a virtual cloud or physical datacenter.  _Applications_ run in many _Environments_ to support your Pipeline states.

#### _Environments_ and _Domains_

_Environments_ are associated to a [_Domain_](/guides/userguide/first-steps/2-defining-domains/). You can assign _Environments_ to any level of _Domain_ including the _Global Domain_. However, _Environments_ are most commonly associated to a _Project Domain_ used for _Applications_. A _Project Domain_ is used to manage an _Application_ and may be defined to include _Life Cycle Subdomains_ for managing your _Application's_ progression from development through release.

### Use the _Environment_ List View to Add and Delete

The _Environment_ menu is on the left of the main panel. Select the _Environment_ menu, to view a list of all _Environments_ to which you have access. The Search bar, represented by a funnel icon, allows you to reorder _Environments_ based on Name or _Domain_.

The _Environments_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|**Refresh** | Refreshes the browser. |
| **Add** | Allows you to Add a new _Environment_. |
| **Delete** | Deletes the selected item. |
| **Reports** | Success or Failed Report:  This report shows an ongoing list of all deployments to all _Environments_, regardless of _Domain_ or _Application_ with success or fail status. This report can be sorted based on the column for easy viewing. It can also be exported. |

Double click on an item in the list to see the _Dashboard_ view.

### Use the _Environment_ Dashboard to View and Edit

The Dashboard view displays all information related to a specific _Environment_. The Dashboard view has one additional tab option - Calendars. Below are the Details for an _Environment_.

#### _Environment_ Details

| Field | Description |
| --- | --- |
|**Full _Domain_**| The fully qualified name of the _Domain_, including all parent _Domains_.
| **Name**| The name of the _Environment_. Note: Duplicate Names are restricted. It is recommended that _Environments_ be named in a specific manner, such as 'DevEnv-HipsterStore.'|
|**Owner Type**| User or Group |
| **Owner**| The owner defaults to the _User_ or _Group_ who created it.  |
|**Summary**| A short text description of the _Environment_. |
| **Created** | Auto generated date and time the _Environment_ was created. |
| **Modified** | Auto generated date and time the _Environment_ was last modified. |

#### _Endpoint_ Access Control

The Access Section allows _Users_ within designated _Groups_ to update the _Environment_. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Environment_ in the following ways:

| Access | Description |
| --- | --- |
| **View** | Allows the _User_ to see the _Environment_. If the _User_ does not belong to a _Group_ in the View Access list, the _Environment_ will not appear in the List View. |
| **Change** | Allows the _User_ to change the _Environment's_ characteristics i.e. Name, Summary, etc. |
| **Deploy** | Allows _Users_ to deploy  _Applications_ into the selected _Environment_. |

{{% include "guides/userguide/reusable/AuditTrail-withDeployments.md" %}}

{{% include "guides/userguide/reusable/Attributes.md" %}}

#### Assigned _Endpoints_

Note: You will need to have pre-defined your _Endpoints_.  See the [Define Your Endpoints](/guides/userguide/first-steps/2-define-endpoints/) chapter for more information.

_Environments_ are a collection of _Endpoints_. Use this section to assign the _Endpoints_ that will make up this _Environment_. Use +Add to create a new row in the _Endpoints_ table. Use Save to commit the row.  Select the row and use Edit or Delete to update or remove an _Endpoint_. When you add a new _Endpoint_ the  Hostname will be displayed. The Hostname is the actual network name or IP address.  It is assigned when the _Endpoint_ is defined, but is not a required field. If it is defined, it will be displayed in the row.

### Trends

This section shows the success/failure rate and time required for the last 10 deployments to this _Environment_.

#### Assigned _Applications_

View all the _Application Base Versions_ assigned to this _Environment_. This is read only.  _Applications Base Versions_ are associated to _Environments_ when created using the [_Application_ Dashboard](/guides/userguide/packaging-applications/2-defining-applications/#viewing-and-editing-with-the-_application_-dashboard).

#### Deployed _Components_ to _Environment_ Map

This map shows you all of the current _Component Versions_, with _Application Versions_, that have been deployed to this _Environment_.

#### Environment Calendars Tab

**Ortelius** _Calendar_ only shows you a history of what has already been deployed.


### Introduction to Endpoints

An _Endpoint_ is an object representing a container deployment host, virtual image, or physical server in an enterprise's data center. An Ortelius _Environment_ is a collection of _Endpoints_ to which your _Application_ will be deployed.

_Endpoints_ can be the location where you will run your Helm Chart for a Kubernetes deployment, a database server, cloud images, etc. There is a many-to-many relationship between _Environments_ and _Endpoints_, so that an _Endpoint_ can be assigned to more than one _Environment_, and an _Environment_ can contain many _Endpoints_.

#### Use the _Endpoint_ List View to Add or Delete

The _Endpoint_ menu is on the left of the main panel. Select the _Endpoint_ menu to view a list of all _Endpoints_ to which you have access. Or use the Search bar, represented by a funnel icon, to reorder _Endpoints_ based on Name or _Domain_.

The _Endpoints_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|**Refresh** | Refreshes the browser. |
| **Add** | Allows you to Add a new _Endpoint_. |
| **Delete** | Deletes the selected item. |

Double click on an item in the list to see the _Dashboard_.

#### Use the _Endpoint_ Dashboard to View and Edit

The Dashboard view displays all information related to a specific _Endpoint_.

#### Endpoint Details

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
| **Base Directory** | If you would like to force all deployments to occur in a specific high level directory, enter it into this field. The _Endpoint_ Base Directory will override the _Component_ Base Directory. For more information see [Formatting Directories](/guides/userguide/publishing-components/2-define-components/#formatting-of-the-deployment-directory-with-base-and-target-directories-for-database-and-application-file-deployments) on the order of how the deployment directory is formatted.|
|**Test Connection Result**| The following fields display the result of the last "Test Connection" executed, performed by using the "Test Connection" option from the _Endpoint_ Dashboard.<ul><li>Name Resolution - Checks to see if the DNS name can be resolved. Returns "OK" on success or "Failed" if not. </li><li> Ping - Checks to see if the _Endpoint_ responds to ping. Returns "OK" on success or "Failed" if not.</li><li>Base Directory Check -Checks to ensure the Base Directory is available on the _EndPoint_ </li><li>Ping Time - Time in milliseconds (ms) for the Ping to respond.</li><li>IPV4 Address - The IP address of the Hostname.</li><li>Last Checked - Timestamp of when the last "Test Connection" was performed.</li><li>Test Results - Success or Failed message for the last "Test Connection" executed.</li></ul>|

{{% include "guides/userguide/reusable/Attributes.md" %}}

#### _Endpoint_ Access Control

The Access Section allows _Users_ within designated _Groups_ to update the _Endpoint_. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ within one of the Access lists will be granted access to the _Endpoint_ in the following ways:

| Access | Description |
| --- | --- |
|**View**| Any _User_ in any _Group_ in this list can see the selected _EndPoint_. |
|**Change**| Any _User_ in any _Group_ in this list can make changes to the _Endpoint_. |
|**Available Groups**|This list contains all the Groups within the Ortelius installation. Dragging and dropping back and forth between this list and the other two lists allows or prevents access to viewing and changing the selected _EndPoint_.

{{% include "guides/userguide/reusable/AuditTrail.md" %}}

#### Trends

The Trends graph shows you your success or failure rates overtime as well at the time required for the last 10 deployments. If an _Application_ deployment is taking longer than previous deployments, this might indicate an issue with your deployment logic.

#### Deployed _Components_

This section provides a list of all current versions of _Components_ that have been installed on the _Endpoint_ with the Deployment Number. The Deployment Number is generated by Ortelius for each unique deployment.

