---
title: "OSV.Dev CVE Integration"
linkTitle: "OSV.Dev CVE Integration"
weight: 315 
description: >
  Cross Referencing Packages with CVE Database
---

## OSV

Ortelius uses [OSV.dev](https://osv.dev/) to cross reference packages for gathering CVE data. Every 30 minutes Ortelius performs an OSV.dev look up for every package listed in every SBOM to determine if any vulnerabilities exist. The look-up is performed using the OSV public facing APIs. SBOM generation is required to perform this scan.

The CVE results are displayed at two levels, the _Component Version_ and the _Application Version_. If you have included SBOM scanning as part of your DevOps pipeline, you will pass the name of the SBOM to Ortelius using the [Ortelius CLI](/guides/guides/userguide/integrations/ci-cd_integrations/). Ortelius supports SPDX and CycloneDX SBOM formats. If you have not added SBOM's as part of your DevOps Pipeline, you can include it through the Ortelius CLI process. The Ortelius CLI uses [Syft](/guides/userguide/integrations/spdx-cyclonedx-syft/) to generate the SBOM.

> Note: Ortelius must have access to OSV.Dev in order to continuously gather the CVE data. 

### Viewing Component CVE Data

CVE data is associated to a particular _Component Version_ and can be seen by going to the Component Detail View. Ortelius gathers the CVE information every 30 minutes for all Components. For this reason it is possible for new CVEs to appear. If a new CVE is found by OSV.dev, Ortelius automatically updates your Component's CVEs. 

### Viewing Application Level CVE Data

Ortelius aggregates lower-level _Component_ data up to all consuming applications. When you view the CVEs at the _Application Version_ level, you are seeing a combination of all CVEs aggregated from the _Components_ which your _Application_ depends. Your _Applications_ CVE data can change over time based on the changes at the _Component Version_ level. 
