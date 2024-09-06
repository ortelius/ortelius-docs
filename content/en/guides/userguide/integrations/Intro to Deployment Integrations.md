---
title: "Deployment Integrations"
linkTitle: "Deployment Integrations"
weight: 304
description: >
  Integrating Ortelius with your Deployment Solution.
---

## Tracking Your Deployments in Ortelius

Ortelius uses the [CI/CD Integration](/guides/userguide/integrations/ci-cd_integrations/) for gathering data recording the build and deploy steps of your DevOps Pipeline. By recording the deployment activity Ortelius can track the location of each _Component Version_ and _Application Version_ running across all of your _Environments_.

The benefit of allowing Ortelius to track your deployments is track the location where a vulnerability has been deployed. Knowing where you are impacted can help with determining the risk of a known vulnerability.  Ortelius serves as a centralized location of deployment intelligence that maps a vulnerability across the entire organization. 

Objects that are needed for tracking your deployments include:

- [_Environments_](/guides/userguide/define-endpoints/)
- [_Endpoints_](/guides/userguide/define-endpoints/)
- [_Components_](/guides/userguide/2-define-components/)
- [_Applications_](/guides/userguide/2-defining-applications/)

## Adding Components and Applications

For information on adding your _Components_ and _Applications_ to Ortelius for deployment tracking via the pipeline, read the chapter [Adding Your Components and Applications to Ortelius](/guides/userguide/addingtopipeline/)

