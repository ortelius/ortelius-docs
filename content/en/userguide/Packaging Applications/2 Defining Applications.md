---
title: "Defining Your Application Baseline"
linkTitle: "Defining Your Application Baseline"
weight: 5
description: >
  How to Create a New Baseline Application.
---

## Using the _Application_ List View for Adding or Deleting

Use the _Application_ List View accessible from the left hand _Application_ menu option. This will take you to a list of all _Application Base Versions_ and _Application Versions_ to which you have access. There is a row for every _Environment_ to which the _Application Base Version_ or _Application Version_ has been deployed.  For this reason, there will be multiple entries for the same _Application_ if it has been deployed to multiple _Environments_.  

The list view is organized on the following columns:

| List Column | Description|
|---|---|
|**Version**|  The _Application Base Version_ or _Application Version_ number. |
|**Domain**| The _Domain_ to which the _Application_ belongs.|
|**Parent**| The _Application Base Version_ from which the _Application Version_ was created. This will be empty for the _Application Base Version_.|
|**Environment**| The _Environment_ to which the _Application_ has been deployed. Each _Environment_ will represent a different row in the List View table.|
|**Last Deployment to Environment**| The Deployment Log number.|
|**Completed**|The date and time of the last deployment to the listed _Environment_.|
|**Results**| Success or Fail.|

You can also use the Filter bar, represented by a funnel icon, to reorder your _Application_ List View by:

- Domain
- Environment
- Last Deployment
- Parent
- Result
- Version

Double click on an item to see the _Dashboard_ view.

## Additional Tabs from the _Application_ List View

The _Application_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
| **Refresh** | Refreshes the browser. |
| **Add Base** | Allows you to Add a new _Application Base Version_. |
| **Add Version** | Creates a copy of the selected _Application_ in the list, creating a new _Application Version_. |
| **Delete** | Deletes the selected item. However, you must delete the _Applications_ starting from the newest to the oldest.  The _Application Base Version_ would be deleted last. Sorting by "Version" gives you the order.  |
| **Tasks** | Displays all _Application_ Tasks available for the selected item based on the Tasks defined to the _Application_ Domain. See [Tasks](/userguide/first-steps/2-defining-domains/#tasks) for more information.   |
| **List** | Displays the List View. |
| **Map** | Displays a global Map of all versions of the _Application_ with _Components_. |

## Viewing and Editing with the _Application_ Dashboard

The Dashboard view displays all information related to a specific _Application Base Version_ or _Application Version_. The Dashboard view has two additional tab options - Package Components and Versions.  Below are the Details for an _Application_.

| Details | Description |
| --- | --- |
|**Full Domain** | The fully qualified path of the _Domain_ that the _Application_ is to be associated with, showing all parent _Domains_. |
|**Name** | The Name of your _Application_. |
|**Owner Type**| Owned by a User or Group. |
|**Owner** | Name of User or Group. |
|**Summary** | Description of the _Application_. |
|**Created** | The date the _Application_ was added. |
|**Modified** | The date the _Application_ was updated. |  
|**Change Request DataSource** | DeployHub Pro Option - Establishes the Change Request system for the _Application_. A Change Request Data Source must be pre-defined for this field to be used. |
|**Pre-Action**| An action executed prior to the deployment.|
|**Post-Action**| An action executed at the completion of deployment.|
|**Custom Action** | Overrides any Pre or Post Actions, such as calling an external solutions such as Helm.|
|**Successful Deployment Template** | Used for success notifications. |
|**Failed Deployment Template**| Used for failure notifications.|

### _Application_ Dependency Map

The Dependency Map provides a graphical view of all your _Package Components_. This will remain empty until you assign _Components_ to your _Application_. Do this by using the _Package Components_ tab at the top of your _Application_ Dashboard.

### Log History

_Applications_ can be deployed many times, to the same or different locations (_Environments_). For every Deployment, the Log History will show all deployments based on "Result" and "Date".

{{% include "userguide/reusable/Attributes.md" %}}

### Assigned Environments

Each _Application Base Version_ is assigned the _Environments_ to which they will be deployed. _Application Versions_ inherit the _Environments_ from the _Application Base Version_. By using the "+Add this Application to an Environment to enable Deployments" option, you can add _Environments_ where the _Application_ is to be deployed. You can assign the _Application_ to as many _Environments_ as needed.  The Detail field will contain a link to the deployment Log for the last _Environment_ where the _Application_ was deployed.

### Last Deployment Difference Based on Environment

The Difference Graph shows what changed in the last deployment between the previous deployment. For the _Application Base Version_ all _Components_ will be shown.  Subsequent deployments will only show  changes.

{{% include "userguide/reusable/AuditTrail-withDeployments.md" %}}

### Access

 _Users_ within designated _Groups_ can update or view the _Application_. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ within an Access lists will be granted access to the _Application_:

| Access | Description |
| --- | --- |
| **View** | Any _User_ in any _Group_ within this list can see the selected _Component_ in the List View. |
| **Change** | Any _User_ in any _Group_ within this list can make changes to the _Component_. |
| **Deploy** | Any _User_ in any _Group_ within this list can deploy the _Application_.  Restrictions are based on the Access defined at the _Environment_ level. |

### Trends

The Trends graph shows the success or failure rates overtime as well at the time required for the last 10 deployments. If an _Application_ deployment takes longer than previous deployments, there is an issue with the deployment logic.

{{% include "userguide/reusable/ChangeRequest.md" %}}

## Package Components Tab

This tab contains all the _Components_ that make up an _Application_, linked together in order of deployment if needed using a blueprint designer. Click on the _Component_ Selector on the right side to see the available _Components_ based on _Domains_ and Categories. A Category acts as a tag or label assigned at the _Component_ level and are not specific to _Domains_.  _Domains_ are identified with a sitemap icon. A Category is identified with a Tag icon. Selecting either expands the options to show all available _Components_.

Click and drag a _Component_ from the list on the far right side and drop it into the Assigned _Components_ area. It will appear in the area as a box containing the name of the _Component_. It automatically links to the last _Component_. Right click on the connecting line, select "Delete this Connection".Create by Click on the anchor (the green dot at the bottom of the _Component_)  to create a new connector. Then drag and drop it onto another _Component_. This determines the order in which the _Components_ will be deployed. Each _Component_ contains _Component Items_ also linked together in the order to be executed.  For a microservice implementation, they can all be linked to the "start point". This means they will be deployed in parallel.

NOTE: At least one _Component_ must be connected to the "start point" or the deployment will fail.

## How to Publish New _Application Versions_ Automatically via Continuous Delivery

Configure a continuous delivery system to automatically update new _Application_ versions each time a new GitCommit triggers a new _Component_ to be consumed by your _Application_. Ortelius in the workflow performs this continuous versioning of new _Components_ and their consuming _Applications_.  For more information, see [Using Ortelius with CI/CD](/userguide/integrations/ci-cd_integrations/).

