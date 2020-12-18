---
title: "Using Ortelius with CI/CD"
linkTitle: "Using Ortelius with CI/CD"
weight: 49
description: >
  Integrating Ortelius into your CI/CD process.
---


## Ortelius' Continuous Delivery And Integration

The Ortelius continuous delivery and integration performs both continuous configuration management and continuous deployments across clusters, clouds and physical data centers. The program gathers configuration data related to a build, creates new _Component Versions_ and _Application Versions_, and deploys independent _Components_ into specified _Environments_. "Build" data is saved as configuration information and then associated to the _Component_ and _Application_.

Ortelius' uses a standard CLI Container to integrate continuous delivery solutions and execute workflows in containers. If the solution has a more traditional model, a plug-in may be required. The below list contains the CD tools Ortelius has successfully integrated with and their corresponding documentation on how each should be implemented:

| CI Tool | Ortelius Plugin | Reference Document |
|---|---|---|
| **Jenkins** | Ortelius Groovy Library | [Jenkins CI Plug-in](https://github.com/jenkinsci/Ortelius-plugin) |
| **CircleCI** | Ortelius CircleCI Orb | [Ortelius Orb](https://circleci.com/orbs/registry/orb/Ortelius/Ortelius-orb)|
| **Google CloudBuild** | Ortelius CLI Container | [Ortelius CLI Docker Container](https://github.com/ortelius/compupdate) |
| **GitLab** | Ortelius CLI Container | [Ortelius CLI Docker Container](https://github.com/ortelius/compupdate) |
| **TeamCity** | Ortelius CLI Container | [Ortelius CLI Docker Container](https://github.com/ortelius/compupdate) |

### Tracking Build Updates

Ortelius' first hook into the continuous delivery process occurs after a complete build and when the container pushes to a container registry. Ortelius can support any container registry. For more details, reference the above table for for each supported solution.

### Saved Build Data

Build data is saved to the _Component Version_ and displayed on the _Component Version_ Dashboard. In some cases, Ortelius may need to save custom data. This can be done using the _Component_ Attributes and saved as a key/value pair. Custom data displays in the Attributes Section as Attributes to the _Component Version_ .

The _Component_ Type determines what data is saved.  See [Defining Components](/guides/userguide/publishing-components/2-define-components/) for a complete listing of the Detail data saved for each different _Component_ Type.

### Continuous Configuration Management and Versioning

The continuous configuration management and versioning process creates new _Application Versions_ based on build update detection. When an update is detected, Ortelius identifies a new _Component Version_ in the continuous delivery workflow and triggers a dependency relationship map update for all consuming _Applications_ which creates new _Application Versions_.

This continuous configuration step is particularly important in a microservice implementation.  Every time a new microservice is pushed across the pipeline, it impacts the configuration of the "logical" _Application_ that consumes it.  A new microservice _Component_ creates a new _Application Version_.  This is how Ortelius presents the _Application Version_ Dashboard data showing the relationship and difference maps for each cluster to which the microservice _Component_ is deployed.

### _Component_ Versioning Schema

Ortelius versions _Components_ differently than it does new _Application Versions_.  _Components_ are tied to Git commits, _Applications_ are not.

The following are the parts of the versioning schema:

| Schema | Description|
|---|---|
|**Base name** | is the static part of the _Component_ Name.  For example: email-service.|
| **Variant** | is a high level place holder for the versions are created within. The Variant can be aligned with a feature or branch. For example: ssl-update.  Variant is not required.|
|**Version**| is the schematic version number or schematic + Git commit.  For example: v1.5.1.0 or v1.5.1-g3d55a2 |

By default, Ortelius uses an advanced format for the versioning schema. It will automatically increment the version number based on last version found. The advanced format is used since Ortelius has the information from Git to provide a complete version schema.  The advanced formatting is:

~~~bash
 <base name>;<variant>;v<version>-g<git commit>
~~~

The version segment is broken down further into:

~~~bash
  v<schematic number>-<number of commits>
~~~

The number of commits provides an auto-increment of the last part of the schema number.

An example of the full name is:

~~~bash
 email-service;ssl-update;v1_5_1_145-g3d55a2
~~~

Below is a breakdown of the individual parts of the versioning schema:

| Part | Explanation |
| ---  | --- |
| **email-service** | Base Name that you supply to the Ortelius Plugin for the _Component_. |
| **semi colon** | Separator. |
| **ssl-update** | Variant that you supply to the Ortelius Plugin for the _Component_. |
| **semi colon** | Separator. |
| **v** | Indicates start of the version. |
| **1_5_1**| Version that you supply to the Ortelius Plugin for the _Component_. |
| **145** | Number of Git Commits for the associated repository.  Used for auto incrementing. |
| **-g** | Separator indicating that the Git commit is next. |
| **3d55a2** | Git command SHA for the commit that triggered the CD process. |

Note: The Variant is optional.  That part of the _Component_ name will be left out if the Variant passed to Ortelius by the CD workflow is blank.

### _Application_ Versioning Schema

The Ortelius continuous delivery integration will automatically maintain the _Application Version_ if the _Application_ Name and a starting version identifer are provided. When provided, a new _Application Version_ will be created using the previous version identifier as a starting point. An _Application Base_ version must exist in for Ortelius to automatically create a new _Application Version_ when a new _Component Version_ is created. The base version gives Ortelius the starting point to perform automatic _Application_ versioning.

 Ortelius uses a similar naming convention for _Application Versions_ as it does for _Component Versions_:

| Part | Explanation |
| ---  | --- |
|**Base name**| The static part of the _Application_ Name.  For example: webstore.|
|**Variant** | A high level place holder for that versions are created within. The Variant can be aligned with a feature or branch. For example: 50percent-sale.  Variant is not required.|
|**Version**| The schematic version number. For example, 1_2_10.|

Ortelius uses the base name; schematic version number ; version number as the default format for the versioning schema.   The formatting is:

~~~bash
<base name>;<variant>;<schematic version number>;<version number> if a Variant is used.
~~~

Deploy will automatically increment the version number based on last version found. It will create a new _Application Version_ based on the last _Application Version_ and replace the old _Component Version_ with the new _Component Version_.  The new _Component Version_ will be added if an old verion was not found.

You can use your CI/CD process to include variance in your versioning number (base name, variant, version).  See [Component Versioning Schema](/guides/userguide/integrations/ci-cd_integrations/#_component_-versioning-schema).

### Deploying the _Application Version_

Once the versioning is completed, Ortelius is called to perform the deployment. The _Application Version_ and _Environment_ are required for the deployment. The deployment number will be returned to both Ortelius and the continuous delivery solution to be displayed in the output.

## Life Cycle Tasks and Continuous Delivery Workflows

You can incorporate Ortelius' Life Cycle _Subdomain_ Tasks as follows:

### Move

Ortelius will move the _Application_ from one Life Cycle _Subdomain_ to another using the Ortelius _Move Task_.  This enables the _Application_ to move through the same pipeline steps that the CD process is using.

### Approve

If you are using DeployHub Pro, you can incorporate Approvals into your process. Ortelius will perform an Approval of an _Application_ Move.  This _Approve_ feature is used to reflect an approval that was done in the CD Pipeline for an _Application's_ audit trail.

For documentation on incorporating Tasks, refer to your specific CD tool documentation as listed above.
