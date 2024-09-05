---
title: "Understanding Ortelius Objects"
linkTitle: "Understanding Ortelius Objects"
weight: 4
description: >
  Understanding Core Objects and Concepts.
---

## Introduction

Ortelius's core Objects are _Domains_, _Applications_, _Components_, _Environments_ and _Endpoints_. These Objects organize, aggregate, and version independently released artifacts with their DevSecOps metadata such as deployment location, Software Bill of Materials, OpenSSF Scorecard, and CVEs. This data is the basis for analyzing your software system's security posture and tracking vulnerabilities to where they are running in your environment.  

 _Objects_ related to gathering Security Intelligence include:

- _Components_ - An independently deployed artifact such as files, APIs, Microservices, Containers
- _Applications_ - A collection of independently deployed artifacts that serves as a complete software solution.
- _Environments_ - The location where the _Application_ is running.
- _Endpoints_ - The clusters, servers, or Virtual Machines within the Environment where a _Component_ is running.

Following is a description of each Object and their attributes.

### _Domain_ Object

The [_Domain_ Object](/guides/userguide/definedomains/) represents the highest order of organization for managing _Applications_, _Components_ and _Environments_. _Domains_ are hierarchical and can have _Subdomains_. _Subdomains_ inherit the parents properties, _Tasks_ and access.

_Domains_ are core to Ortelius's gathering of decoupled _Component_ metadata.  _Domains_ are hierarchical and pass inheritance from parent to siblings. For this reason, _Components_ can be shared across the _Subdomains_. The hierarchical structure of _Domains_ provides a high-level of control and management over how _Components_ are shared. reported on, and reused.

![Example of Domains, Applications, Components and Environments](/guides/userguide/images/OnlineStore-Domains.jpg)


Your _Components_, are organized based on _Domains_ and _Subdomains_ which you define. _Domains_ categorize _Components_ that solve the same 'problem sets.' In a similar way, _Applications_ are assigned to their own _Domain_. _Environments_ and _Endpoints_ are associated to _Domains_ that are running _Applications_.

The highest level _Domain_ is your _Global Domain_. With the SaaS version, your _Global Domain_ name is defined based on your Company. With the on-premise installation, you will see a _Domain_ called _Global_.


The following properties can be accessed on the _Domain_ object:

| **Property** |  **Description** |
| --- | --- | --- |
| ID |  _Domain_ id, as used in the database. |
| Name | _Domain_ name. |
| fqdomain | Fully qualified _Domain_ name. |
| Summary | Summary text. |
| _Domain_ | Higher level organization to which it belongs. |
| _Subdomains_ | Lower level organization to which it belongs |
| _Applications_ | The _Application_ objects which are contained within it. |
| _Environments_ | The _Environment_ objects which are contained within it. |
| Creator | The _User_ or _Group_ Object representing the user who created it. |
| Modifier | The _User_ or _Group_  Object representing the user who last modified it. |
| ctime | _Date_ Object representing the date/time it was created. |
| mtime | _Date_ Object representing the date/time it was last modified. |
| Owner | _User_ or _Group_ Objects that owns it. |

### _Component_ Object

Ortelius manages artifacts and other reusable objects as [_Components_](/guides/userguide/2-define-components/). _Components_ are consumed by _Applications_. By assigning _Components_ to _Applications_ you track a 'logical' view of your software solution as a whole. In cloud-native architecture, _Components_ are loosely coupled and communicate at run-time. Defining _Components_ to _Applications_ allows Ortelius to aggregate security data to the _Application_ level and produce _Application_ security reports such as SBOMs in a decoupled architecture where hundreds of SBOMs are needed for one _Application_ SBOM.

_Components_ change over time. To expose changes, Ortelius takes a snapshot of the initial _Component Base Version_ and tracks subsequent changes recorded as  _Component Versions_. _Components_ are associated to a Domain for organization and quick searches.

- **_Component Base Version_** : The initial _Component_ Object that represent the artifacts being managed

