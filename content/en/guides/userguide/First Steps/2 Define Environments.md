---
title: "Track Environments to Applications"
linkTitle: "Track Environments to Applications"
weight: 5
description: >
  Track Environments to Applications
---
## Intro to _Environments_

_Environments_ represent where you execute your _Application_ or where your _Application_ is published. An _Environment_ could be a virtual cloud or artifact repository. 
 

### _Environments_ and _Domains_

_Environments_ are associated to a [_Domain_](/guides/userguide/first-steps/2-defining-domains/). You can assign _Environments_ to any level of _Domain_ including the _Global Domain_. However, _Environments_ are most commonly associated to a _Project Domain_ used for _Applications_. A _Project Domain_ is used to manage an _Application_ and may be defined to include _Life Cycle Subdomains_ for managing your _Application's_ progression from development through release.

## Use the _Environment_ List View to Add and Delete

The _Environment_ menu is on the left of the main panel. Select the _Environment_ menu, to view a list of all _Environments_ to which you have access. The Search bar, represented by a funnel icon, allows you to reorder _Environments_ based on Name or _Domain_.

The _Environments_ List View has the following Tabs.

| Tab         | Description                                                                                                                                                                                                                                                          |
|-------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Refresh** | Refreshes the browser.                                                                                                                                                                                                                                               |
| **Add**     | Allows you to Add a new _Environment_.                                                                                                                                                                                                                               |
| **Delete**  | Deletes the selected item.                                                                                                                                                                                                                                           |
| **Reports** | Success or Failed Report:  This report shows an ongoing list of all deployments to all _Environments_, regardless of _Domain_ or _Application_ with success or fail status. This report can be sorted based on the column for easy viewing. It can also be exported. |

Double click on an item in the list to see the _Dashboard_ view.

## Use the _Environment_ Dashboard to View and Edit

The Dashboard view displays all information related to a specific _Environment_. The Dashboard view has one additional tab option - Calendars. Below are the Details for an _Environment_.

### _Environment_ Details

| Field | Description |
| --- | --- |
|**Full _Domain_**| The fully qualified name of the _Domain_, including all parent _Domains_.
| **Name**| The name of the _Environment_. Note: Duplicate Names are restricted. It is recommended that _Environments_ be named in a specific manner, such as 'DevEnv-HipsterStore.'|
|**Owner Type**| User or Group |
| **Owner**| The owner defaults to the _User_ or _Group_ who created it.  |
|**Summary**| A short text description of the _Environment_. |
| **Created** | Auto generated date and time the _Environment_ was created. |
| **Modified** | Auto generated date and time the _Environment_ was last modified. |

### _Environment_ Access Control

The Access Section allows _Users_ within designated _Groups_ to update the _Environment_. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Environment_ in the following ways:

| Access                      | Description                                                                                                                                                         |
|-----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **View**                    | Allows the _User_ to see the _Environment_. If the _User_ does not belong to a _Group_ in the View Access list, the _Environment_ will not appear in the List View. |
| **Change**                  | Allows the _User_ to change the _Environment's_ characteristics i.e. Name, Summary, etc.                                                                            |
| **Create Calendar Entries** | Allows _Users_ to control the Calendar for the selected _Environment_. NOTE: Securing Environment Calendars is only available in Ortelius Pro.                     |
| **Deploy**                  | Allows _Users_ to deploy  _Applications_ into the selected _Environment_.                                                                                           |

{{% include "userguide/reusable/AuditTrail-withDeployments.md" %}}

{{% include "userguide/reusable/Attributes.md" %}}

### Assigned _Endpoints_

Note: You will need to have pre-defined your _Endpoints_.  See the [Define Your Endpoints](/guides/userguide/first-steps/2-define-endpoints/) chapter for more information.

_Environments_ are a collection of _Endpoints_. Use this section to assign the _Endpoints_ that will make up this _Environment_. Use +Add to create a new row in the _Endpoints_ table. Use Save to commit the row.  Select the row and use Edit or Delete to update or remove an _Endpoint_. When you add a new _Endpoint_ the  Hostname will be displayed. The Hostname is the actual network name or IP address.  It is assigned when the _Endpoint_ is defined, but is not a required field. If it is defined, it will be displayed in the row.

### Trends

This section shows the success/failure rate and time required for the last 10 deployments to this _Environment_.

### Assigned _Applications_

View all the _Application Base Versions_ assigned to this _Environment_. This is read only.  _Applications Base Versions_ are associated to _Environments_.

### Deployed _Components_ to _Environment_ Map

This map shows you all of the current _Component Versions_, with _Application Versions_, that have been deployed to this _Environment_.

