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

| List Column                        | Description                                                                                                                               |
|------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| **Version**                        | The _Application Base Version_ or _Application Version_ number.                                                                           |
| **Domain**                         | The _Domain_ to which the _Application_ belongs.                                                                                          |
| **Parent**                         | The _Application Base Version_ from which the _Application Version_ was created. This will be empty for the _Application Base Version_.   |
| **Environment**                    | The _Environment_ to which the _Application_ has been deployed. Each _Environment_ will represent a different row in the List View table. |
| **Last Deployment to Environment** | The Deployment Log number.                                                                                                                |
| **Completed**                      | The date and time of the last deployment to the listed _Environment_.                                                                     |
| **Results**                        | Success or Fail.                                                                                                                          |

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

| Tab             | Description                                                                                                                                                                                                         |
|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Refresh**     | Refreshes the browser.                                                                                                                                                                                              |
| **Add Base**    | Allows you to Add a new _Application Base Version_.                                                                                                                                                                 |
| **Add Version** | Creates a copy of the selected _Application_ in the list, creating a new _Application Version_.                                                                                                                     |
| **Delete**      | Deletes the selected item. However, you must delete the _Applications_ starting from the newest to the oldest.  The _Application Base Version_ would be deleted last. Sorting by "Version" gives you the order.     |
| **Tasks**       | Displays all _Application_ Tasks available for the selected item based on the Tasks defined to the _Application_ Domain. See [Tasks](/guides/userguide/first-steps/2-defining-domains/#tasks) for more information. |
| **List**        | Displays the List View.                                                                                                                                                                                             |
| **Map**         | Displays a global Map of all versions of the _Application_ with _Components_.                                                                                                                                       |

## Viewing and Editing with the _Application_ Dashboard

The Dashboard view displays all information related to a specific _Application Base Version_ or _Application Version_. The Dashboard view has two additional tab options - Package Components and Versions.  Below are the Details for an _Application_.

| Details         | Description                                                                                                             |
|-----------------|-------------------------------------------------------------------------------------------------------------------------|
| **Full Domain** | The fully qualified path of the _Domain_ that the _Application_ is to be associated with, showing all parent _Domains_. |
| **Name**        | The Name of your _Application_.                                                                                         |
| **Owner Type**  | Owned by a User or Group.                                                                                               |
| **Owner**       | Name of User or Group.                                                                                                  |
| **Summary**     | Description of the _Application_.                                                                                       |
| **Created**     | The date the _Application_ was added.                                                                                   |
| **Modified**    | The date the _Application_ was updated.                                                                                 |

### _Application_ Dependencies

The Dependency list shows all of your _Package Components_. This will remain empty until you assign _Components_ to your _Application_. You can manually assign _Package Components_ by using the _Package Components_ tab at the top of your _Application_ Dashboard. Alternatively, the recommended method is to automate the collection of this data via a [CI/CD Command Line Interface (CLI)](/guides/userguide/integrations/ci-cd_integrations/).

### Vulnerabilities

Your _Application's_ vulnerabilities are derived by aggregating all of your _Package Component's_ vulnerabilities to the 'logical' _Application_ level. Vulnerabilities are displayed based on each _Component's_ SBOM. This data is automatically populated when one or more of your _Package Components_ have an SBOM that produced vulnerability data.

>Note - This list may be incomplete if one or more of your _Package Components_ do not have an associated SBOM that can be used to gather vulnerability data.

### SBOM

Your _Application's_ SBOM is derived by aggregating all of your _Package Component's_ SBOMs to the 'logical' _Application_ level.  

>Note - This list may be incomplete if one or more of your _Package Components_ do not have an associated SBOM.


### Log History

_Applications_ can be deployed many times, to the same or different locations (_Environments_). For every Deployment, the Log History will show all deployments based on "Result" and "Date".

{{% include "/guides/userguide/reusable/Attributes.md" %}}

### Trends

The Trends graph shows the success or failure rates overtime as well at the time required for the last 10 deployments. If an _Application_ deployment takes longer than previous deployments, there is an issue with the deployment logic.

### Deployed Environments

When you record deployments via the Ortelius CLI, you can capture deployment data showing which _Application Versions_ have been deployed an _Environment_.

### Last Deployment Difference Based on Environment

When tracking versions, the Difference Graph shows what changed in the last deployment between the previous deployment.

{{% include "/guides/userguide/reusable/AuditTrail-withDeployments.md" %}}

### Access

 _Users_ within designated _Groups_ can update or view the _Application_. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ within an Access lists will be granted access to the _Application_:

| Access     | Description                                                                                                                                        |
|------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| **View**   | Any _User_ in any _Group_ within this list can see the selected _Component_ in the List View.                                                      |
| **Change** | Any _User_ in any _Group_ within this list can make changes to the _Component_.                                                                    |
| **Deploy** | Any _User_ in any _Group_ within this list can deploy the _Application_.  Restrictions are based on the Access defined at the _Environment_ level. |


## Package Components Tab

This tab contains all the _Components_ that make up an _Application_, linked together in order of deployment if needed using a blueprint designer. Click on the _Component_ Selector on the right side to see the available _Components_ based on _Domains_ and Categories. A Category acts as a tag or label assigned at the _Component_ level and are not specific to _Domains_.  _Domains_ are identified with a sitemap icon. A Category is identified with a Tag icon. Selecting either expands the options to show all available _Components_.

Click and drag a _Component_ from the list on the far right side and drop it into the Assigned _Components_ area. It will appear in the area as a box containing the name of the _Component_. It automatically links to the last _Component_. Right click on the connecting line, select "Delete this Connection".Create by Click on the anchor (the green dot at the bottom of the _Component_)  to create a new connector. Then drag and drop it onto another _Component_. This determines the order in which the _Components_ will be deployed. Each _Component_ contains _Component Items_ also linked together in the order to be executed.  For a microservice implementation, they can all be linked to the "start point". This means they will be deployed in parallel.

NOTE: At least one _Component_ must be connected to the "start point" or the deployment will fail.

## How to Publish New _Application Versions_ Automatically via Continuous Delivery

Configure a continuous delivery system to automatically update new _Application_ versions each time a new GitCommit triggers a new _Component_ to be consumed by your _Application_. Ortelius in the workflow performs this continuous versioning of new _Components_ and their consuming _Applications_.  For more information, see [Using Ortelius with CI/CD](/guides/userguide/integrations/ci-cd_integrations/).
