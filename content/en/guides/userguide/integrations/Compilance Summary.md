---
title: "Application Compliance Summary Report"
linkTitle: "Application Compliance Summary Report"
weight: 302
description: >
  Application Compliance Summary Report
---

![Compliance Summary](/guides/userguide/images/compliance-small.png)

## Compliance Summary Report

Ortelius gathers _Application Version_ security compliance insights from a variety of sources and displays the information using the Compliance Summary report. Data collection is done via the [CI/CD Integration](/guides/userguide/integrations/ci-cd_integrations/).

### Generating the Compliance Summary Report

Go to the _Application_ list view and select (check mark) an _Application_.  Next select the Reports -> Compliance Summary menu.  The report will be generated in a new browser window.  The report includes all _Application Versions_ in the version tree in order to show historical trends of the metrics.

## Compliance Report Metrics Details

Metrics are aggregated together from the _Component Versions_ and _Environments_ up to the _Application Version_ in order to generate the _Compliance Summary_. . 

The _Compliance Summary_ provides metrics for:

| Compliance Check | Description |
|------------------|-------------|
| Sonar Bugs | Sonar's scoring for the bugs found in the _Component Versions_ |
| Sonar Code Smells | Sonar's scoring for the code maintainability in the _Component Versions_ |
| Sonar Violations | Sonar's scoring for the violations in the _Component Versions_ |
| Sonar Project Status | Sonar's scoring for the overall status in the _Component Versions_ |
| Veracode Score | Veracode's scoring for the overall status in the _Component Versions_ |
| Git Trigger | The workflow that creates the _Component Version_ and artifact has been trigger automatically (green check) vs manually (red dash) |
| Contributing Committers | This the percentage for the number of contributors committing code vs the total number of committers for the Git Repo |
| Total Committers | This is the total number of committers assigned to the Git Repo.  This number must be provided to the Ortelius CLI in the CI/CD pipeline.  It cannot be derived.  Also, it is used to calculate the Contributing Committers percentage. |
| Lines Changed | Is the number of lines changed (added & deleted), based on a git diff, between the previous _Component Version_ and the current one. |
| Swagger | The _Component Version_ has a Swagger or OpenAPI file associated (green check). The Swagger/OpenAPI documents are derived by the Ortelius CLI in the CI/CD pipeline and associated to the _Component Version_. |
| Readme | The _Component Version_ has a Readme file associated (green check). The Readme is derived by the Ortelius CLI in the CI/CD pipeline and associated to the _Component Version_. |
| License | The _Component Version_ has a License file associated (green check). The License is derived by the Ortelius CLI in the CI/CD pipeline and associated to the _Component Version_. |
| Env: columns | These 0 to N columns, each one representing an _Environment_ that the _Application Version_ has been deployed to successfully (green check). A red dash for a failed deployment. Empty for no deployment.  Deployments can be recorded using the Ortelius CLI in the CI/CD pipeline. |

>Note: See [SonarQube Code Quality and Security Solution Integration](/guides/userguide/integrations/sonarqube/) and [Veracode Software Security Integration](/guides/userguide/integrations/veracode/) for the respective setup instructions.


