---
title: "Components and Their Security Posture"
linkTitle: "Components and Their Security Posture"
weight: 6
description: >
  Viewing a Component's Security Posture
---

## Intro to _Components_

_Components_ are independent artifacts—such as containers, jar files, and executables—pushed through the CI/CD pipeline and deployed separately, each with its own security details, including SBOMs and vulnerabilities. Ortelius continuously tracks the CI/CD pipeline, collecting both security and DevOps insights for every _Component_. By mapping this data, Ortelius provides a unified view of each _Component's_ security profiles.

A collection of _Components_ forms a 'logical' view of an _Application_. Since each _Component_ comes with its own security and DevOps data, Ortelius aggregates the _Component_ insights for all 'logical' _Applications_. This aggregation provides a comprehensive view of the 'logical' _Application's_ SBOMs and vulnerabilities, supporting a unified security perspective within complex, decoupled, cloud-native architectures.

_Components_ change over time, and so they have both a _Component Base Versions_, the first iteration of a _Component_, and _Component Versions_, all subsequent iterations.

- **Component Base Version** : The initial definition of a _Component_.

- **Component Version** : A child of the _Component Base Version_ that represents changes.


## Publish New _Component Versions_ automatically via the CI/CD Pipeline

Components can only be added via your CI/CD pipeline. Configure your CI/CD Pipeline to automatically update new _Component Versions_ each time a new GitCommit triggers the workflow process.  Add Ortelius to the workflow to perform the continuous versioning of new _Components_ and their consuming _Applications_.  For more information, see [Using Ortelius with CI/CD](/guides/userguide/integrations/ci-cd_integrations/).

## Components and Domains

_Components_ are organized by _Domains_. When you create a new _Component_ you publish it to the _Domain_ that defines the "Solution Space" the _Component_ addresses.  By organizing _Components_ into _Domains_, you create a catalog that allows other teams within your organization to find the _Component_, view its security profile, and share its Software Bill of Materials (SBOM) report.

The organization of _Components_ by _Domains_ support the Domain Driven Design of a decoupled architecture. Before you begin publishing _Components_, you will need to have a _Domain_ ready.  For more on _Domains_ see the [Building Your Domain Catalog](/guides/userguide/definedomains/).

## _Components_ and _Applications_

_Components_ are consumed by _Applications_. You track a 'logical' view of your complete software solution by assigning _Components_ to the consuming _Application_. Defining _Components_ to _Applications_ is a "packaging" process that is done through your CI/CD pipeline.

There is a many-to-many relationship between _Applications_ and _Components._ An _Application_ can contain many different _Components_. A _Component_ can be used across many different _Applications_. Ortelius tracks and versions all _Component Version_ relationships including to which _Applications_ they have been assigned.

## _Component_ Versioning

Ortelius uses a backend versioning engine to track your _Components_. When you first add your _Component_, Ortelius tracks it as the _Component Base Version_. Subsequent updates to that _Component_ creates a new _Component Version_ which represent the updates over time. A _Component Base Version_ is always the first one created, and it acts as a model for subsequent _Component Versions_. Versioning tracks _Component_ attributes including low level information that is needed for other teams to reuse your _Component_ including:

- SBOMs
- OpenSSF Scorecard
- Vulnerabilities
- Swagger and Readme
- License
- Helm Info
- Build Info
- Git repo
- Git commit (Branch and Tag)
- CD Build / Workflow Number
- Deployment Metadata

DevOps and security information is collected for all _Components_ via the CI/CD pipeline. When your CD engine initiates a workflow for the _Component_, Ortelius is called to determine that a new version of the _Component_ is being pushed across the Pipeline. When a _Component_ is updated, Ortelius automatically updates all consuming _Applications_ and creates a new logical _Application_Version_. If a _Component_ changes, the consuming _Application_ also changes.  Both get a new version number. For more information see [Using Ortelius with CI/CD](/guides/userguide/integrations/ci-cd_integrations/).

Ortelius uses a simple versioning number schema starting at 1 and incrementing over time, for example: ` Myapp;1, Myapp;2. ` .

