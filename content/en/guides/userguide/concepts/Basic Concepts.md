---
title: "Ortelius 101"
linkTitle: "Ortelius 101"
weight: 2
description: >
  Understanding Core Objects and Concepts.
---

## Introduction

Ortelius' core Objects are _Domains_, _Applications_, _Components_, _Environments_ and _Endpoints_. These Objects catalog, track, and version independently deployable objects, maps their relationships, and releases them to clusters, cloud, or physical data centers.

_Domains_ are core to Ortelius' management of microservices.  _Domains_ are hierarchical and pass inheritance from parent to siblings. For this reason, _Components_ can be shared across the _Subdomains_. The hierarchical structure of _Domains_ provides a high-level of control and management over how microservices are shared and reused.

![Example of Domains, Applications, Components and Environments](/guides/userguide/images/OnlineStore-Domains.jpg)

 Other _Objects_ include:

- Change Request
- Credentials
- Data Sources
- Date
- DropZone
- DropZone File
- Notifiers
- User
- UserGroup (DeployHub Pro Object)

These Objects can be referenced using Ortelius APIs or custom DMSCripts.

Following is a description of each Object and their attributes.

## _Application_ Object

[_Applications_](/guides/userguide/packaging-applications/) are a collection of _Components_ that can be deployed as a single software solution. You define an _Application_ by associating the _Components_ it will consume. The first version is the _Application Base Version._ When you change this _Application Base Version_, you create a new _Application Version_. _Applications_ are assigned and deployed to _Environments_. _Applications_ are associated to a _Domain_.

- **_Application Base Version_** : Defines the software product in terms of _Components_, _Attributes,_ and assigned _Environments_.

- **_Application Version_** : This represents any changes made in to the _Base Versions_.

An _Application_ has the following properties:

| **Property** | **Description** |
| --- | --- |
| id | A unique identifier for the _Application_  in the database. |
| name | _Application_ name. |
| fqdomain |Fully qualified _Domain_ name. |
| summary | Summary of the _Domain_. |
| owner | _User_ or _Group_ that owns it. |
| parent | The Base _Application_.|
| predecessor |Predecessor _Application Version_. |
| _Release_ | Defines the _Application_ Object with more than one _Application_. |
| _Applications_ | Multiple _Applications_ used to create a _Release_.|
| _Components_ | The objects that the _Application_ consumes. |
| approvals | Allows a control point for progressing a change within the pipeline process. |
| requests | The _Change Request_ objects associated with this _Application_.|
| creator | The _User_ or _Group_ who created it. |
| modifier | The _User_ or _Group_ who last modified it. |
| ctime | The date/time it was created. |
| mtime |  The date/time it was last modified. |
| KV Configurations |  Key Value Pairs for managing associative arrays. |

### _Release_ Object

A [_Release_](/guides/userguide/profeatures/5-application-releases/) is only available in **DeployHub Pro**. A _Release_ is a collection of _Applications_ that must be deployed together, sometimes referred to as a 'Release Train.'

## _Change Request_ Object

The [_Change Request_](/guides/userguide/profeatures/5-change-requests/) Object represents a change request record associated with either a _Component_ or an _Application_. A _Change Request_ is a DeployHub Pro feature.

The _Change Request_ object has the following properties:

| Property | Description|
| --- | --- |
| id | The _Change Request_ id. |
| name | The _Change Request_ description. |
| status  | The _Change Request_ status. |
| api\_url | A URL which, if passed to restful\_get, will return an array containing the full details of the _Change Request_ from the external change tracking system. Useful for getting more information than the id / description / status combination which is stored in Ortelius. |
| html\_url | A URL which will direct a browser to the page describing the change request in the external change tracking system. |

## _Component_ Object

Ortelius manages microservices and other reusable objects as [_Components_](/guides/userguide/publishing-components/). These are assigned to an _Application_ even though they are managed independently. By assigning _Components_ to _Applications_ you track a 'logical' view of your software solution. In a monolithic approach, this happened at the software compile and link step. In microservices though, they are loosely coupled and linked at run-time. Defining _Components_ to _Applications_ puts the _Application_ back in the picture, even if it is only a 'logical' view.

If you are an API or microservice developer, this will be where you do most of your work. However, application developers may also define _Components_ for a specific _Application_. _Components_ are microservices (containers), Database updates, or other deployable objects. By tracking the low level deployment metadata for a _Component_, it can be easily shared and released in a consistent way across team.

_Components_ change over time, and so Ortelius contains _Component Base Versions_ and _Component Versions_ like those of _Application Base Versions_ and _Application Versions._ And like _Applications_, _Components_ are associated to a Domain.

