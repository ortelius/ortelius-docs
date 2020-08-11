---
title: "Building Your Domain Catalog"
linkTitle: "Building your Domain Catalog"
weight: 2
description: >
  How to Create and Manage _Domains_
---

## A Domain Driven Design

A Ortelius _Domain_ is how Ortelius organizes and shares data across teams.  You publish your microservices to a Catalog _Domain_, you package your _Application_ in a Project _Domain_ and you track your continuous delivery pipeline with a Life Cycle _Domain_. All Ortelius objects are assigned to a _Domain_.

### Domains and your Domain Driven Design

A Domain Driven Design is critical for organizations moving from monolithic development to microservice development. In microservices, you must have a structured method for organizing microservices into "solution" spaces to facilitate reuse across siloed teams. Ortelius _Domains_ provides this organization.

_Domains_ catalog and publish microservices and other reusable objects (web components, DB updates, etc.) making it easier to share these microservices and  _Components_ across siloed teams. Domains can be structured to closely resemble the patterns of your organization. They can represent functional areas such as 'security services' or departments, teams, geographical locations and software projects.

### Top Down Structure

Everyone has a single high-level "Global" _Domain_.  All other _Domains_ are _Subdomains_. For SaaS _Users_, your sign-up form asked you for a "Company" and "Project."  These values were used to create your initial _Domains_.  If you are using a locally installed version (on-prem), your highest level _Domain_ will be "Global" and you will need to create your own _Domains_.

A _Subdomain_ inherits all the access properties from its parent _Domain_. This inheritance continues down through all _Subdomains_.

There are four common ways to implement _Domains_:

| **Purpose** | Description |
|---| --- |
| **Site _Domain_** | This is the highest-level and default _Domain_. For SaaS Users, your Site _Domain_ will be defaulted to the Company name from your registration. You can rename your Site _Domain_ if needed. For an On-Premise installation, your default Site _Domain_ name is 'Global.' You can rename your Site _Domain_ if needed. Anything defined to this level can be shared across all lower level _Subdomains_. For example, _Environments_ and _Tasks_ defined to the Site _Domain_ are shared by all child _Subdomains_.|
|**Catalog _Subdomains_**| These _Domains_ are used to organize reusable _Components_, such as microservices. At this level, you create as many _Subdomains_ as needed to represent your _Component_ organization based on the "solution space" they serve. For example, you could build your Catalog as follows: <li> Security Services</li><li>Purchase Processing</li><li>Data Access<li>Ad Services</li>  A Catalog _Domain_ does not contain Life Cycle _Domains_.
|**Division _Subdomains_**| DeployHub Pro Users can take advantage of Division Domains. Larger companies can define a catalog to share _Components_ based on geographical areas, organizational responsibility, or business units. A Division _Subdomain_ can have many child _Subdomains_. For example, a Catalog _Subdomain_ for Security and Purchasing Services could be broken down into further _Subdomains_: <ul><li> Security Services</li><ul><li>Login Services</li><li>Payment Processing Services <li>Merchant Services</li><li>EMEA Shipping Services</li><li>North America Shipping Services</li></ul><br><li>Purchase Processing Services</li><ul><li>EMEA Check-out Services</li><li>North America Check-out Services</li></ul> |
|**Project _Subdomains_**| Use a _Subdomain_ to represent your software _Application_ and its Life Cycle. A _Subdomain_ defined for an _Application_ may need a continuous delivery life cycle. This is defined by selecting "All _Subdomains_ are Life Cycles." This means that any _Subdomains_ cannot include any additional _Subdomains_ and will be used to represent stages of the _Pipeline_ with specific _Environments_ assigned. |
|**Life Cycle _Subdomains_**| This is the lowest level of _Subdomain_.  It is available when the parent _Domain_ has "All _Subdomains_ are Life Cycles" selected.  These _Subdomains_ map to each stage in your continuous delivery pipeline. They often have specific _Environments_ and _Tasks_ assigned for interaction with your continuous delivery orchestration engine. Ortelius can be called by your continuous delivery Engine (Jenkins, Jenkins X, CircleCI, Google CloudBuild, GitLab or GitHub Actions, etc.) to perform the continuous configuration management of your microservices and _Applications_ across all lifecyle states. In addition, you can assign Move, Approve and Request Tasks to your Life Cycle _Subdomain_ to define a continuous delivery pipeline process within Ortelius that can interact with your pipeline process. |

Below is an example of how the Online Store Company _Domains_ have been defined. For SaaS users, you can review this by inspecting the Online Store Company _Domain_.

![Example of Domains, Applications, Components and Environments](/userguide/images/OnlineStore-Domains.jpg)

## Using the Domain Dashboard

A full view of all _Domains_ is based upon your _User_ privileges. The view is displayed in a "Sunburst" map, starting at the highest level _Domain_ with the ability to drive down into the _Subdomains_, and _Subdomains_ after that. Clicking on a segment in the Sunburst map will take you to that _Domain_. Clicking on the center of the Sunburst will take you back up the _Domain_ structure.

When scrolling up or down the _Domain_ hierarchy using the Sunburst map, the detail information is re-displayed according to where you are in the map. Below are the details for a _Domain_.

### _Domain_ Details

| Details | Description |
| --- | --- |
|**Full Domain** | The fully qualified _Domain_ Name including any parent _Domains_.
| **Name** | The Name of the _Domain_. |
| **Summary** | Domain Description. |
| **Owner Type** | User or Group. |
| **Owner** | Name of the Owner.|
| **Created** | Auto-generated date when it was created.|
| **Modified** | Auto-generated date when it was modified.|
| **Engine**| The hostname of the deployment engine. Defaults to "Deployment Engine." This field can be used to specify another Ortelius Deployment Engine for widely distributed deployments. |
|**All _Subdomains_ are Life Cycles**| This specifies that the _Domain_ will include a Pipeline model and all following _Subdomains_ will model the pipeline states.  Life Cycles are specifically for Project _Subdomains_.  Life Cycle _Domains_ cannot have any further _Subdomains_ and are not appropriate for defining a Catalog _Domain_.  |
| **_Subdomains_** | A list of all _Subdomains_ assigned to this _Domain_.

### Access Control

 _Users_ within designated _Groups_ can update the _Domain_ in various ways. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available _Groups_ list onto the desired access list. All _Users_ who belong to a _Group_ in one of the Access lists will be granted access to the _Domain_.  Access control for _Domains_ include:

| Access | Description |
| --- | --- |
| **View** | Allows the _Group_ to see the _Domain_. |
| **Change** | Allows the _Group_ to change the _Domain's_ characteristics i.e. Name, Summary, etc. |
| **Read** | Allows the _Group_ to see the _Domain_.|
| **Write** | Allows the _Group_ to create _Subdomains_. |

{{% include "userguide/reusable/Tasks.md" %}}
