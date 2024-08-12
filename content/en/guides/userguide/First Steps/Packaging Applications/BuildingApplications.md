---
title: "Intro to Applications"
linkTitle: "Intro Applications"
weight: 4
description: >
  An overview of applications and their versions, Metadata, and components.
---

## Application Base Versions and Versions

 _Applications_ are a collection of _Components_ that represent a single software solution delivered to end users. You define an _Application_ by associating the _Components_ it will consume. The first time you define an _Application_, it is referred to as the _Application Base Version._ When you change the _Application Base Version_, you create a new _Application Version_.

- **Application Base Version** : Defines the software product in terms of _Components_, _Attributes,_ and assigned _Environments_.

- **Application Version** : This child of the _Application Base Version_ represents the differences.

For instance, your Application Base Version may be called MyApp;1, subsequent versions would be automatically named MyApp;2, MyApp;3, etc. When a new _Application Version_ is created from either an _Application Base Version_ or another _Application Version_, it inherits all previous _Components_ and Attributes from its predecessor. You can create a new _Application Version_ from any previous version.

## Applications and their Components

_Applications_ are defined by the _Components_ they consume. As with _Applications_, _Components_ have versions. If a new _Component_ is made available, Ortelius can be called by a continuous delivery tool to automatically create a new _Application Version_ each time a new build is detected.  For more information on this topic, see [CI/CD Integrations](/guides/userguide/integrations/ci-cd_integrations/).

