---
title: "Creating Releases"
linkTitle: "Creating Releases"
weight: 80
description: >
  Using _Releases_ to manage many _Applications_ in a single deployment.
---
## Intro to Releases

 A _Release_ manages the progression and deployment of multiple _Applications_ together.  _Releases_ and _Release Versions_ are a DeployHub Pro feature.  _Releases_ and _Release Versions_ are collections of one or more _Applications_ that are managed as a unit due to their interdependencies. This is sometimes referred to as a "Release Train." Like _Applications_ and _Components_, _Releases_ are versioned each time they are deployed. A _Release Base Version_ is the initial version and acts as a model for subsequent _Release Versions_.

## The _Release_ List View for Adding or Deleting

Use the _Release_ List View accessible from the left hand _Release_ menu option. This will take you to a list of all _Release Base Versions_ and _Release Versions_ to which you have access. There is a row for every _Environment_ to which the _Release Base Version_ or _Release Version_ has been deployed.  For this reason, you will see multiple entries for the same _Release_ if it has been deployed to multiple _Environments_.

The list view is organized on the following columns:

| List Column | Description|
|---|---|
|**Version**|  The _Release Base Version_ or _Release Version_ number. |
|**Domain**| The _Domain_ to which the _Release_ belongs.|
|**Parent**| The _Release Base Version_ from which the _Release Version_ was created. This will be empty for the _Release Base Version_.|
|**Environment**| The _Environment_ to which the _Release_ has been deployed. Each _Environment_ will represent a different row in the List View table.|
|**Last Deployment to Environment**| The Deployment Log number.|
|**Completed**|The date and time of the last deployment to the listed _Environment_.|
|**Results**| Success or Fail.|

You can also use the Filter bar, represented by a funnel icon, to reorder your _Release_ List View.  You can filter on:

- Domain
- Environment
- Last Deployment
- Parent
- Result
- Version

By double clicking on an item in the list, you will be taken to the _Dashboard_ view.

## Additional Tabs from the _Release_ List View

