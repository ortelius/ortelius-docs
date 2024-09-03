---
title: "Helm for Container Deployments"
linkTitle: "Helm for Container Deployments"
weight: 306
description: >
  Gathering Helm Details.
---

Ortelius stores the Helm chart repository and version for informational purposes. 

Ortelius integrates with Helm using the [CI/CD Command Line Interface](guides/userguide/integrations/ci-cd_integrations/) (CLI). For every _Component Version_, the CLI gathers and stores the 

| Access                      | Description                                                                                                                                                         |
|-----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Chart                   | Helm Chart for the Component |
|ChartNamespace          | Name space for the Component to be deployed to |
|ChartRepo               | Helm Chart Repo Name |
|ChartRepoUrl            | Helm Chart Repo Url |
|ChartVersion            | Helm Chart version |

These values are displayed for every _Component Version_ and viewable from the _Component Detail_ dashboard. 