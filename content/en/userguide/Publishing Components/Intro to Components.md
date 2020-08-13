---
title: "Intro to  Components"
linkTitle: "Intro to Components"
weight: 1
description: >

---
## Intro to _Components_

Ortelius manages microservices and other reusable objects as _Components_.  _Components_ are assigned to an _Application_ even though they are managed independently.  Assign _Components_ to _Applications_ to track a 'logical' view of your software solution. In a monolithic approach, we performed this step during the software compile and link, or 'build' process. In microservices, they are loosely coupled and linked at run-time. Defining _Components_ to [_Applications_](/userguide/packaging-applications/buildingapplications/) puts the _Application_ in a 'logical' view.

If you are an API or microservice developer, this will be where you do most of your work. However, application developers may also define _Components_ that are used only by their specific _Application_. _Components_ are microservices (containers), Database updates or files, along with Pre and Post [_Actions_](/userguide/customizations/2-define-your-actions/#intro-to-actions) that are used to control the deployment of the _Component_. By tracking the low level deployment metadata for a _Component_, it can be easily shared and released in a consistent way across organizational teams and _Environments_.

_Components_ change over time, and so Ortelius contains _Component Base Versions_ and _Component Versions_.

- **Component Base Version** : The initial definition of a _Component_.

- **Component Version** : A child of the _Component Base Version_ that represents changes.

## Components and Domains

_Components_ are organized by _Domains_. When you create a new _Component_ you publish it to the _Domain_ that defines the "Solution Space" the _Component_ addresses.  By organizing _Components_ into _Domains_, you create a catalog that allows other teams within your organization to find and reuse your _Components_. The organization of _Components_ by _Domains_ support the Domain Driven Design of a microservices architecture. Before you begin publishing _Components_, you will need to have a _Domain_ ready.  For more on _Domains_ see the [Building Your Domain Catalog](/userguide/first-steps/2-defining-domains/).

## _Components_ and _Applications_

_Components_ are consumed by _Applications_. You track a 'logical' view of your complete software solution by seeing which _Components_ the _Application_ uses.  Defining _Components_ to _Applications_ is a "packaging" process done at the _Application_ level.

There is a many-to-many relationship between _Applications_ and _Components._ An _Application_ can contain many different _Components_. A _Component_ can be used across many different _Applications_. _Components_ can be easily shared between _Applications_. Ortelius tracks and versions these _Component_ relationships including to which _Applications_ they have been assigned.

## Sharing _Components_

If you want your microservice _Component_ to be shared across your teams, publish your _Component_ to a _Domain_ that allows sharing. If it is defined to only your _Application,_ then only your team will be able to see it.

## _Component_ Versioning

Ortelius uses a backend versioning engine to track your _Components_. Versioning tracks _Component_ attributes including low level information that is needed for other teams to reuse your _Component_ including:

- GiHub, Bugzilla, Jire Change Request (DeployHub Pro Feature)
- Gitrepo
- Git commit (Branch and Tag)
- CD Build / Workflow Number
- Container SHA
- Docker Registry
- Enviornment Vairaibles
- Deployment script (Hlem Chart, Ansible Playbook, etc.)
- Any Attributes (DB Name for example) such as the _Action_ used to perform the deployment, environment variables, and database schemas.

This information is collected when you define your _Component_ to the Ortelius catalog. You can use the Ortelius APIs to automatically update this information via your CD Pipeline once you have defined your _Component Base Version_. When your CD engine initiates a workflow for the _Component_, it indicates that a new version of the _Component_ is being pushed across the Pipeline causing all consuming _Applications_ to be automatically incremented to a new version number.  If a _Component_ changes, the consuming _Application_ also changes.  Both get a new version number. For more information see [CD Engines](/userguide/pipeline/2-define-your-build-engines/).

When you first define your _Component_ Ortelius tracks it as the _Component Base Version_. Subsequent updates to that _Component_ creates a new _Component Version_ which represent the updates over time. A _Component Base Version_ is always the first one created, and it acts as a model for subsequent _Component Versions_. Otherwise they are identical types of objects.

Ortelius uses a simple versioning number schema starting at 1 and incrementing over time, for example: ` Myapp;1, Myapp;2. ` .

You can use your CI/CD process to include variance in your versioning number (base name, variant, version).  See [Component Versioning Schema](/userguide/integrations/ci-cd_integrations/#_component_-versioning-schema).
