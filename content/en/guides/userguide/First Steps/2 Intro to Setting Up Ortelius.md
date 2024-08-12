---
title: "Setting Up Ortelius Via the CLI or Dashboard"
linkTitle: "Setting Up Ortelius Via the CLI or Dashboard"
weight: 7
description: >
  Setting Up Ortelius Via the CLI or Dashboard
---
## Set Up Ortelius via the Dashboard

| Step | Description |
| --- | --- |
**Create a _Domain_** | Define your catalog by creating a [_Domain_](/guides/userguide/first-steps/2-defining-domains/) hierarchy for sharing. For SaaS user, your Company _Domain_ and your Project _Domain_ are automatically created. With an on-premise version, you will see only a Global _Domain_. You will need to create your _Domains_ to get started.
|**Define your _Environment_ and _Endpoints_** | Next, identify your deployment landscape before you execute a deployment. You will deploy to an [_Environment_](/guides/userguide/first-steps/2-define-environments/) which is a collection of [_Endpoints_](/guides/userguide/first-steps/2-define-endpoints/).
|**Publish your _Components_**| Publish your collection of [_Components_](/guides/userguide/first-steps/publishing-components/) before you create your _Application_.|
|**Package Your _Application_** | Create an [_Application_](/guides/userguide/first-steps/packaging-applications/) Base line to track, version and map your _Components_ overtime.

Once this basic setup is complete, integrate Ortelius into your [CI/CD](/guides/userguide/integrations/ci-cd_integrations/) process to automatically track versions and new vulnerabilities to your _Applications_ and _Components_.

## Setup Ortelius via Pipeline Automation and the CLI

The fastest way to setup Ortelius is to use the Ortelius Command Line Interface to automate Ortelius via your CI/CD Pipeline.

{{% include "/userguide/reusable/Ortelius Pipeline Automation.md/" %}}


