---
title: "Setting up Ortelius"
linkTitle: "Setting up Ortelius"
weight: 1
description: >
  What you need to get started.
---
Start by defining the following:

| Step | Description |
| --- | --- |
**Create a _Domain_** | Define your catalog by creating a [_Domain_](/guides/userguide/first-steps/2-defining-domains/) hierarchy for sharing. For SaaS user, your Company _Domain_ and your Project _Domain_ are automatically created. With an on-premise version, you will see only a Global _Domain_. You will need to create your _Domains_ to get started.
|**Add your _Credentials_** | [_Credentials_](/guides/userguide/first-steps/2-define-your-credentials/) are user name and password pairs needed for accessing external resources like _Repositories_ and _Endpoints_.  It is best to set them up first so they are available when needed.
|**Add your _Repositories_** | Add your [_Repository_](/guides/userguide/first-steps/2-define-repositories/) before you begin defining your _Components_ as you will need to specify a _Repository_ for your finding your _Component_. Ortelius needs to know where to pull files and containers. |
|**Define your _Environment_ and _Endpoints_** | Next, identify your deployment landscape before you execute a deployment. You will deploy to an [_Environment_](/guides/userguide/first-steps/2-define-environments/) which is a collection of [_Endpoints_](/guides/userguide/first-steps/2-define-endpoints/).
|**Publish your _Components_**| Publish your collection of [_Components_](/guides/userguide/publishing-components/) before you create your _Application_.|
|**Package Your _Application_** | Create an [_Application_](/guides/userguide/packaging-applications/) Base line to track, version and map your _Components_ overtime.

Once this basic setup is complete, integrate Ortelius into your [CI/CD](/guides/userguide/integrations/ci-cd_integrations/) process to automatically track, version and deploy your _Application_ and _Components_.

If you want to customize how Ortelius manages deployments - you will do this using [_Actions_](/guides/userguide/customizations/2-define-your-actions/), [_Functions_ & _Procedures_](/guides/userguide/customizations/2-define-your-functions-and-procedures/).
