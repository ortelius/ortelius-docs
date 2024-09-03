---
title: "Free SaaS Signup and Quick Tutorial"
linkTitle: "Free SaaS Signup and Quick Tutorial"
weight: 2
description: >
  Take a Tour of Continuous Security Intelligence
---
To help you understand the need for continuously monitoring your security intelligence, Ortelius has provided a free version with a tutorial for you to explore. This free version is based on the Ortelius.io open-source project incubating at the [Continuous Delivery Foundation](https://cd.foundation), hosted by DeployHub Team. Explore how the Ortelius _Application_ is configured and walk through basic concepts of Continuous Security Intelligence. 

![Ortelius Hosted by DeployHub Team](/guides/userguide/images/HostedLogo-SignIn.png)

The Ortelius project uses a decoupled microservices architecture serving as a great example of how Continuous Security Intelligence unifies fragmented clues and forensics across _Components_ to expose the _Application_ level security posture. In this tutorial you will see how Ortelius aggregates _Component_ level security to the _Application_ level providing  _Application_ level:
- SBOMs
- real-time vulnerability reports
- compliance reports

You will also see how Ortelius uses a Domain-Driven Design (DDD) to organize data across teams. 

## Signing Up and Getting Started

When you [signup for Ortelius](https://www.deployhub.com/deployhub-team-signup/), you are asked for basic information, your UserID/Password, Company and Project names. Your UserID/Password and Company name are unique.  Your Project will be a _Subdomain_ under your Company _Domain_.

Ortelius is accessible through the following url:

[https://console.deployhub.com/dmadminweb/Home](https://console.deployhub.com/dmadminweb/Home)

Login using the UserID and Password you used when you signed up for Ortelius. Check your email for your login information. 

Upon logging into Ortelius, you will be given an option to select your Company Name Domain, or the Open Source Domain. The Open Source Domain is prepopulated with data so you can take a tour.  Select the Open Source Domain to start exploring. 

![Sign into a Domain](/guides/userguide/images/domainsignin.jpg)

<p><br></p>

## Explore Domains

_Domains_ serve as the basic structure of organizing Continuous Security Intelligence. Developers use _Domains_ to catalog their _Components_ based on 'solution spaces.' Organizing your software supply chain in this way allows for _Components_ to be easily shared.

_Domains_ are not folders. They serve as a method for creating fully qualified names of Objects within Ortelius to keep things organized.  _Domains_ also manage security and Tasks.  When you assign security options and Tasks at the _Domain_ level, any child _Subdomain_ inherits the value. A child _Subdomain_ can override a parent _Domain_ value. 

You can explore the _GLOBAL.open source_ Domain to learn how Continuous Security Intelligence is organized.  In Ortelius terminology, the _GLOBAL.open source_ Domain has multiple _Subdomains_.

1) From the left hand side menu, select _Domains_. This will take you to the _Domain_ Details. All _Domains_ you have access to will be shown in the _Domain_ List Box. 

2) Select GLOBAL.Open Source.Linux Foundation. In the Details, you will see this _Domain_ has two _Sub-Domains_, the CDF and the OpenSSF. Driving into the GLOBAL.Open Source.Linux Foundation.CDF _Domain_ will show you the Ortelius project is a _Sub-Domain_ of the CDF.   

For More information on Domains see - [Building _Domains_](/guides/guides/userguide/definedomains/)

<p><br></p>

## Explore Components

_Components_ are artifacts, binaries, files or any deployable artifact. _Components_ are assigned to _Applications_. This assignment allows for the aggregation of data from the _Components_ to the _Applications_ that consume them, providing unified Software Bill of Materials reports and Application Security Posture reports.  

### Using the Component List View

From the left hand side menu, select "_Components_". This will take you to a list of view of all _Components_ assigned to the selected _Domain_. Using the filter option, choose _GLOBAL.Open Source.Linux Foundation.CDF.Ortelius_ to view all of the _Components_ consumed by the Ortelius open source project. 

![Ortelius Domain](/guides/userguide/images/OrteliusDomainSelection.jpg)

<p><br></p>

<strong><u>Sorting Components</u></strong>

Sort Components by "Completed." "Completed" indicates the _Component_ has been deployed to end users. From the _Component_ list view, click on "Completed" to sort.

<p><br></p>

<strong><u>Viewing a Component's Version</strong></u>

The first item in our sorted _Component_ list is the latest version of _ms-compitem-crud_ represented by the version label "main;10_0_834_g1bdd9d_."  

![Component List](/guides/userguide/images/component-version.jpg)

<p><br></p>


### View a Component's Security Profile and Details

The _Component_ Detail page shows you the _Components_ Security Profile, Impact Assessment, and DevOps configuration. You can also view previous versions, and compare your current version with an older version. Double click on the _ms-compitem-crud_ _Component_ to view its security profile and see a list of previous versions. 

<p><br></p>

<strong><u>View Previous Versions and Run a Comparison</strong></u>

 From the top menu, look for the previous _Version button_. 

 ![Compare Components](/guides/userguide/images/component-compare-menu.jpg)


 This button shows you the total number of previous versions of this _Component_. Select the button to be provided a list of all previous versions. From this list you can view the details of any previous versions. 

 Generate a Comparison Report between two _Component_ versions. Select the _Compare Button_. You will be provided a list to select the previous version to compare the current version you are viewing. 

You will be provided a report that shows the differences between these two _Component versions_. 

![Compare Components](/guides/userguide/images/componentcompare.jpg)

<p><br></p>

<strong><u>SBOM and Vulnerabilities</u></strong>

When you view a _Components_ details, the first attribute you will see is the _Component's_ Software Bill of Materials and real-time vulnerabilities. 

When your _Component_ build executes, Ortelius will generate a Software Bill of Materials (SBOM) report using the CI/CD command line integration (CLI). Once gathered, Ortelius cross references the SBOM results to known vulnerabilities in real-time. While the SBOM is a static view, the vulnerabilities are updated regularly. Ortelius continuously scans [OSV.dev](https://osv.dev/) for new known vulnerabilities for all the packages in the SBOM.

In this view, you will see the _Component's_ SBOM displayed with the Package, Version, License and OpenSSF Scorecard values. 

<p><br></p>

>Note: You can export a _Component's_ Software Bill of Materials (SBOM) Report by returning to the _Component_ list view, check mark the _Component_ and select _Export SBOM_ from the top navigation menu. You will be a provided a full view of your _Components_ SBOM for sharing across teams. 



![Component SBOM](/guides/userguide/images/SBOM-component.jpg)

<p><br></p>

<strong><u>OpenSSF ScoreCard</u></strong>

Ortelius uses the GitRepo and GitCommit from the the CI/CD command line integration (CLI) to gather OpenSSF scorecard data. When available, you will see the _Components_ compliance with OpenSSF scorecard. 

![Components Scorecard](/guides/userguide/images/componentOpenSSFSC.jpg)

<p><br></p>

<strong><u>Readme and License</u></strong>

In addition to the above, Ortelius provides you with the _Read.me_ information and license information defined by the GitRepo. 

<p><br></p>

<u><strong>Impact Assessment Section</u></strong>

Gain insight into how the _Component_ affects consuming _Applications_. This view quickly reveals the impact of _Component_ vulnerabilities on all dependent logical _Applications_.

<p><br></p>

<strong><u>Consuming Applications and Blast Radius</u></strong>

View a list of _Applications_ that depend on the _Component_, along with a graphical representation of the 'Blast Radius.' The Blast Radius illustrates which 'logical' _Applications_ are affected by a vulnerability, anomaly, or update. In this section, you will find a map displaying all _Applications_ utilizing this version of the _Component_.

<p><br></p>

<strong><u>Swagger</u></strong>

Ortelius provides you a view of the _Components_ Swagger information when available. 

<p><br></p>

<strong><u>Component with DevOps Details Section</u></strong>

This section gives you additional information about the _Component_ such as _Owner_ name and contact information, build details, Git Repo information and Helm Chart information if used. 

For More information on Components see - [Publishing _Components_](/guides/guides/userguide/2-define-components/).

<p><br></p>

## Explore Applications

An _Application_ is a collection of _Components_ that together form a complete software solution. Ortelius handles the logical _Application_ by aggregating _Component_ data at the _Application_ level. The Application features display all logical _Applications_ with their associated Components, and their combined security profile.


### Using the Application List View

From the left hand side menu, select "_Applications"_. If you have completed the above steps, you will still be in the _GLOBAL.Open Source.Linux Foundation.CDF.Ortelius_ _Domain_. Notice that the first item in the list is _ortelius_ with the most recent Version number. 

![Application List](/guides/userguide/images/app-list.jpg)

<p><br></p>

<strong><u>Run Reports</strong></u>

Select the Ortelius Application and run the following reports:

- Compliance Summary - this report is a summation of data gathered across your CI/CD pipeline and includes a compliance checklist for a variety of security checks and environment inventory for the _Application_ _Component_ versions.

![Compliance Run](/guides/userguide/images/compliance-results.jpg)

- Deployment Frequency - this report shows how often each _Environment_ has been deployed to, based on the CI/CD pipeline data.

- Lead Time for Change - this report shows the average number of days for a change to be deployed. 

- Export SBOM - This is a federated Software Bill of Materials report that aggregates all _Component_ data, including known vulnerabilities at the time the SBOM was exported. 

<p><br></p>

<u><strong>Find an Open-Source Package Across Your Software Supply Chain</u></strong>

Ortelius allows you to search through all _Applications_ for open-source packages. Rapidly responding to vulnerabilities requires you know precisely where your exposure to the vulnerability is running, and what _Components_ need to remediated. 

Search for a Package by selecting the "Package Search" menu option from the _Application_ list view. Enter the package you wish to search for such as "Spring." 

![Package Search Menu](/guides/userguide/images/spring-search.jpg)

<p><br></p>

You will be provided a list of all _Applications_ with their _Components_ that are dependent upon the package. 

![Package Search Menu](/guides/userguide/images/spring-results.jpg)

<p><br></p>

### View an Application's Security Profile and Details

The _Application_ Detail page shows you the _Application_ Security Profile, Impact Assessment, and DevOps configuration. You can also view previous versions, and compare your current version with an older version. Double click on the _Ortelius_ _Application_ to view its security profile and retrieve a list of previous versions. 

<p><br></p>

<strong><u>View Previous Versions and Run a Comparison</strong></u>
 
 From the top menu, find for the _Version button_. This button shows you the total number of previous versions of this _Application_. Select the button to be see a list of all previous versions. From this list you can select any version to see its details. 

 Generate a Comparison Report between two _Application_ versions. Select the _Compare Button_. You will be provided a list to select the previous version to compare the current version you are viewing. You will be provided a report that shows the differences between these two _Application versions_. 

![Compare applications](/guides/userguide/images/app-compare.jpg)

<p><br></p>

<u><strong> View the Application's Aggregated Software Bill of Materials and Real-time Vulnerabilities</strong></u>

When exploring the _Application_ details, the first attribute you will see is the _Applications_ summarized Software Bill of Material (SBOM) report and known vulnerabilities whin the Security Posture Section. An _Application_ SBOM provides a detailed report of all _Component_ SBOM data within the _Application_, with duplicates removed. When a _Component_ is updated, Ortelius automatically generates a new version of all _Applications_ that use that _Component_, along with a new aggregated SBOM. Ortelius then cross-references all _Component_ packages within the _Application_ against known vulnerabilities. If you need to produce an SBOM for governance purposes, you can export the SBOM from the _Application_ List View _Reports_ menu option.

<p><br></p>

<u><strong> View the Application's Impact Assessment</strong></u>

In the Impact Assessment Section, you will see the _Environments_ the _Application_ has been deployed to, as well as a list of _Components_ the _Application_ depends upon. In addition, you will see an graphical illustration of the _Application_ with all of the consumed _Components_. 

<p><br></p>

<u><strong> View the Application's DevOps Details</strong></u>

This section shows your _Applications_ Log History, and Key Value Configurations that were used.

Learn More at  [Packaging _Applications_](/guides/guides/userguide/2-defining-applications/)

<p><br></p>

## Conclusion

There are many other features of Ortelius that we did not cover on this short test drive. You may want to explore how to connect your CI/CD pipeline to automatically connect SBOMs and other DevSecOps tools to your pipeline process. See [SPDX, CycloneDX and Syft](//guides/userguide/integrations/spdx-syft-cyclonedx/) on how you can include SBOMs in your CI/CD process. 

Other topics to explore include: 

-  Get started by connecting  your [CI/CD pipeline](/guides/guides/userguide/integrations/ci-cd_integrations/) to add _Components_ and _Applications_.

