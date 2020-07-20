---
title: "Using Notifier Templates"
linkTitle: "Using Notifier Templates"
weight: 29
description: >
  Write and reuse standard message templates for your _Notifiers_.
---

## Intro to _Notifier Templates_

_Notifier Templates_ are used to create standard messages that are automatically sent by _Notifiers_.  Each _Notifier Template_ is assigned to a _Notifier_. There are two default _Notifier Templates_, one for a successful deployment (DeploySuccess) and one for a failed deployment (DeployFailure).

Note: To create a _Notifier Template_ you will need to first create the _Notifier_.

Each _Notifier Template_ contains the subject and body of the actual notification, and if via email, a list of recipients. Recipients can be members of one or more _Groups_ as well as the owners of the _Application_, the owner of the _Environment_, and/or the owners of the _Environment_ _Endpoints_.

For more information on _Notifiers_ see [Using Notifiers for Messaging](/userguide/customizations/2-define-notifiers/).

Using these two objects, _Notifiers_ and _Notifier Templates_, notifications can be sent whenever a deployment to an _Environment_ fails or succeeds, whenever a _Request_ Task is executed, or the state of an _EndPoint_ changes. You can also use the Filter bar, represented by a funnel icon, to reorder your _Notify Templates_ by _Notifier Template_ Name and _Notifier_.

## Using the _Notifiers_ List View for Adding or Deleting

You will find _Notifier Templates_ under the Setup menu.  Selecting _Notifier Templates_ will take you to a list of all _Notifier Templates_ which you have access to. You can also use the Filter bar, represented by a funnel icon, to reorder your _Notifier Templates_ List View.  You can reorder the list view on _Notifier Templates_ and _Domains_.

_Notifiers Templates_ are defined to a _Domain_ and will be displayed based on your access to the _Domain_ to which it belongs.

The _Notifier Templates_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|Refresh | Refreshes the browser. |
| Add | Allows you to Add a new _Notifier Template_. |
| Delete | Deletes the selected item. |

From the _Notifier Template_ List View, double click on the _Notifier Template_ which you would like to view to see all Details.  

## Using the _Notifiers_ Dashboard for Viewing and Editing

The Dashboard view displays all information related to a specific _Notifier_.

### Notifier Details

| Field | Description |
| --- | --- |
|**Notifier**| The _Notifier_ that will use this _Notifier Template_.|
| **Name** | A unique name for the  _Notifier Template._ |
| **Summary** | A short text field to describe the _Notifier Template_ and its use. |
| **Created** | The date and time the _Notifier Template_ was created. |
| **Modified** | The date and time the _Notifier Template_ was last changed. |
|**Subject**| The email subject line. |
|**Body**| The email message.|

## Recipients Section

This section contains the list of email _Users_ that will receive the notification. Clicking on the +Add sign will add a row to the Recipient table with a drop-down entry field. Select "Save" once you have choose the Recipients from the drop-down entry field.

| List | Description |
| --- | --- |
| **${environment.owner}** | The owner of the _Environment_ that was used in the deployment.|
|**${server.owner}**| The owner of the _Endpoint_ that was used in the deployment |
|**${version.owner}**| The owner of the Version that was deployed. |
| **Everyone** | All of the individual _Users_ in the Ortelius installation. |
| **Administrators** | All of the _Users_ in the Administrator _Group_.  |
| **Groups** | All defined _Groups_ will appear in this list, allowing you to select a specific _Group_|

You can Delete a Recipient by using the Trash Can Icon next to the item in the table.

## Variables Table

This table shows all variables that can be used when constructing the subject line and message body for a template. These variables are automatically expanded when the notification is issued. Variables can be either Object Methods (such as ${application.name}) or Scalar Variables that are set by Ortelius during specific operations (such as $SERVER_STATUS during a periodic server scan).

Object Methods can be used for any object that is available to Ortelius during the operation. For example, you could use ${application.id} to get the internal application id or ${application.domain.name} to get the current domain for the application.
