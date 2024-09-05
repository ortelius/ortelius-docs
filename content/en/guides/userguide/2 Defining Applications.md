---
title: "Applications and Their Security Posture"
linkTitle: "Applications and Their Security Posture"
weight: 7
description: >
  Viewing the Application Security Posture.
---


## Understanding _Applications_ and _Application Versions_

 _Applications_ are a collection of _Components_ that are released as a single software solution to end users. You define an _Application_ by associating the _Components_ it will consume. The first time you define an _Application_, it is referred to as the _Application Base Version._ When you change the _Application Base Version_, you create a new _Application Version_. _Applications_ are assigned to _Environments_ and _Domains_.

- **Application Base Version** : Defines the software product in terms of _Components_, _Attributes,_ and assigned _Environments_.

- **Application Version** : This child of the _Application Base Version_ represents changes and can be deployed just as an _Application Base Version_ is. For instance, your Application Base Version may be called MyApp;1, subsequent versions would be automatically named MyApp;2, MyApp;3, etc.

## Applications and their Components

_Applications_ are defined by the _Components_ they consume. As with _Components_, _Applications_ have versions. When a new _Component_ is published by the CI/CD workflow, Ortelius is called to automatically create a new _Application Version_.  For more information on this topic, see the [Adding Your Components and Applications to Ortelius](/guides/userguide/addingtopipeline/).


## Adding New _Application Versions_ Automatically via Continuous Delivery

_Applications_ and new _Application Versions_ can only be added via the CI/CD process. Configure a CI/CD workflow to automatically update new _Application_ versions each time a new GitCommit triggers a new _Component_ that your _Application_ consumes. Ortelius in the workflow performs this continuous versioning of new _Components_ and their consuming _Applications_.  For more information, see [Using Ortelius with CI/CD](/guides/userguide/addingtopipeline/).

## Viewing _Applications_

Use the _Application_ List View accessible from the left hand _Application_ menu option. This will take you to a list of the latest _Application Versions_ to which you have access.

The list view is organized on the following columns:

| List Column        | Description                                                                                                                               |
|--------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| **Version**        | The _Application Base Version_ or _Application Version_ number.                                                                           |
| **Domain**         | The _Domain_ to which the _Application_ belongs.                                                                                          |
| **Environment**    | The _Environment_ to which the _Application_ has been deployed. Each _Environment_ will represent a different row in the List View table. |
| **Deployment Log** | The Deployment Log number.                                                                                                                |
| **Completed**      | The date and time of the last deployment to the listed _Environment_.                                                                     |
| **Results**        | Success or Fail.                                                                                                                          |

You can also use the Filter bar, represented by a funnel icon, to reorder your _Application_ List View by:

- Domain
- Environment
- Last Deployment
- Parent
- Result
- Version



## Additional Tabs from the _Application_ List View

The _Application_ List View has the following Tabs.

