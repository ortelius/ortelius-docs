---
title: "OpenSSF Scorecard Integration"
linkTitle: "OpenSSF Scorecard Integration"
weight: 314 
description: >
  Integrating and Viewing OpenSSF Scorecard
---

![OpenSSFScorecard](/guides/userguide/images/openssf_security_small.png)

## OpenSSF Scorecard - Security Health Metrics for Open Source Packages and _Components_

The [OpenSSF Scorecard](https://scorecard.dev/) is an automated security compliance tool that performs "checks" associated with software security. It assigns each check a score of 0-10, with 10 being the highest level of compliance. You can use these scores to understand specific areas of security to improve in order to strengthen the security posture of your project. OpenSSF Scorecard is used to make informed decisions about accepting security risks within a codebase.

OpenSSF Scorecard data is derived from the Git Repository associated to the _Component Version_. 

>Note: Not all _Component Versions_ associated to open source projects have implemented the Scorecard. In this case, a "0" is the default value. 

### Gathering Scorecard Metrics

When a [_Component Version_](guides/userguide/2-define-components/) is created, the OpenSSF Scorecard metrics are retrieved from Git and stored as part of _Component Version_ configuration data. 

The Scorecard Rest API call is made using the Git Repo and Git Commit as parameters.  If the Scorecard metrics are not found a second call is made to the Rest API without the Git Commit.  

> Note:  The _Component Version_ must have the Git Repo and Git Commit fields set in order to retrieve the metrics from the Scorecard Rest API.  The Git Repo and Git Commit can be added using the [Ortelius CI/CD Integration](/guides/userguide/integrations/ci-cd_integrations/).

### Viewing Scorecard Metrics

On the _Component Version_ details screen, the _OpenSSF Scorecard_ section will be populated with the metrics found.  _OpenSSF Scorecard Pinned to Commit_ will be true if metrics were found for the corresponding git commit, otherwise it will be false.  The other checks in the Scorecard will be ranked 0 to 10, with 10 being the best.  All the checks will be 0 if no metrics are available. 

### View Scorecard Metrics for Package Dependencies

On the _Component Version_ details screen, the _Software Bill of Materials (SBOM)_ section includes the OSSF Scorecard column.  This column is the overall average score for the package.  The column will be 0 if no Scorecard exists for the package dependency.

### Generating Scorecard Metrics

The CI/CD pipeline needs to generate the Scorecard metrics.  See [Scorecard Installation and Configuration](https://github.com/ossf/scorecard?tab=readme-ov-file#using-scorecard) for details.
