---
title: "Intro to Applications"
linkTitle: "Intro Applications"
weight: 4
description: >
  An overview of applications and their versions, tasks, components and deployments.
---

## Application Base Versions and Versions

 _Applications_ are main [Objects](/guides/userguide/concepts/basic-concepts/#application-object) in Ortelius. They are a collection of _Components_ that can be deployed as a single software solution. You define an _Application_ by associating the _Components_ it will consume. The first time you define an _Application_, it is referred to as the _Application Base Version._ When you change the _Application Base Version_, you create a new _Application Version_. _Applications_ are assigned and deployed to _Environments_. _Applications_ are associated to a _Domain_.

- **Application Base Version** : Defines the software product in terms of _Components_, _Attributes,_ and assigned _Environments_.

- **Application Version** : This child of the _Application Base Version_ represents changes and can be deployed just as an _Application Base Version_ is.

An _Application_ and all objects within it will be deployed to one or more _Endpoints_. (Each one represents a container, physical or virtual server in the enterprise in an _Environment_. A backend versioning engine tracks all _Application Version_ configurations. For this reason, each new version will be given a new version number.

For instance, your Application Base Version may be called MyApp;1, subsequent versions would be automatically named MyApp;2, MyApp;3, etc.

## Applications and their Components

_Applications_ are defined by the _Components_ they consume. As with _Applications_, _Components_ have versions. If a new _Component_ is made available, Ortelius can be called by a continuous delivery tool to automatically create a new _Application Version_ each time a new build is detected.  For more information on this topic, see the [CD Engine Chapter](/guides/userguide/integrations/ci-cd_integrations/).

When a new _Application Version_ is created from either an _Application Base Version_ or another _Application Version_, it inherits all previous _Components_ and Attributes from its predecessor. You can create a new _Application Version_ from any previous version.

## Applications and Tasks

_Tasks_ allow you to act upon _Applications_. They are defined at the _Domain_ level and are available to all of the _Applications_ within the Domain as default _Tasks_.  _Tasks_ can also be called via your continuous delivery pipeline.  Common _Tasks_ integrated into continuous delivery are _Move Version_, _Approve_ and _Deploy_. All _Tasks_ are managed at the _Domain_ level. For more information on Tasks and _Domains_ see [Deployment Task](/guides/userguide/first-steps/2-defining-domains/#deployment-tasks).

## Applications and Iterative Deployments

 Whenever an _Application_ is deployed, Ortelius determines the deployment status of each _Component_ contained within the _Application_.  It compares it to _Components_ on the associated _Endpoint_.  This delta processing performs iterative deployments accurately when there is a change or is set to _Always Deploy_.