| Tab                | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|--------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Refresh**        | Refreshes the browser.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| **Delete**         | Deletes the selected item. However, you must delete the _Applications_ starting from the newest to the oldest.  The _Application Base Version_ would be deleted last. Sorting by "Version" gives you the order.                                                                                                                                                                                                                                                                                                                                                                                 |
| **Package Search** | Allows for the search of a particular package across all _Applications_ and _Components_. Use this feature to quickly find where a vulnerable package version is running.                                                                                                                                                                                                                                                                                                                                                                                                                       |
| **Reports**        | Generate a Compliance Summary report, [Dora deployment frequency](/guides/userguide/integrations/dorametrics/), [Dora lead time to change](/guides/userguide/integrations/dorametrics/) or export a federated SBOM to meet government requirements such as [EO 14028](https://www.gsa.gov/technology/it-contract-vehicles-and-purchasing-programs/information-technology-category/it-security/executive-order-14028#:~:text=Summary%20of%20EO%2014028%20requirements&text=Establishes%20baseline%20security%20standards%20for,making%20security%20data%20publicly%20available.). |

## Viewing and Editing with the _Application_ Dashboard

Double click on an _Application Version_ to see the Dashboard view. The Dashboard view displays all information related to the latest _Application Version_ selected from the List View. This view of the _Application Version_ shows you the security posture including OpenSSF scorecard, Software Bill of Materials report, and real-time vulnerabilities. In addition, you can view how the _Application Version_ is impacted by _Components_, or view the DevOps details.

 The Dashboard view has two additional Buttons - Versions and Compare

### Viewing all _Component Versions_

You can view a list of all _Application Versions_ by selecting the "Versions" button displayed after the _Application's_ name at the top of the Dashboard.

### Comparing Two _Component Versions_

You can compare your current _Application Version_ with any other _Application Version_ by selecting the _Compare_ button. You will be provided a list to select your second _Component Versions_ for the comparison.  

### Security Posture Section

View the _Application Version_ Software Bill of Material Report, and Real-time vulnerabilities.

<u>Federated Software Bill of Materials Report</u>

This section is a summary the _Applications_ federated Software Bill of Materials (SBOM) report showing all of the packages consumed by the 'logical' _Application Version_. An _Application_ SBOM provides a detailed report of all _Component_ SBOM data within the _Application_, with duplicates removed. When a _Component_ is updated, Ortelius automatically generates a new version of all _Applications_ that use that _Component_, along with a new aggregated SBOM.

>Note:  If you need to produce an _Application Version_ SBOM for governance reporting or sharing, you can export the SBOM from the _Application_ List View _Reports_ menu option.

<u>Vulnerabilities </u>

Using the aggregated Software Bill of Materials, Ortelius cross-references all _Component_ packages within the _Application_ against known vulnerability databases such as [OSV.dev](https://osv.dev). Ortelius will scan for new known vulnerabilities every 10 minutes, and update the dashboard.

>Note - This list may be incomplete if one or more of your _Package Components_ do not have an associated SBOM that can be used to gather vulnerability data.

## Impact Assessment

Track the _Component Versions_ that the _Application Version_ is dependent upon. This view gives you a list of the _Components_ that the _Application_ requires. In addition, this view provides links to the  selected _Component Version_, and deployed locations of the _Component_.

### Application DevOps Details
Below are the Details for an _Application_.

| Details                     | Description                                                                                                                                                                                 |
|-----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Full Domain**             | The fully qualified path of the _Domain_ that the _Application_ is to be associated with, showing all parent _Domains_.                                                                     |
| **Name**                    | The Name of your _Application_.                                                                                                                                                             |
| **Description**             | A short description of your software system.                                                                                                                                                |
| **Log History**             | _Applications_ can be deployed many times, to the same or different locations (_Environments_). For every Deployment, the Log History will show all deployments based on "Result" and "Date |
| **Key Value Configuration** | This list shows the key values used as part of the _Application Version_ deployment. This data can be added manually or updated via the CI/CD process.                                      |


{{% include "/guides/userguide/reusable/Attributes.md" %}}

{{% include "/guides/userguide/reusable/OrteliusAuditTrail.md" %}}

### Auditing Deployments

When a deployment is logged via the CI/CD workflow, the output from the deployment can be passed to the CLI to be persisted with the _Application Version_ and _Component Versions_. Learn more about the [CI/CD CLI Integration](/guides/userguide/integrations/ci-cd_integrations/)

## Audit and Access Section

 _Users_ within the defualt _Groups_ can update or view the _Application_. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ within an Access lists will be granted access to the _Application_:

| Access     | Description                                                                                                       |
|------------|-------------------------------------------------------------------------------------------------------------------|
| **View**   | This allows any _User_ that belongs to any _Group_ in this list to see the selected _Component_ in the List View. |
| **Change** | This allows any _User_ that belongs to any _Group_ in this list to make changes to the _Component_.               |