You can use your DevOps Pipeline to include variance in your versioning number (base name, variant, version).  See [Step 2 - Create Your Component.toml File in the CI/CD Integrations](/guides/userguide/integrations/ci-cd_integrations/).

## The _Component_ List View

_Components_ are added to Ortelius through the CI/CD process. Once added, the _Component_ will be displayed in the _Component_ list view. Use the _Components_ List View accessible from the left hand _Components_ menu option to view all of your available _Components Versions_. The list of all _Components_ is organized by the following:

| List Column        | Description                                                                                                                             |
|--------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| **Version**        | The _Component Base Version_ or _Component Version_ number.                                                                             |
| **Domain**         | The _Domain_ to which the _Component_ belongs.                                                                                          |
| **Environment**    | The _Environment_ to which the _Component_ has been deployed. Each _Environment_ will represent a different row in the List View table. |
| **Deployment Log** | The Deployment Log number with a link to the log.                                                                                       |
| **Completed**      | The date and time of the last deployment to the listed _Environment_.                                                                   |
| **Results**        | Success or Fail.                                                                                                                        |

You can also use the Filter bar, represented by a funnel icon, to reorder your _Component_ List View:

- Domain
- Environment
- Last Deployment
- Parent
- Result
- Version

## Additional Tabs from the _Component List_ View

| Menu Tab    | Description                                                                                                                                                                                                                              |
|-------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Refresh** | Refreshes your screen.                                                                                                                                                                                                                   |
| **Delete**  | Deletes the selected _Component Version_. To delete all, you must delete the _Component Versions_ starting from the newest to the oldest.  The _Component Base Version_ would be deleted last. Sorting by "Version" gives you the order. |
| **SBOM**    | Export your Component's Software Bill of Materials report. Select the _Component's_ check box and click on the SBOM button to see your SBOM report.                                                                                      |

## Viewing a _Component's_ Security Details

Double click on a _Component_ from the _Component List_ to view and edit an individual _Component's_ security and DevOps details. The Ortelius Dashboard displays all information related to a specific _Component Version_.

### Viewing all _Component Versions_

You can view a list of all _Component Versions_ by selecting the "Versions" button displayed after the _Component's_ name at the top of the Ortelius Dashboard.

### Comparing Two _Component Versions_

You can compare any two _Component Versions_ by selecting the _Compare_button. You will be provided a list to select your second _Component Versions_ for the comparison.  

## Security Posture Section