- **_Component Base Version_** : Objects within Ortelius that contain the files and procedures deployed to _Endpoints_.

- **_Component Version_** : A child of the _Component Base Version_ that represents changes.

A _Component_ Object has the following properties:

| **Property** |  **Description** |
| --- | --- | --- |
| id | A unique identifier for the _Component_ as used in the database. |
| name | The name of the _Component_. |
| fqdomain | Fully qualified _Domain_ name. |
| summary |  Description of the _Component_. |
| domain | _Domain_ in which the _Component_ is contained. |
| owner | User or UserGroup that owns the _Component_. |
| parent | The Base _Component_. |
| predecessor | The version on which this is based. |
| items | The items that make up this _Component_. |
| servers | The _Endpoints_ to which this _Component_ has been deployed. |
| requests | The change requests associated with this _Component_ .|
| lastbuild | The last build number for this _Component_, 0 if never built. |
| creator | The User who created this _Component_. |
| modifier | The User who last modified this _Component_. |
| ctime | The date/time the _Component_ was created. |
| mtime | The date/time the _Component_ was last modified. |
| Key Value Configurations | Key Value Pairs for managing associative arrays. |

### _Component_ and _Application_ Relationships

There is a many-to-many relationship between _Applications_ and _Components._ An _Application_ can contain many different _Components_, and a _Component_ can be used across many different _Applications_.  _Components_ can be easily shared between _Applications_. Ortelius tracks and versions the _Component_ relationships including to which _Applications_ they have been assigned.

### _Component_ and _Application_ Versioning

A backend versioning engine tracks all software deployment configurations. This is done within an _Application_. An _Application_ consists of one or more _Components_. Versioning tracks all changes in both your _Application_ and _Component_ attributes. This includes all low level information such as the _Action_ used to perform the installation, environment variables, and database schemas.

When you first define your _Application_, you create an _Application Base Version_. Over time, as you update your code and deliver new features, each change to the _Application_ creates a new _Application Version_.  _Application Versions_ package all your _Components_ in your entire software product. Like _Application Versions_, there is an initial _Component Base Version_ and subsequent _Component Versions,_ which represent any updates . An _Application Base Version_ or _Component Base Version_ is always the first one created, and it acts as a model for subsequent _Application_ or _Component Versions_. Otherwise they are identical types of objects.

When a new _Application Version_ is created from either an _Application Base Version_ or another _Application Version_, it inherits all previous _Components_ from its predecessor. That predecessor is determined when running a _Create Version Task_ for an _Application Version_. You can specify whether the new _Application Version_ inherits its _Components_ from the original _Application Base Version_, the latest _Application Version_, or a specific _Application Version_.

Ortelius uses a simple versioning number schema starting at 1 and incrementing over time, for example Myapp;1, Myapp;2.