- **_Component Version_** : A child of the _Component Base Version_ that represents changes.

A _Component_ Object has the following properties:

| **Property** |  **Description** |
| --- | --- | --- |
| ID | A unique identifier for the _Component_ as used in the database. |
| Name | The name of the _Component_. |
| fqdomain | Fully qualified _Domain_ name. |
| Summary |  Description of the _Component_. |
| _Domain_ | Organization in which the _Component_ is contained. |
| Owner | User or UserGroup that owns the _Component_. |
| Parent | The Base _Component_. |
| Predecessor | The version on which this is based. |
| Items | The items that make up this _Component_. |
| _Endpoint_ | The compute node to which this _Component_ has been deployed. |
| Requests | The change requests associated with this _Component_ .|
| Lastbuild | The last build number for this _Component_, 0 if never built. |
| Creator | The User who created this _Component_. |
| Modifier | The User who last modified this _Component_. |
| ctime | The date/time the _Component_ was created. |
| mtime | The date/time the _Component_ was last modified. |
| Key Value Configurations | Key Value Pairs for managing associative arrays. |


### _Application_ Object

[_Applications_](/guides/userguide/2-defining-applications/) are a collection of _Components_ that are released as a single software solution. You define an _Application_ by associating the _Components_ it will consume. When you initially define an _Application_ it is referenced as the _Application Base Version._ When an underlying _Component_ changes, it impacts the _Application_ creating a new  _Application Version_. _Applications_ are organized by a _Domain_.

- **_Application Base Version_** : Defines the software product in terms of _Components_, _Attributes,_ and assigned _Environments_.

- **_Application Version_** : This represents any changes made in to the _Base Versions_.

An _Application_ has the following properties:

| **Property**      | **Description**                                                              |
|-------------------|------------------------------------------------------------------------------|
| ID                | A unique identifier for the _Application_  in the database.                  |
| name              | _Application_ name.                                                          |
| fqdomain          | Fully qualified _Domain_ name.                                               |
| Summary           | Summary of the _Domain_.                                                     |
| Owner             | _User_ or _Group_ that owns it.                                              |
| Parent            | The Base _Application_.                                                      |
| Predecessor       | Predecessor _Application Version_.                                           |
| _Release_         | Defines the _Application_ Object with more than one _Application_.           |
| _Applications_    | Multiple _Applications_ used to create a _Release_.                          |
| _Components_      | The objects that the _Application_ consumes.                                 |
| Approvals         | Allows a control point for progressing a change within the pipeline process. |
| Requests          | The _Change Request_ objects associated with this _Application_.             |
| Creator           | The _User_ or _Group_ who created it.                                        |
| Modifier          | The _User_ or _Group_ who last modified it.                                  |
| ctime             | The date/time it was created.                                                |
| mtime             | The date/time it was last modified.                                          |
| Kev Value Configurations | Key Value Pairs for managing associative arrays.                             |


### _Component_ and _Application_ Relationships

There is a many-to-many relationship between _Applications_ and _Components._ An _Application_ can contain many different _Components_, and a _Component_ can be used across many different _Applications_.  _Components_ can be easily shared between _Applications_. Ortelius tracks and versions the _Component_ relationships including which _Applications_ they impact. This is necessary for tracking vulnerabilities found at the _Component_ level to the _Application_ that consumes it.

### _Component_ and _Application_ Versioning

A backend versioning datastore tracks all software configuration updates. This is done within an _Application_. An _Application_ consists of one or more _Components_. Versioning tracks all changes in both your _Application_ and _Component_ attributes.

When you first define your _Application_, you create an _Application Base Version_. Over time, as you update your code and deliver new features, each change to the _Application_ creates a new _Application Version_.  _Application Versions_ package all your _Components_ in your entire software product. Like _Application Versions_, there is an initial _Component Base Version_ and subsequent _Component Versions,_ which represent any updates . An _Application Base Version_ or _Component Base Version_ is always the first one created, and it acts as a model for subsequent _Application_ or _Component Versions_. Otherwise they are identical types of objects.

