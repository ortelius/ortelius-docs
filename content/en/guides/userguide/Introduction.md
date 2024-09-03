---
title: "Why Use Ortelius"
linkTitle: "Why Use Ortelius"
weight: 1
description: >
  Ortelius for Continuous Security Intelligence
---
## Why Use Ortelius

Ortelius is an Open-Source Continuous Security Intelligence solution designed for decoupled architectures. Ortelius monitors and collects DevSecOps data from the CI/CD pipeline for every artifact. It unifies the data generated across your pipeline, offering a consolidated security profile of the software delivered to end users. With Ortelius’s integrated security intelligence, you can quickly respond to vulnerabilities and issues, gaining a clear view of how a vulnerable package is used, which applications depend on it, and where it has been deployed.  

![Supply Chain Catalog](/supplychaincatalog.png)

### Security Postures in Decoupled Environments

A crucial concept in decoupled architecture is the "<strong>logical</strong> _Application_." A logical _Application_ is a collection of independently deployed _Components_. Each _Component_ has its own Software Bill of Materials report, vulnerability status and security posture. In order to report the security posture of the entire solution delivered to end users, the _Component_ data must be aggregated to the _Application_ level. Ortelius manages logical _Application Versions_ within a decoupled architecture, offering a comprehensive view of the software's security posture. Ortelius provides logical _Application_ SBOMs, real-time _Application_ vulnerabilities, and compliance summaries, based on both the _Component_ and the aggregated logical _Application_.

Ortelius surveils the DevSecOps pipeline to automatically gather security and DevOps data for all _Components_. Ortelius captures DevSecOps data when a _Component_ has been published, creating a new version for each release. It then creates new _Application Versions_ for all impacted 'logical' _Applications_.

## Versioning Critical Security Insights

Ortelius versions both _Components_ and 'logical' _Applications_.  When versioning _Components_, Ortelius provides insights into that versions security posture including:

- Software Bill of Material
- OpenSSF Scorecard
- Common Vulnerabilities and Exposures (CVE)
- Swagger Details
- Readme and Licensing
- Consuming Applications
- Ownership
- Git repo
- Git Commit (Tag and branch)
- CI/CD Build Number
- Container SHA
- Docker Registry
- Key Values
- Deployment Script (Helm Chart, Ansible Playbook, etc.)
- Any Attributes (DB Name for example)

 _Application Versions_ are based on a collection of _Component Versions_. When a new version of a _Component_ is created, Ortelius auto increments the _Component_ version and all consuming _Application_ versions.  Dashboards show for each new _Application_ version:

- A full map of all _Components_ the _Application_ version is consuming
- An aggregated _Application_ SBOM
- An _Application_ CVE report, with real-time updates
- The specific changes that created the new _Application_ version (your new diff report)
- The audit history
- Log history
- Where the new _Component_ is running
- Trends (Deployment time, success failure rates)
- An _Application_ security posture report

## Core Features

**Package Vulnerability Search** Discover where a vulnerability is running across all endpoints. Ortelius can show you which logical _Applications_ are consuming a vulnerable package, and where it is deployed.

**Dependency maps:** Shows you the 'logical' view of your _Application_ and which _Components_ are consumed. Once you begin decoupling monolithic software, you need to track who is using each independently deployed _Component_. An _Application_ is a logical collection of _Components_ that make up an entire software solution.

**Application Level SBOMs and CVE:** Ortelius aggregates all _Component_ level data up to the logical _Application Version_ making it easy to provide security reporting on a complete software system, even when it is decoupled.

**Blast Radius:** Know your _Component_ impact before you ever deploy. Ortelius can provide predictive insights showing what _Applications_ will be impacted by an updated service. Ortelius provides this data in clear maps of dependent _Applications_ and services. The blast radius also shows what _Components_ and _Applications_ are impacted by a vulnerability for rapid response.

**Improved incident response:** Ortelius makes it easy to find the owner of _Component_, and contact them through PagerDuty, HipChat, Discord, Slack, email or phone.

**Integrates into your CD pipeline:** Ortelius is automated via your CD Pipeline to continuously version your decoupled architecture with changes, including where they are deployed.

**Domain-Driven-Design:** The Ortelius Domain structure organizes your software supply chain to encourage reuse and sharing across development teams.


