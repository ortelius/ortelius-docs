---
title: "Managing Users"
linkTitle: "Managing Users"
weight: 86
description: >
  Adding and Managing Users.
---

## Intro to _Users_

_Users_ are given access to Ortelius Objects based on their _Group_ access. By default there are three _Groups_.

-Administrator _Group_ - The _User_ who initially signs into Ortelius is automatically added to this _Group_. By default, this _Group_ has access to all objects.
-User _Group_ - All _Users_ who sign in after the initial Administrator _User_ is created.
-Everyone _Group_ - All Users regardless of their assigned _Group_ are automatically added to this _Group_. It is the default _Group_ that provides access to "everyone" for all Objects.  To restrict _Everyone_ access, update the _Access_ options at the Object level.  This _Group_ cannot be modified.  If you delete a _User_ from the system, they will be deleted from the Everyone _Group_.

A many-to-many relationship exists between _Users_ and _Groups_, so that a _User_ can belong to many different _Groups_, and a _Group_ can contain many different _Users_. If a _User_ belongs to more than one _Group_, the _User_ will be given the highest level of access.

### _Users_ and _Domain_ Inheritance

_Users_ are created under a _Domain_. A _User_ that is created at a higher level _Domain_ will inherit access to all _Subdomains_, based on their access settings. _Group_ access and inherited access properties can be overridden within a _Subdomain_. As an example, Administrators, Director, and Operational level _Users_ or _Groups_ can be assigned to the highest level _Domain_ for the Enterprise while Application Teams and Testing Teams can be defined to only the _Subdomains_ that pertain to their area of expertise. _Users_ or _Groups_ can belong to multiple _Domains_.

## Using the _User_ List View for Adding or Deleting

You will find _Users_ under the Setup menu.  Selecting _Users_ will take you to a list of all _Users_ which you have access to. You can also use the Filter bar, represented by a funnel icon, to reorder your _Users_ List View based on _Users_ and _Domains_.

The _Users_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|**Refresh** | Refreshes the browser. |
|**Add** | Allows you to Add a new _User_ of a particular type. |
|**Delete** | Deletes the selected item. |

From the _User_ List View, double click on the _User_ which you would like to view to see all Details.

## Using the _User_ Dashboard for Viewing and Editing

The _User_ Dashboard view displays all information related to a specific _User_.

### _User_ Details

The following details are common to all _Users_:

| Field | Description |
| --- | --- |
| **Full Domain** | The fully qualified name of the _Domain_ to which the _User_ was defined. |
| **User Name** | The Login name of the _User_. |
| **Real Name** | The _User's_ Proper Name. |
| **Email** | The _User's_ email. Used to send event notifications. |
| **Phone** | _Users_ phone number.  |
| **Date Format** | Defines how the date will be displayed to address geographical differences.|
| **Time Format** | 24 hour clock (military time) vs. 12 hour clock |
| **Password**| Password selected by the _User_ (encrypted in the database).|
| **Account Locked**| Locks the User out of the system. |
| **Force Change Password**| Forces the User to change their password on initial sign-in.|
| **Created** | Auto generated date when the _User_ was added.|
| **Modified**| Auto generated date when the _User_ was updated.|
| **Last Login** | Displays the last time the User logged in. |

## Group Membership

This Section contains a list of all the _Groups_ the selected _User_ belongs to. Add a _Group_ to the selected _User_ by clicking on the plus '+Add' sign in the upper right, which adds an empty row to the table with a drop down list of all available _Groups_. Use the Save option to commit it to the table. Use the Trash Can icon to delete a _Group_ from the table.

Ortelius has two _Groups_, Administrators and Users, to which _Users_ can be assigned.  Access control to Objects are based on these two high level _Groups_. Ortelius allows you to create as many _Users_ as required but only the "User" and "Administrator" _Groups_ are supported.

{{% include "guides/userguide/reusable/AuditTrail.md" %}}