You can use your CI/CD process to include variance in your versioning number (base name, variant, version).  See [Component Versioning Schema](/guides/userguide/integrations/ci-cd_integrations/#_component_-versioning-schema).

## _Credential_ Object

The [_Credential_ Object](/guides/userguide/first-steps/2-define-your-credentials/) contains the logon and password needed to access _EndPoints_ and external repositories like Git or Quay.

The _Credential_ Object has the following properties:

| Property | Description |
| --- | --- |
| id | A unique identifier for the _Credential_ as used in the database. |
| name | The name of the  _Credential_. |
| summary |  Description. |
| fqdomain |  Fully qualified _Domain_ name that the _Credential_ is associated with. |
| domain |  _Domain_ in which the _Credential_ is associated. |
| owner |  _User_ or _Group_ that owns the _Credential_. |
| username | Decrypted username. |
| password | Decrypted password. |
| b64auth |  A string representing the decrypted username and password together, with a : separator and then base64 encoded. Used for Basic Authorization for web-based APIs. |
| creator | The _User_ or _Group_ who created this _Credential_. |
| modifier | The _User_ or _Group_ who last modified this _Credential_. |
| ctime | The date/time the _Credential_ was created. |
| mtime | The date/time the _Credential_ was last modified. |
| Type  | _Credential_ use. |

## _Data Source_ Objects

 The [_Data Source_](/guides/userguide/customizations/2-data-sources/) object  communicates with various sources of information such as databases, HTTP servers, FTP servers, etc., and can be used to connect to other DevOps tools as needed.

## _Date_ Object

Dates track the date/time of the creation, deletion, or update of an Object.

The _Date_ has the following properties:

| Property | Description |
| --- | --- |
| to\_int(secs) | Returns an integer representing the date as the number of seconds since midnight on January 1st 1970 (epoch). The secs parameter is optional. If needed, the specified number of seconds is added to the date/time before the new value is returned. |
| to\_char(fmt) |  Formats the date into a string given by the passed fmt string. The fmt string should contain characters as specified below. |

## _Domain_ Object

The [_Domain_ Object](/guides/userguide/customizations/2-define-your-functions-and-procedures/) represents the highest order of organization for managing _Applications_, _Components_ and _Environments_. _Domains_ are hierarchical and can have _Subdomains_. _Subdomains_ inherit the parents properties, _Tasks_ and access.

Your microservices, a type of _Component_, are cataloged based on _Domains_ and _Subdomains_ which you define. _Domains_ catalog microservices that solve the same 'problem sets.' In a similar way, _Applications_ are assigned to their own _Domain_. _Environments_ and _Endpoints_ are associated to _Domains_ that are managing _Applications_.

The highest level _Domain_ is your _Global Domain_. With the SaaS version, your _Global Domain_ name is defined based on your Company. With the on-premise installation, you will see a _Domain_ called _Global_.

_Domains_ also include _Tasks_. _Tasks_ include Move, Approve, Version and Deploy. _Tasks_ can be called by external solutions via APIs for integration into your Continuous Delivery Pipeline. _Tasks_ are associated to any _Domain_ and can be defined as _Pre_ or _Post_.  _Tasks_ are normally defined to _Life Cycle Subdomains_ and support continuous configuration management in your continuous delivery process.

_Life Cycle Subdomains_ allow you to automate the push of your continuous deployments from development through production. Ortelius can be called by your Continuous Delivery engine (Jenkins, Bamboo, GitLab, CircleCI, Puppet Relay, Google CloudBuild or GitHub Actions) to perform the continuous deployment task across all states of your pipeline. If you are not using a Continuous Delivery orchestration engine, you can assign _Tasks_ to your _Life Cycle Subdomain_ to define a continuous deployment 'promotion' process within Ortelius.

The following properties can be accessed on the _Domain_ object:

| **Property** |  **Description** |
| --- | --- | --- |
| id |  _Domain_ id, as used in the database. |
| name | _Domain_ name. |
| fqdomain | Fully qualified _Domain_ name. |
| summary | Summary text. |
| domain | Higher level _Domain_ to which it belongs. |
| subdomains | List of _Domain_ objects which are contained within it. |
| Life Cycle | A _Domain_ that includes a pipeline and the lowest level _Subdomains_. _Life Cycle-domains_ cannot have _Subdomains_. |
| _Applications_ | The _Application_ objects which are contained within it. |
| _Environments_ | The _Environment_ objects which are contained within it. |
| creator | The _User_ or _Group_ Object representing the user who created it. |
| modifier | The _User_ or _Group_  Object representing the user who last modified it. |
| ctime | _Date_ Object representing the date/time it was created. |
| mtime | _Date_ Object representing the date/time it was last modified. |
| owner | _User_ or _Group_ Objects that owns it. |

## _Dropzone_ Object

The _DropZone_ Object represents a local area where deployment artifacts are  manipulated before sent to the target _Endpoints_. A _DropZone_ Object is also present on the stack during Pre and Post _Action_ processing for a _Component_. For example, the content of the _DropZone_ are the files checked out from the repository for the associated _Component_.

A _DropZone_ Object has the following properties:

| Property | Description |
| --- | --- |
| name | _DropZone_ name. |
| path | The full path of where the _DropZone_ is located. Useful for passing to external scripts that may need to manipulate files in the _DropZone_. |
| files | An Array of _DropZone Objects_, each one of which represents a file in the _DropZone_. The array is keyed by the full path name of the file. |

### _DropZone_ File Object

The _DropZone File_ Object represents a file in the _DropZone_.

The _DropZone File_ Object has the following properties:

| Property | Description |
| --- | --- |
| dzpath | The relative path of the file in the _DropZone_. |
| repopath | The relative path of the file as located in the repository (this path is relative to the base directory of the repository). |
| size | The size of the file in bytes. |
| ctime | The creation time of the file. |
| mtime | The modified time of the file. |

## _Environment_ Object

The [_Environment_ Object](/guides/userguide/first-steps/2-define-environments/) represents a collection of _Endpoints_ where an _Application_ is deployed. Multiple _Environments_ can represent your pipeline stages such as Development, Testing, and Production for a single _Application_.  Your _Application_ can have as many _Envrionments_ as needed.

The following properties can be accessed for an _Environment_ object:

| **Property** | **Description** |
| --- | --- |
| id |  Unique identifier as used in the database. |
| name | _Environment_ name. |
| fqdomain | Fully qualified _Domain_ name. |
| summary |  Description of the _Environment_. |
| domain |  _Domain_ in which it is contained. |
| owner  | _User_ or _Group_ Objects that owns it.|
| basedir |  Base directory for deployments. |
| _Endpoints_ |  The _Endpoints_ assigned to it. |
| _Applications_ | The _Applications_ associated to it. |
| creator |  The _User_ or _Group_ who created it. |
| modifier | The _User_ or _Group_ who last modified it. |
| ctime | The date/time it was created. |
| mtime |  The date/time it was last modified. |
| parent | Parent _Domain_. |

## _Endpoint_ Object

The [_Endpoint_ Object](/guides/userguide/first-steps/2-define-endpoints/) (Local Helm Host, container, VM/Cloud Image) represents where a deployment will be sent. _Endpoints_ are assigned to an _Environment_.

### _Endpoint_ Mapping

Each _Component_ is assigned a Type attribute. You can specify which kind of _Endpoint_ is needed. For example, a Database _Component_ is installed onto an _Endpoint_ with a corresponding Database _Type_ definition. A _Component_ is assigned a single Type, while an _Endpoint_ can be assigned multiple Types. For example, if your single _Endpoint_ needed to have both a database and your application binaries installed, it would be assigned both a 'Database' and a 'Binary' _Type_ attribute.

To map a _Component_ to _Endpoints_, assign one or more _Component_ Types to each _Endpoint_. Then assign a single Type attribute to that _Component_. When an _Application_ is deployed, each _Component_ within the _Application_ will be deployed to each _Endpoint_ if the _Component's Type_ attribute matches one of the _Endpoint's_ Type attributes. Ortelius ships with standard _Component_ and _Endpoint_ Types and allows you to define custom Type attributes.

The _Endpoint_ object has the following properties:

| **Property** | **Description** |
| --- | --- |
| id | A unique identifier as used in the database. |
| name | The _Endpoint_ name. |
| fqdomain | Fully qualified _Domain_ name. |
| summary | Description of the _Endpoint_. |
| domain | _Domain_ in which it is contained. |
| owner | _User_ or _Group_ that owns it. |
| hostname | Hostname (if set) or name otherwise. |
| basedir | Base Directory for Deployments. |
| type | _Endpoint_ Type, ie: cluster, windows, cloud, etc. |
| credential | The logon and password used to access this _Endpoint_.|
| _Components_ | The _Components_ currently installed on it. |
| creator |  The _User_ or _Group_ who created it. |
| modifier | The _User_ or _Group_ who last modified it. |
| ctime | The date/time it was created. |
| mtime | The date/time it was last modified. |
| Key Value Configurations | Key Value Pairs for managing associative arrays. |

## _Notifier_ Objects

A [_Notifier_](/guides/userguide/customizations/2-define-notifiers/) is sent after a successful or failed deployment attempt. If these features are activated, they are also sent when deployed files have been changed, a Request Task has been used, or when an _Endpoint_ is down,  Ortelius can use SMTP (Simple Mail Transfer Protocol), Slack and HipChat for this purpose.

## _User_ Object

The _User_ Object represents a User in Ortelius. It has the following properties:

| **Property** | **Return Type** | **Description** |
| --- | --- | --- |
| id | Integer | User id, as used in the database. |
| name | String | User Name. |
| kind | String | Returns "user". Used to differentiate between users and groups when retrieving an owner object. |
| fqdomain | String | Fully qualified _Domain_ name. |
| realname | String | The _User's_ full name. |
| email | String | The _User's_ email address. |
| phone | String | The _User's_ telephone number. |
| groups | Array | Array of _Group_ Objects to which this User belongs. |
| lastlogin | Date | The date/time last logged into Ortelius. |
| creator | User | _User_ or _Group_ Object representing who created this _User_. |
| modifier | User | _User_ or _Group_ Object representing who last modified this _User_. |
| ctime | Date | _Date_ Object representing the date/time the User was created. |
| mtime | Date | _Date_ Object representing the date/time the User was last modified. |
| owner | Object | _User_ or _Group_ that owns the _User_ |

## _Group_ Object

The _Group_ Object represents a collection of _Users_ with the same _Domain_ and security access. (This is a DeployHub Pro Feature.)

The _Group_ Object has the following properties:

| Property | Description |
| --- | --- |
| id |  A unique identifier as used in the database. |
| name  | _Group_ Name. |
| kind  | Identifies whether this is a _User_ or a _Group_. |
| fqdomain | Fully qualified _Domain_ name. |
| email  | The _Group's_ email address. |
| creator | _User_ or _Group_ Object representing who created this Group. |
| modifier | _User_ or _Group_ Object representing who last modified this _Group_. |
| ctime |  _Date_ Object representing the date/time it was created. |
| mtime |  _Date_ Object representing the date/time it was last modified. |
| owner | _User_ or _Group_ that owns the object. |
