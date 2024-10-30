---
title: "Free SaaS Signup and Quick Tutorial"
linkTitle: "Free SaaS Signup and Quick Tutorial"
weight: 2
description: >
  Take a Tour of Continuous Vulnerability Management
---
To help you understand the need for continuously monitoring your vulnerabilities, Ortelius has provided a free version with a tutorial for you to explore. This free version is based on the Ortelius.io open-source project incubating at the [Continuous Delivery Foundation](https://cd.foundation), hosted by DeployHub, Inc. Explore how the Ortelius _Application_ is configured and walk through basic concepts of Continuous Vulnerability Management.

![Ortelius Hosted by DeployHub](/guides/userguide/images/HostedLogo-SignIn.png)

The Ortelius project uses a decoupled microservices architecture serving as a great example of how Continuous Security Intelligence unifies fragmented clues and forensics across _Components_ to expose the _Application_ level security posture. In this tutorial you will see how Ortelius aggregates _Component_ level security to the _Application_ level providing comprehensive security insights at the  _Application_ level:
- SBOMs
- real-time vulnerability reports
- compliance reports

You will also see how Ortelius uses a Domain-Driven Design (DDD) to organize data across teams.

## Signing Up and Getting Started

When you signup for Ortelius, you are asked for required information, your Company, Project names, first name, last name, email and UserID/Password. Your UserID/Password and Company name are unique.  Your Project will be a _Subdomain_ under your Company _Domain_.

### Signup 

<iframe src="https://www.deployhub.com/ortelius-saas-signup/" width="1200" height="1000"></iframe>

### Login and Select the Domain

Ortelius is accessible through the following url:

[https://console.deployhub.com/dmadminweb/Home](https://console.deployhub.com/dmadminweb/Home)

Login using the UserID and Password you used when you signed up for Ortelius. 

Upon logging into Ortelius, you will be given an option to select your own Company Domain, or the Open Source Domain. For this tutorial select the Open Source Domain. It is prepopulated with data so you can take a quick tour.

![Sign into a Domain](/guides/userguide/images/domainsignin.jpg)

_Domains_ serve as the basic structure of organizing Continuous Vulnerability Management. Developers use _Domains_ to catalog their _Components_ based on 'solution spaces.' Organizing your software supply chain in this way allows for _Components_ to be easily found and shared. _Domains_ are not folders. They serve as a method for creating fully qualified names of Objects within Ortelius to keep things organized.  _Domains_ also manage security and Tasks.  When you assign security options and Tasks at the _Domain_ level, any child _Subdomain_ inherits the value. A child _Subdomain_ can override a parent _Domain_ value.

You can explore the _GLOBAL.open source_ Domain to learn how data is managed for Continuous Vulnerability Management. In Ortelius terminology, the _GLOBAL.open source_ Domain has multiple _Subdomains_.
For More information on Domains see - [Building _Domains_](/guides/userguide/definedomains/)

<p><br></p>

## The Ortelius Tutorial

This quick tutorial will walk you through the concepts of _Components_, _Component Versions_, _Applications_, and _Application Versions_. _Component Versions_ are associated with Software Bill of Materials (SBOM) reports. For each new release of a _Component Version_, a new SBOM is generated. Ortelius scans these _Component Version's_ SBOMs in real-time, detecting new vulnerabilities even after the build step. Additionally, Ortelius integrates with the DevOps pipeline to track deployment details, including the locations where each _Component Version_ has been deployed. This tracking enables Ortelius to indicate where an OS package, used by a _Component_ or _Application_, is running across your entire infrastructure.

Ortelius aggregates _Component Versions_ into _Application Versions_. An _Application Version_ is a collection of _Component Versions_ that are released as a single software solution. This aggregation allows Ortelius to create SBOMs at the _Application_ level. Leveraging the results from the Component SBOMs, Ortelius provides visibility into all new vulnerabilities affecting each _Application Version_.

In this tutorial you will:

- Explore Components
- View Component SBOM and Vulnerabilities
- Explore Applications
- View Application Vulnerabilities
- Generate an Application SBOM
- Search for a OS package across all _Endpoints_.


## Explore Components

_Components_ are artifacts, binaries, files or any deployable artifact. _Components_ are assigned to _Applications_. This assignment allows for the aggregation of data from the _Components_ to the _Applications_ that consume them, providing unified Software Bill of Materials reports and Application Security Posture reports.  

### Using the Component List View

From the left hand side menu, select "_Components_". This will take you to a list of view of all _Components_ assigned to the selected _Domain_. Using the filter option, choose _GLOBAL.Open Source.Linux Foundation.CDF.Ortelius_ to view all of the _Components_ consumed by the Ortelius open source project.

![Ortelius Domain](/guides/userguide/images/OrteliusDomainSelection.jpg)

<p><br></p>

<strong><u>Sorting Components</u></strong>

Sort Components by "Completed." "Completed" status indicates the _Component_ has been deployed to end users. From the _Component_ list view, click on "Completed" to sort.

<p><br></p>

<strong><u>Viewing a Component's Version</strong></u>

Because you are viewing real-time data, the items in the list will change based on the last update from the Ortelius community. Search the latest version of _ms-compitem-crud_. You will see a version label such as: 

`main;10_0_834_g1bdd9d_ `

Here is an example:

![Component List](/guides/userguide/images/component-version.jpg)

<p><br></p>


### View a Component's Security Profile and Details

The _Component_ Detail page shows you the _Component Version's_ Security Profile, Impact Assessment, and DevOps configuration. For every update of a _Component_, Ortelius uses an internal versioning engine that captures configuration and security changes to the _Component_. Double click on the _ms-compitem-crud_ _Component_ to view its latest security profile.

<p><br></p>

<strong><u>SBOM and Vulnerabilities</u></strong>

When you view a _Components_ details, the first attribute you will see is the _Component's_ Software Bill of Materials and real-time vulnerabilities.

When your _Component_ build executes, Ortelius will generate a Software Bill of Materials (SBOM) report using the CI/CD command line integration (CLI). Once gathered, Ortelius cross references the SBOM results to known vulnerabilities in real-time. While the SBOM is a static view, the vulnerabilities are updated regularly. Ortelius continuously scans [OSV.dev](https://osv.dev/) for new known vulnerabilities for all the packages in the SBOM.

In this view, you will see the _Component's_ SBOM displayed with the Package, Version, License and OpenSSF Scorecard values.

<p><br></p>

>Note: You can export a _Component's_ Software Bill of Materials (SBOM) Report by returning to the _Component_ list view, check mark the _Component_ and select _Export SBOM_ from the top navigation menu. You will be a provided a full view of your _Components_ SBOM to be shared across teams.



![Component SBOM](/guides/userguide/images/component-sbom.svg)

<p><br></p>

<strong><u>OpenSSF ScoreCard</u></strong>

Ortelius uses the GitRepo and GitCommit from the the CI/CD command line integration (CLI) to gather OpenSSF scorecard data on the _Component_ itself. When available, you will see the _Component's_ compliance with OpenSSF scorecard.

![Components Scorecard](/guides/userguide/images/component-openssf.svg)

<p><br></p>

<u><strong>Impact Assessment Section</u></strong>

Gain insight into how a new _Component Version_ impacts consuming _Applications_. This list shows which _Application Versions_ consume the _Component Version_. Understand, if a _Component Version_ has a vulnerability, so will the consuming _Application Version_. 

View a list of _Applications_ that depend on the _Component_, along with a graphical representation of the 'Blast Radius.' The Blast Radius illustrates which 'logical' _Applications_ are affected by a vulnerability, anomaly, or update. In this section, you will find a map displaying all _Applications_ utilizing this version of the _Component_.


![Consuming Applications](/guides/userguide/images/component-impact.svg)
<p><br></p>


<strong><u>Component with DevOps Details Section</u></strong>

This section gives you additional information about the _Component_ such as _Owner_ name and contact information, build details, Git Repo information and Helm Chart information if used.

![DevOps Detials](/guides/userguide/images/component-devops.svg)


For More information on Components see - [Publishing _Components_](/guides/userguide/2-define-components/).

<p><br></p>

<strong><u>View Previous Versions and Run a Comparison</strong></u>

View previous versions, and compare your current version with an older version.From the top menu, look for the previous _Version button_.

 ![Compare Components](/guides/userguide/images/component-compare-button.svg)


 This button shows you the total number of previous versions of this _Component_. Select the button to retrieve a list of all previous versions. From this list you can view the details of any previous versions.

 Generate a Comparison Report between two _Component_ versions. Select the _Compare Button_. You will be provided a list to select the previous version to compare the current version you are viewing.

You will be provided a report that shows the differences between these two _Component versions_.

![Compare Components](/guides/userguide/images/component-compare.png)

<p><br></p>


## Explore Applications

An _Application_ is a collection of _Components_ that together form a complete software solution. Ortelius handles the logical _Application_ by aggregating _Component_ data at the _Application_ level. The Application features display all logical _Applications_ with their associated Components, and their combined security profile. Each time a new _Component Version_ is released through the CI/CD pipeline, a new _Application Version_ is created. Ortelius uses an internal versioning engine that captures configuration, DevOps and Security data for every update. 


### Using the Application List View

From the left hand side menu, select "_Applications"_. If you have completed the above steps, you will still be in the _GLOBAL.Open Source.Linux Foundation.CDF.Ortelius_ _Domain_. Notice that the first item in the list is _ortelius_ with the most recent Version number.

<p><br></p>

<strong><u>Select the Application and Run Reports</strong></u>

Select the Ortelius Application by clicking on the check box and run the Compliance Summary report. This report is a summation of data gathered across your CI/CD pipeline including a compliance checklist for a variety of security checks and environment inventory for the _Application Versions_.

![Application List](/guides/userguide/images/select-application-compliance.png)

<p><br></p>

![Compliance Run](/guides/userguide/images/compliance-results.jpg)

<p><br></p>
<p><br></p>

Next, select the Export SBOM option and generate an Application-level SBOM, derived from the Component dependency SBOMs. 

![Application SBOM](/guides/userguide/images/select-application-sbom.png)
<p><br></p>

This report is a federated Software Bill of Materials report that aggregates all _Component_ data, including known vulnerabilities at the time the SBOM was exported.

![Application SBOM](/guides/userguide/images/application-sbom.svg)

<p><br></p>

<u><strong>Find an Open-Source Package Across Your Software Supply Chain</u></strong>

Ortelius allows you to search through all _Applications_ for open-source packages. Rapidly responding to vulnerabilities requires you know precisely where your exposure to the vulnerability is running, and what _Components_ need to remediated.

Search for a Package by selecting the "Package Search" menu option from the _Application_ list view.


![package search](/guides/userguide/images/packagesearch-button.png)

 Enter the package you wish to search for such as "Spring."

![Package Search Menu](/guides/userguide/images/spring-search.jpg)

<p><br></p>

You will be provided a list of all _Applications_ with their _Components_ that are dependent upon the package.

![Package Search Menu](/guides/userguide/images/spring-results.jpg)

<p><br></p>


### View an Application's Security Profile and Details

The _Application_ Detail page shows you the _Application_ Security Profile, Impact Assessment, and DevOps configuration. You can also view previous versions, and compare your current version with an older version. Double click on the Ortelius _Application_ from the list view to explore the _Application Version's_ detials. 

<strong><u>View Previous Versions and Run a Comparison</strong></u>

From the top menu, find for the _Version_ and _Compare_ buttons. These buttons show you the total number of previous versions of this _Application_ and allows you to compare the current version with any other version. 

![Compare applications](/guides/userguide/images/version-compare-button.png)
 
<p><br></p>

Select the Versions button to be see a list of all previous versions. From this list you can select any version to see its details.

To generate a Comparison Report between two _Application_ versions, select the _Compare Button_. You will be provided a list to select the previous version to compare the current version you are viewing. You will be provided a report that shows the differences between these two _Application versions_.

![Compare applications](/guides/userguide/images/application-compare.png)

<p><br></p>
<u><strong> View the Application's Aggregated Software Bill of Materials and Real-time Vulnerabilities</strong></u>

When exploring the _Application_ details, the first attribute you will see is the _Applications_ summarized Software Bill of Material (SBOM) report and known vulnerabilities within the Security Posture Section. An _Application_ SBOM provides a detailed report of all _Component_ SBOM data within the _Application_, with duplicates removed. When a _Component Version_ is updated, Ortelius automatically generates a new version of all _Applications_ that use that _Component_, along with a new aggregated SBOM. Ortelius then cross-references all _Component_ packages within the _Application_ against known vulnerabilities. If you need to produce an SBOM for governance purposes, you can export the SBOM from the _Application_ List View _Reports_ menu option.

![Application-Detail-Sbom](/guides/userguide/images/application-detail-sbom.svg)

<p><br></p>

<u><strong> View the Application's Impact Assessment</strong></u>

In the Impact Assessment Section, you will see the _Environments_ the _Application_ has been deployed to, as well as a list of _Components_ the _Application_ depends upon. In addition, you will see an graphical illustration of the _Application_ with all of the consumed _Components_.

![Application-Detail-Sbom](/guides/userguide/images/application-impact-assessment.svg)

<p><br></p>

<u><strong> View the Application's DevOps Details</strong></u>

This section shows your _Application's_ Log History, and Key Value Configurations that were used.
<p><br></p>

![Application-devops](/guides/userguide/images/Application-devops.svg)

Learn More at  [Packaging _Applications_](/guides/userguide/2-defining-applications/)

<p><br></p>



## Next Steps and Conclusion

You have now covered the basic objects and how Ortleius manages vulnerabilities across the CI/CD process from code to cloud. There are many other features of Ortelius that we did not cover on this short test drive. 

Next steps:
- You may want to explore how to connect your CI/CD pipeline to Ortelius and add SBOM collection to your DevSecOps process. See [SPDX, CycloneDX and Syft](//guides/userguide/integrations/spdx-syft-cyclonedx/) on how you can include SBOMs in your CI/CD process.
- Complete a POC. Now that you have signed up to Ortelius, try it with your own data. Here is a [Proof of Concept whitepaper](https://docs.ortelius.io/Ortelius-General-Poc.pdf) to follow. 
- Get started by connecting  your [CI/CD pipeline](/guides/userguide/integrations/ci-cd_integrations/) to add _Components_ and _Applications_.
- Talk to the community - Join [Discord](https://discord.gg/BDfJybgh) and give us feedback. We want to hear from you. 

Thank you for taking the time to learn how you can use Ortelius to evolve your DevOps pipeline to a DevSecOps pipeline, incorporating CI/CD cybersecurity into your existing pipeline tooling. 