The first information you will see when viewing a _Component_ is the Security Posture. Ortelius gathers security insights created by open-source and commercial tools coming from organizations such as the [OpenSSF](https://openssf.org/projects/), [Continuous Delivery Foundation](https://cd.foundation), [OSV.dev](https://osv.dev/), and [Sonatype](https://https://www.sonatype.com/). When security tooling is added to your CI/CD pipeline, Ortelius pulls the security information and maps it to the deployment locations providing real-time security insights for every software update, referred to as continuous security monitoring. By mapping the security data to release versions, and their deployed locations, Ortelius gives you continuous insights into vulnerabilities long after your static CI/CD container scan was completed.

>Note: Data from security tools can only be displayed if the tools are added to the CI/CD pipeline. To learn how Ortelius can simplify this step view [Setting up Ortelius via the CLI](/guides/userguide/integrations/ci-cd_integrations/).


### Software Bill of Materials

Ortelius consumes a _Component's_ Software Bill of Materials data as part of the CI/CD process. It can consume both [SPDX](https://spdx.dev/) and [CycloneDX](https://cyclonedx.org/) formats. Ortelius presents the following high-level information, based on all consumed packages, derived from your CI/CD SBOM step:  

| SBOM Element       | Description                                                    |
|--------------------|----------------------------------------------------------------|
| **Package**        | The name of the package.                                       |
| **Version**        | The Package release number.                                    |
| **License**        | The license used by the Package.                               |
| **OSSF Scorecard** | When available, the OpenSSF Scorecard status for each package. |

>Note: SBOM information will only be displayed if SBOM usage is added to the CI/CD pipeline. To learn how Ortelius can simplify this step view [Setting up Ortelius via the CLI](/guides/userguide/integrations/ci-cd_integrations/).

### Real-Time Vulnerabilities

With the SBOM data, Ortelius continuously monitors the vulnerabilities for the _Component_. Every 10 minutes, Ortelius scans the OSV.dev distributed vulnerability database for the most recent vulnerabilities for the _Component_.

| Vulnerability Element | Description                                                                   |
|-----------------------|-------------------------------------------------------------------------------|
| **Package**           | The name of the package with the vulnerability.                               |
| **Version**           | The vulnerable Package release number.                                        |
| **ID**                | The vulnerability ID with a link to the vulnerability description on OSV.dev. |
| **Summary**           | A brief summary of the vulnerability                                          |

>Note: Without the SBOM data, vulnerabilities cannot be traced.

### OpenSSF Scorecard

OpenSSF Scorecard is a collection of security health metrics for open source packages. These metrics are critical as they allow consumers of the package to evaluate the security posture before use. Ortelius displays the OpenSSF score card information for the _Component_ as well as all of the packages the _Component_ consumes (displayed at the SBOM level).


| OpenSSF Scorecard Element | Description                                                                                                        |
|---------------------------|--------------------------------------------------------------------------------------------------------------------|
| **Score**                 | The OpenSSF Scorecard assessment of the _Component_ based on the metric.                                           |
| **Check**                 | OpenSSF Scorecard executes a variety of metrics referred to as 'checks.' This column displays each of the metrics. |

>Note: OpenSSF score card information is only available when the package or _Component_ Git repo has been added to gather the OpenSSF scorecard metrics. Learn how to add OpenSSF Scorecard from their [Git Repo](https://github.com/ossf/scorecard).

### Readme

Ortelius consumes the README text file found in the associated GitHub repo. The Readme section provides information about the _Component_ and help users understand what the _Component_ is about and how to use it.

### License

Ortelius consumes the license information from the GitHub repository associated to the _Component_. The full license is displayed.

## Impact Assessment Section

When responding to vulnerabilities you must know how widespread the vulnerability is across your runtime environments. Ortelius maps security data to DevOps data to provide an inventory of each _Application_ who uses the _Component_.

### Consuming Applications

The table shows you all of the _Applications_ who are consuming this _Component_.  

| Field              | Description                                                                                                    |
|--------------------|----------------------------------------------------------------------------------------------------------------|
| **Application**    | The _Application Version_ that consumes the _Component Version_.                                               |
| **Domain**         | The organizational level to which the _Application_ belongs.                                                   |
| **Environment**    | The artifact repository, or physical _Environment_ where the _Component's_ consuming _Application_ is running. |
| **Deployment Log** | The Ortelius internal deployment number linked to the deployment log generated by the deployment tool.         |
| **Completed**      | The date/time stamp of when the _Application Version_ was released.                                            |
| **Results**        | Shows if the deployment completed with a success or fail status.                                               |

### Blast Radius

The Blast Radius shows a graphic representation of how many _Applications_ are consuming the _Component_. You can scroll through the graphic image to see a full view of your _Component's_ use across the organization.

### Swagger

As many _Components_ are APIs, Ortelius gathers the Swagger information. Swagger is important because it plays a crucial role in API development and documentation. Swagger helps design, build, document, and consume RESTful web services. If available, the Swagger information is displayed in this section.

>Note: Automate the Readme, SBOM, License, and Swagger Upload via Your Pipeline. You can automatically upload you readme, SBOM, License, and Swagger data using the Command Line Interface (CLI) added to your pipeline. For more information review the [CI/CD CLI details](/guides/userguide/integrations/ci-cd_integrations/).


## _Component_ with DevOps Details Section

Ortelius gathers both security insights and DevOps insights to provide a comprehensive view of a _Component's_ security posture. The DevOps details shows the owner of the _Component_, Build information, Helm and Git details, Key Value data, and Ortelius deployment engine information if used.  

### _Component_ Details

This information provides basic information about the owner of the _Component_ and how to contact them.

| Field           | Description                                                                                                      |
|-----------------|------------------------------------------------------------------------------------------------------------------|
| **Full Domain** | The fully qualified path of the _Domain_ that the _Component_ is to be associated, showing all parent _Domains_. |
| **Name**        | The name of the _Component.                                                                                      |
| **Description** | A short text field with a description of the _Component_.                                                        |
| **Component Owner**                  | The owner of the _Component_, whose default value is the creator of the |_Component_. |
| **Component Owner Email**            | The email of |
| **Component Owner Phone**            | The phone number of the Component owner. |
| **PagerDuty Business Service URL** | Enter the address to the PagerDuty page that is associated to the business service for this _Component_.|
| **PagerDuty Service URL**          | Enter the address to the PagerDuty page that is associated to the _Component_ itself|itself.|
| **Slack Channel**                  | Enter what Slack Channel that can be used to report issues about this _Component_.|
| **Discord Channel**                | Enter the Discord Invite Link you would like your consumers to use for this Component_.|
| **HipChat Channel**                | Enter the HipChat Channel that can be used to report issues about this _Component_.   |

### Build Details

When integrated with your CI/CD engine, Ortelius tracks the DevOps data from the build including:

| **Field**              | **Description**                                            |
|------------------------|------------------------------------------------------------|
| **Build Date**         | The timestamp from when this build job was completed       |
| **Build ID**           | The ID of the CI/CD Workflow that created the _Component._ |
| **Build URL**          | The URL to the CI/CD Workflow.                             |
| **Container Registry** | The Container registry where the Container is stored.      |
| **Container Digest**   | The SHA number of the Container image.                     |
| **Container Tag**      | The tag that was assigned to the Container image.          |


### Helm Details

Helm details are stored for each _Component Version_.  The Helm data is gathered from the CI/CD pipeline. Read the [CI/CD and Ortelius](/guides/userguide/integrations/ci-cd_integrations/).

A Container _Component_ has the following optional attributes:

| **Field**                | **Description**                                                                         |
|--------------------------|-----------------------------------------------------------------------------------------|
| **Helm Chart**           | The Helm Chart used to deploy the _Component_.                                          |
| **Helm Chart Namespace** | The sub-division of the Kubernetes cluster where your _Component_ Container should run. |
| **Helm Chart Repo**      | The repository used to store the Helm Chart, for example DockerHub, ArtifactHub.        |
| **Helm Chart Repo URL**  | Enter the URL to where the chart is located.                                            |
| **Helm Chart Version**   | The Helm Chart Version from the Helm Repository.                                        |


## Git Details

The following Git information is gathered for each _Component_.

| **Field**      | **Description**                                                                                           |
|----------------|-----------------------------------------------------------------------------------------------------------|
| **Git Commit** | The Git SHA number. Populated when integrated into Continuous Delivery Pipelines.                         |
| **Git Repo**   | The Git Repository that triggered the build.Populated when integrated into Continuous Delivery Pipelines. |
| **Git Tag**    | The last tag for the Git Repository. Populated when integrated into Continuous Delivery Pipelines.        |
| **Git URL**    | The link for the Git Repo.                                                                                |


{{% include "/guides/userguide/reusable/Attributes.md" %}}

{{% include "/guides/userguide/reusable/OrteliusAuditTrail.md" %}}

### Auditing Deployments

When a deployment is logged via the CI/CD workflow, the output from the deployment can be passed to the CLI to be persisted with the _Application Version_ and _Component Versions_. Learn more about the [CI/CD CLI Integration](/guides/userguide/integrations/ci-cd_integrations/)

## Audit and Access Section

The Audit and Access Section allows _Users_ within one of the 3 default User _Groups_ to update or view the _Component_. To one of the default User _Groups_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Component_:

| Access     | Description                                                                                                       |
|------------|-------------------------------------------------------------------------------------------------------------------|
| **View**   | This allows any _User_ that belongs to any _Group_ in this list to see the selected _Component_ in the List View. |
| **Change** | This allows any _User_ that belongs to any _Group_ in this list to make changes to the _Component_.               |


