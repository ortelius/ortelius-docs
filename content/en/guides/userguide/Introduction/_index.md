---
title: "Welcome"
linkTitle: "Welcome"
weight: 1
description: >
  Introduction to the Ortelius Continuous Security Intelligence
---
## Why Use Ortelius

Ortelius is an open source, Continuous Security Intelligence solution for surveilling, gathering and analyzing the security posture of  _Components_ and their consuming "logical" _Applications_". Ortelius is particularly suited for complex, decoupled architectures where hundreds of artifacts and repos are used, and a central view of the entire supply chain from a usage, security, and inventory perspective is required. When you outgrow your excel spreadsheet, its time to consider Ortelius. The Ortelius watch center tracks _Component_ ownership, SBOMs, vulnerabilities, dependency relationships, key values, deployment metadata, consuming _Applications_ and versions. Ortelius collects clues and forensics from the DevOps pipeline centralizing supply chain data across tools and teams.

![Supply Chain Catalog](/supplychaincatalog.png)

## The "Logical" Application

In order to understand the security posture of an _Application_, teams need to know the _Component_ dependencies, and the _Component_ packages that the _Application_ consumes. Ortelius aggregates DevSecOps data to the ‘logical’ application versions simplifying the complexities of a cloud-native architecture. Ortelius provides a clear view of the software supply chain for every "logical" _Application_ based on its _Components_. By tracking _Component_ level information, Ortelius can easily aggregate metadata up to the 'logical' application producing application level security postures with consolidated SBOMs, vulnerabilities, audit reports, deployment inventory and security compliance status. 

**Decoupled Environments are Complex**

Migrating to decoupled, cloud-native architecture breaks the way we assemble and configure software. With a decoupled implementation, we no longer build a complete software solution, or _Application Version_. Instead we manage many moving parts that communicate at run-time based on APIs.  The loss of the _Application Version_ disrupts the core of software delivery.  It impacts most of our standard software practices including the generation of application security level reports.  After all, everything is based on an Application Version from tracking changes request, determining differences, tracking relationships and supporting users. Without a method of tracking the logical _Application_, IT teams struggle to confirm that the software they deliver to end users is safe. 

Ortelius is not a 'artifact registry' or 'API Gateway."  Instead, Ortelius interacts with the DevOps pipeline to automatically gather supply chain metadata. Tracking _Components_ in this way facilitates their sharing and reuse across teams. Ortelius serves as an internal market place for finding, tracking and versioning _Components_ and relating them to the _Applications_ that consume them. The evidence organization is based on a _Domain_ structure to support a Domain Driven Design.

## Versioning - Ortelius Secret Sauce

Ortelius versions both _Components_ and 'logical' _Applications_.  When versioning _Components_, Ortelius provides insights needed to determine if the service is safe for consumption including:

- Consolidated and Shared Software Bill of Materials
- OpenSSF Scorecard for _Components_ and _Applications_
- Aggregated Common Vulnerabilities and Exposures (CVE)
- Swagger Details
- Readme and Licensing
- Consuming _Applications_ for Each _Component_
- Ownership
- Git repo
- Git Commit (Tag and branch)
- CI/CD Build Number
- Container SHA
- Docker Registry
- Key Values
- Deployment Script (Helm Chart, Ansible Playbook, etc.)
- Any Attributes (DB Name for example)

 _Application Versions_ are based on a collection of _Component Versions_. If a new version of a _Component_ is built or registered, Ortelius auto increments the _Component_ version and the consuming _Application_ version.  Dashboards are provided for each new _Application_ version showing:

- A full map of all the _Component Versions_ the _Application_ version is consuming.
- An _Application_ Level SBOM, based on all _Component_ SBOMs
- An _Application_ Level CVE
- The specific changes that created the new _Application_ version (your new diff report)
- The audit history of all _Component_ and _Application_ changes
- Log history
- Where _Components_ are running across clusters and _Environments_
- Trends (Deployment time, success failure rates)



## Other Core Features

**Domain-Driven-Design:** First and most important is the Ortelius Domain structure for organizing security forensics. This feature organizes your _Component_ metadata in a method that encourages reuse and sharing across development teams.

**Dependency maps:** Shows you the 'logical' view of your application and which _Components_ it consumes. Once you begin sharing _Components_ you need to track their usage. An _Application_ is a logical collection of _Components_ that make up an entire software solution.

**Application Level SBOMs and CVE:** Ortelius aggregates all _Component_ level data up to the logical _Application Version_ making it easy to provide security reporting on a complete software system, even when it is decoupled. 

**Blast Radius:** Know your service impact before you ever deploy. Ortelius can provide predictive insights showing what _Applications_ will be impacted by an updated service. Ortelius provides this data in clear maps of dependent _Applications_ and services.

 **Improved incident response:** Ortelius makes it easy to find the owner of microservice or common _Component_, and contact them through PagerDuty, HipChat, Discord, Slack, email or phone.

**Integrates into your CD pipeline:** Ortelius is automated via your CD Pipeline to continuously version your decoupled architecture with changes, including where they are deployed. 