The _Release_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
| **Refresh** | Refreshes the browser. |
| **Add Base** | Allows you to Add a new _Release Base Version_. |
| **Add Version** | Creates a copy of the selected _Release_ in the list, creating a new _Release Version_. |
| **Delete** | Deletes the selected item. However, you must delete the _Release_ starting from the newest to the oldest.  The _Release Base Version_ would be deleted last. Sorting by "Version" gives you the order.  |
| **Tasks** | Displays all _Release_ Tasks defined to this _Domain_ and available for the selected Item. See [Tasks](/guides/userguide/first-steps/2-defining-domains/#tasks) for more information.  |

## Viewing and Editing with the _Release_ Dashboard

The Dashboard view displays all information related to a specific _Release Base Version_ or _Release Version_.  Below are the Details for a _Release_.

| Details | Description |
| --- | --- |
|**Full Domain** | The fully qualified path of the _Domain_ that the _Release_ is to be associated, showing all parent _Domains_. |
|**Name** | The Name of your _Release_. |
|**Owner Type**| Owned by a User or Group. |
|**Owner** | Name of User or Group. |
|**Summary** | Description of the _Release_. |
|**Created** | Auto generated based on the date the _Release_ was added. |
|**Modified** | Auto generated based on the date the _Release_ was updated. |
|**Successful Deployment Template** | The template that should be used for success notifications. |
|**Failed Deployment Template**| The template that should be used for failure notifications.|

### Assigned Applications

This section contains all of the _Applications_ that make up the _Release Version_, linked together in order of deployment. Click on the tree structure on the right side in order to see all the available _Applications_, then click and drag an _Application_ from the list on the right side and drop it into the _Release_ area. It will appear in the area as a box containing the name of the _Application_ and will automatically link to the last _Application_ in the area. The connecting line can be deleted by right clicking on the connector line and selecting "Delete this Connector". A new connector can be created by clicking on the anchor (the green dot at the bottom of the _Application_) and dragging and dropping it onto another _Application_. This determines the order that _Applications_ will be deployed. Keep in mind that each _Application_ contains _Components_, which contain _Component Items_, all of which are linked together in the order that they are executed.

NOTE: In the Application Version area, there is an object that represents the currently selected Release Version. It is distinguishable from any Applications in the area by the arrow icon that appears in the object along with the word "Start" and is positioned in the top center of the window and cannot be moved from that position. This must be connected to the first Application to be deployed, otherwise Ortelius does not know which Application to begin with, and the deployment will fail.

Applications can be set to deploy in parallel by joining two or more applications to a common parent. In this case, when the parent application has been deployed the "child" applications are deployed in parallel. You can attach multiple application to the "Start" block in order to deploy the initial applications in parallel.

### Log History

_Releases_ can be deployed many times, to the same or different locations (_Environments_). For every Deployment, the Log History will show all deployments based on "Result" and "Date".

{{% include "guides/userguide/reusable/Attributes.md" %}}

### Trends

The Trends graph shows you your success or failure rates overtime as well at the time required for the last 10 deployments. If a _Release_ deployment is taking longer than previous deployments, this might indicate an issue with your deployment logic.

{{% include "guides/userguide/reusable/AuditTrail-withDeployments.md" %}}

### Access

The Access Section allows _Users_ within designated _Groups_ to update or view the _Release_. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Release_:

| Access | Description |
| --- | --- |
| **View** | This allows any _User_ that belongs to any _Group_ in this list to see the selected _Component_ in the List View. |
| **Change** | This allows any _User_ that belongs to any _Group_ in this list to make changes to the _Component_. |
| **Deploy** | This allows any _User_ that belongs to any _Group_ in this list to deploy the _Application_.  This is further restricted based on the Access defined at the _Environment_ level. |

{{% include "guides/userguide/reusable/ChangeRequest.md" %}}

## Planner Tab

This tab Contains Release Planner, which helps to plan and schedule the deployment of _Releases_ and their _Applications_ throughout the software Life Cycle. The Release Planner provides an overall view of the activities for a _Release_, which includes the _Applications_ contained within the _Release_, the number of Defects for Components within each _Application_, and target _Environments_ for the deployment of _Releases_ and _Applications_, all in a linear _Calendar_ format with drag and expansion capabilities. By viewing the number of open defects along with the scheduled testing time for each _Application_ in the _Release_, Production Support Teams can easily make judgements as to whether the _Release_ is on track or needs to be restructured or rescheduled.

The uppermost horizontal area of the Release Planner contains a _Calendar_ that corresponds to the dates contained within _Environments_ that the _Release_ and its _Applications_ are to be deployed to. The gray area beneath this represents the _Release_ and contains any _Environments_ that the _Release_ will be deployed to. Beneath this is one or more areas, each for every _Application_ contained within the _Release_.

Using the scrolling device on the _User's_ mouse or trackpad causes the entire area to expand and contract which, along with the ability to scroll back and forth via clicking and dragging, allows the User to easily view the entire Release Plan from beginning to end, in detail, while using the _Calendar_ along the top as a reference.

There are pie charts as the first field in each _Application_ that represent open and closed defects for _Components_ contained in each _Application_. The gray section of each pie chart represents the number of closed defects, while the gold section represents the number of open defects. Hovering the pointer over a pie chart will show the actual number of open and closed defects. This is used to help with tracking defects at a glance so that they can be dealt with, thereby helping to prevent the failure or postponement of a deployment.

Within the _Application_ areas are various colored blocks that represent a deployment in the _Environment's__Calendar_ in the form of either an Auto Deploy or a Reserved event. The label shown on the block refers to the domain that the target _Environment_ is contained within. Hovering the mouse pointer over it will display the name of the _Environment_ it will be deployed to. Clicking on a block will take the _User_ to the _Calendar_ entry for the designated _Environment_.

A red line indicates today and assists in identifying where deployments for _Applications_ and _Releases_ are in the schedule. The various blocks within the different areas are colored according to where they stand in the release plan. A gold block represents an overdue deployment into an _Environment_, and this is will always appear to the left of the red line. A slate colored block represents a completed deployment into an _Environment_. A dark blue block represents a deployment scheduled to take place in the future.