When a new _Application Version_ is created from either an _Application Base Version_ or another _Application Version_, it inherits all previous _Components_ from its predecessor. That predecessor is determined when running a _Create Version Task_ for an _Application Version_. You can specify whether the new _Application Version_ inherits its _Components_ from the original _Application Base Version_, the latest _Application Version_, or a specific _Application Version_.

Ortelius uses a simple versioning number schema starting at 1 and incrementing over time, for example Myapp;1, Myapp;2.

You can use your CI/CD process to include variance in your versioning number (base name, variant, version).  See [Component Versioning Schema](/guides/userguide/integrations/ci-cd_integrations/).

### _Environment_ Object

The [_Environment_ Object](/guides/userguide/define-environments/) represents where an _Application_ is published or deployed.

The following properties can be accessed for an _Environment_ object:

| **Property**   | **Description**                             |
|----------------|---------------------------------------------|
| ID             | Unique identifier as used in the database.  |
| Name           | _Environment_ name.                         |
| fqdomain       | Fully qualified _Domain_ name.              |
| Summary        | Description of the _Environment_.           |
| _Domain_         | _Domain_ in which it is contained.          |
| Owner          | _User_ or _Group_ Objects that owns it.     |
| basedir        | Base directory for deployments.             |
| _Endpoints_    | The compute node assigned to it.             |
| _Applications_ | The _Applications_ associated to it.        |
| Creator        | The _User_ or _Group_ who created it.       |
| Modifier       | The _User_ or _Group_ who last modified it. |
| ctime          | The date/time it was created.               |
| mtime          | The date/time it was last modified.         |
| Parent         | Parent _Domain_.                            |


### _Endpoint_ Object

The [_Endpoint_ Object](/guides/userguide/define-endpoints/) is a compute node that (Local Helm Host, container, VM/Cloud Image) represents where an _Application_ is running. _Endpoints_ are assigned to an _Environment_.


### _Endpoint_ Mapping

_Endpoints_ are the containers, virtual machines, or servers where the _Application_ has been deployed. _Endpoints_ allow Ortelius to expose where vulnerabilities are running across your development, testing and production _Environments_.

 _Endpoints_ are mapped to _Components_ and _Environments_.  _Endpoints_ are used to track where a _Component_ is installed for vulnerability exposure.


The _Endpoint_ object has the following properties:

| **Property**             | **Description**                                        |
|--------------------------|--------------------------------------------------------|
| ID                       | A unique identifier as used in the database.           |
| Name                     | The _Endpoint_ name.                                   |
| fqdomain                 | Fully qualified _Domain_ name.                         |
| Summary                  | Description of the _Endpoint_.                         |
| _Domain_                   | _Domain_ in which it is contained.                     |
| Owner                    | _User_ or _Group_ that owns it.                        |
| Hostname                 | Hostname (if set) or name otherwise.                   |
| basedir                  | Base Directory for where the _Application_ is running. |
| _Components_             | The _Components_ currently installed on it.            |
| Creator                  | The _User_ or _Group_ who created it.                  |
| Modifier                 | The _User_ or _Group_ who last modified it.            |
| ctime                    | The date/time it was created.                          |
| mtime                    | The date/time it was last modified.                    |
| Key Value Configurations | Key Value Pairs for managing associative arrays.       |

### _Date_ Object

Dates track the date/time of the creation, deletion, or update of an Object.

The _Date_ has the following properties:

| Property      | Description                                                                                                                                                                                                                                          |
|---------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| to\_int(secs) | Returns an integer representing the date as the number of seconds since midnight on January 1st 1970 (epoch). The secs parameter is optional. If needed, the specified number of seconds is added to the date/time before the new value is returned. |
| to\_char(fmt) | Formats the date into a string given by the passed fmt string. The fmt string should contain characters as specified below.