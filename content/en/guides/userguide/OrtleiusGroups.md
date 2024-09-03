---
title: "Modifying the Default User Groups"
linkTitle: "Modifying the Default User Groups"
weight: 12
description: >
  Modifying the default User and Administrator Groups 
---

## Intro to _Groups_

Ortelius has three default Groups - Administrators, Everyone and Users.  Access control to Objects are based on these three high level _Groups_. You can modify these _Groups_ as needed to create access controls around Objects.

## Using the _Group_ List Viewing

You will find _Groups_ under the Setup menu.  Selecting _Groups_ will take you to a list of displaying the Administration _Group_ and _User_ Group.

From the _Groups_ List View, double click on the _Group_ which you would like to view to see all Details.  

## Using the _Group_ Dashboard for Viewing and Editing

The _Group_ Dashboard view displays all information related to a specific _Group_.

### _Group_ Details Section

_Groups_ have the following attributes:

| Field                       | Description                                                                                                                                                                                                                                                                     |
|-----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Full Domain**             | The fully qualified name of the _Domain_ to which the _Data Source_ was defined.                                                                                                                                                                                                |
| **Group Name**              | The name of one of the default _Groups_                                                                                                                                                                                                                                         |
| **Summary**                 | A description of the _Group_.                                                                                                                                                                                                                                                   |
| **Email**                   | The _Group_ email address that members of a _Group_ would all have access to, in the event of a notify process.                                                                                                                                                                 |
| **Created**                 | Auto generated date when the _Data Source_ was added.                                                                                                                                                                                                                           |
| **Modified**                | Auto generated date when the _Data Source_ was updated.                                                                                                                                                                                                                         |
| **Override Access Control** | If checked, allows any _User_ belonging to this _Group_ to have control over the entire system, and no access restrictions apply to them. This option creates a Super Group level of Administrator and should only be used for individuals with full administrative privileges. |
| **Users**                   | When checked, allows the _User_ to create and add Users to any of the _Domains_ to which they belong.                                                                                                                                                                           |
| **User Groups**             | When checked, allows the _User_ to create and add _Groups_ to any of the _Domains_ to which they belong.                                                                                                                                                                        |
| **Domains**                 | When checked, allows the _User_ to create and add _Subdomains_ to any of the _Domains_ to which they belong.                                                                                                                                                                    |
| **Environments**            | When checked, allows the _User_ to create and add _Environments_ to any of the _Domains_ to which they belong.                                                                                                                                                                  |
| **Endpoints**               | When checked, allows the _User_ to create and add _Endpoints_ to any of the _Domains_ to which they belong.                                                                                                                                                                     |
| **Repositories**            | When checked, allows the _User_ to create and add _Repositories_ to any of the _Domains_ to which they belong.                                                                                                                                                                  |
| **Components**              | When checked, allows the _User_ to create and add _Components_ to any of the _Domains_ to which they belong.                                                                                                                                                                    |
| **Credentials**             | When checked, allows the _User_ to create and add _Credentials_ to any of the _Domains_ to which they belong.                                                                                                                                                                   |
| **Applications**            | When checked, allows the _User_ to create and add _Applications_ to any of the _Domains_ to which they belong.                                                                                                                                                                  |
| **Application Versions**    | When checked, allows the _User_ to create and add _Application Versions_ to any of the _Domains_ to which they belong.                                                                                                                                                          |
| **Actions**                 | When checked, allows the _User_ to create and add _Actions_ to any of the _Domains_ to which they belong.                                                                                                                                                                       |
| **Procedures**              | When checked, allows the _User_ to create and add _Procedures_ to any of the _Domains_ to which they belong.                                                                                                                                                                    |
| **Data Sources**            | When checked, allows the _User_ to create and add _DataSources_ to any of the _Domains_ to which they belong.                                                                                                                                                                   |
| **Notifiers**               | When checked, allows the _User_ to create and add _Notifiers_ to any of the _Domains_ to which they belong.                                                                                                                                                                     |
| **Build Engines**           | When checked, allows the _User_ to create and add _Build Engines_ to any of the _Domains_ to which they belong.                                                                                                                                                                 |

### Group Membership

NOTE: Ortelius creates a Group named "Everyone" whenever it is installed, and every User that is created is added to this group and cannot be removed from it.

This section shows a list of all _Users_ who belong to the selected _Group_. Click on the plus '+Add' option to add a _User_ to this _Group_. A new row will be added to the table with a drop down list allowing you to select the _User_ to add to the _Group_. Select "Save" to commit the row to the table. You can delete a _User_ from the _Group_ using the Delete option.

{{% include "guides/userguide/reusable/OrteliusAuditTrail.md" %}}
