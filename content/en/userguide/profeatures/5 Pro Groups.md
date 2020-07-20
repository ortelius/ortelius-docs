---
title: "Creating Pro User Groups"
linkTitle: "Creating Pro User Groups"
weight: 82
description: >
  Add additional User Groups for more security and control over Ortelius Objects.
---
## Intro to _Groups_

Access control to Objects are based on _Groups_. DeployHub Pro allows you to create custom _Groups_ for organizing _Users_ giving you more granular security control around the Ortelius Objects.

Ortelius default _Groups_ include:
-Administrator _Group_ - The _User_ who initially signs into Ortelius is automatically added to this _Group_. By default, this _Group_ has access to all objects.
-User _Group_ - All _Users_ who sign in after the initial Administrator _User_ is created.
-Everyone _Group_ - All Users regardless of their assigned _Group_ are automatically added to this _Group_. It is the default _Group_ that provides access to "everyone" for all Objects.  To restrict _Everyone_ access, update the _Access_ options at the Object level.  This _Group_ cannot be modified.  If you delete a _User_ from the system, they will be deleted from the Everyone _Group_.

[_Users_](/userguide/customizations/2-users/) are given access to Ortelius Objects based on their _Group_ access. A many-to-many relationship exists between _Users_ and _Groups_, so that a _User_ can belong to many different _Groups_, and a _Group_ can contain many different _Users_. If a _User_ belongs to more than one _Group_, the _User_ will be given the highest level of access.

## _Groups_ and _Domain_ Inheritance

_Users_ and _Groups_ are created under a _Domain_. A _User_ or _Group_ that is created at a higher level _Domain_ will inherit access to all _Subdomains_, based on their access settings. _Group_ access and inherited access properties can be overridden within a _Subdomain_. As an example, Administrators, Director, and Operational level _Users_ or _Groups_ can be assigned to the highest level _Domain_ for the Enterprise while Application Teams and Testing Teams can be defined to only the _Subdomains_ that pertain to their area of expertise. _Users_ or _Groups_ can belong to multiple _Domains_.  

## Using the _Group_ List View for Adding or Deleting

You will find _Groups_ under the Setup menu.  Selecting _Groups_ will take you to a list of all _Groups_ which you have access to. You can also use the Filter bar, represented by a funnel icon, to reorder your _Groups_ List View based on _Groups_ and _Domains_.

The _Groups_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|**Refresh** | Refreshes the browser. |
|**Add** | Allows you to Add a new _User_ of a particular type. |
|**Delete** | Deletes the selected item. |

From the _Groups_ List View, double click on the _Group_ which you would like to view to see all Details.  

## Using the _Group_ Dashboard for Viewing and Editing

The _Group_ Dashboard view displays all information related to a specific _Group_.

### _Group_ Details Section

_Groups_ have the following attributes:

| Field | Description |
| --- | --- |
|**Full Domain**| The fully qualified name of the _Domain_ to which the _Data Source_ was defined. |
| **Group Name** | The name of the Ortelius _Group._ |
|**Summary**| A description of the _Group_.|
| **Email** | The _Group_ email address that members of a _Group_ would all have access to, in the event of a notify process. |
|**Created**| Auto generated date when the _Data Source_ was added.|
|**Modified**| Auto generated date when the _Data Source_ was updated.|
|**Override Access Control**| If checked, allows any _User_ belonging to this _Group_ to have control over the entire system, and no access restrictions apply to them. This option creates a Super Group level of Administrator and should only be used for individuals with full administrative privileges. |
| **Users** | When checked, allows the _User_ to create and add Users to any of the _Domains_ to which they belong. |
| **User Groups**| When checked, allows the _User_ to create and add _Groups_ to any of the _Domains_ to which they belong. |
| **Domains** | When checked, allows the _User_ to create and add _Subdomains_ to any of the _Domains_ to which they belong. |
| **Environments** | When checked, allows the _User_ to create and add _Environments_ to any of the _Domains_ to which they belong. |
| **Endpoints** | When checked, allows the _User_ to create and add _Endpoints_ to any of the _Domains_ to which they belong. |
| **Repositories** | When checked, allows the _User_ to create and add _Repositories_ to any of the _Domains_ to which they belong. |
| **Components** | When checked, allows the _User_ to create and add _Components_ to any of the _Domains_ to which they belong. |
| **Credentials** | When checked, allows the _User_ to create and add _Credentials_ to any of the _Domains_ to which they belong. |
| **Applications** | When checked, allows the _User_ to create and add _Applications_ to any of the _Domains_ to which they belong. |
| **Application Versions** | When checked, allows the _User_ to create and add _Application Versions_ to any of the _Domains_ to which they belong. |
| **Actions** | When checked, allows the _User_ to create and add _Actions_ to any of the _Domains_ to which they belong. |
| **Procedures** | When checked, allows the _User_ to create and add _Procedures_ to any of the _Domains_ to which they belong. |
| **Data Sources** | When checked, allows the _User_ to create and add _DataSources_ to any of the _Domains_ to which they belong. |
| **Notifiers** | When checked, allows the _User_ to create and add _Notifiers_ to any of the _Domains_ to which they belong. |
| **CD Engines**|When checked, allows the _User_ to create and add _Build Engines_ to any of the _Domains_ to which they belong.|

### User Membership

NOTE: Ortelius creates a Group named "Everyone" whenever it is installed, and every User that is created is added to this group and cannot be removed from it.

This section shows a list of all _Users_ who belong to the selected _Group_. Click on the plus '+Add' option to add a _User_ to this _Group_. A new row will be added to the table with a drop down list allowing you to select the _User_ to add to the _Group_. Select "Save" to commit the row to the table. You can use the Edit option to make a switch without having to first perform a Delete, and then an +Add.

{{% include "userguide/reusable/AuditTrail.md" %}}
