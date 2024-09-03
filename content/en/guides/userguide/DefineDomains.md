---
title: "Building Your Domain Catalog"
linkTitle: "Building your Domain Catalog"
weight: 8
description: >
  How to Create and Manage _Domains_  
---

## A Domain Driven Design

A _Domain_ is how Ortelius organizes and shares data across teams. All Ortelius objects are assigned to a _Domain_.

### Domains and a Domain Driven Design

A Domain Driven Design is critical for organizing and sharing Software Bill of Materials and vulnerability insights across _Components_, _Applications_ and _Endpoints_. _Domains_ represent "solution" spaces to facilitate reuse across siloed teams.

_Domains_ manage objects making them easy to find and share. Domains can be structured to closely resemble the patterns of your organization. They can represent functional areas such as 'security services' or departments, teams, geographical locations and software projects.

### Top Down Structure

Everyone has a single high-level "Global" _Domain_.  All other _Domains_ are _Sub-Domains_. For SaaS _Users_, your sign-up form asked you for a "Company" and "Project."  These values are used to create your initial _Domains_.  If you are using a locally installed version (on-prem), your highest level _Domain_ will be "Global" and you will need to create your own lower level _Domains_.

A _Sub-Domain_ inherits all the access properties from its parent _Domain_. This inheritance continues down through all _Sub-Domains_.

There are four common ways to implement _Domains_:

| **Purpose**       | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|-------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Site _Domain_** | This is the highest-level and default _Domain_. For SaaS Users, your Site _Domain_ will be defaulted to the Company name from your registration. You can rename your Site _Domain_ if needed. For an On-Premise installation, your default Site _Domain_ name is 'Global.' You can rename your Site _Domain_ if needed. Anything defined to this level can be shared across all lower level _Sub-Domains_. For example, _Environments_ and _Tasks_ defined to the Site _Domain_ are shared by all child _Sub-Domains_. |
|**Catalog _Sub-Domains_**| These _Domains_ are used to organize all _Components_. At this level, you create as many _Sub-Domains_ as needed to represent your _Component_ organization based on the "solution space" they serve. For example, you could design _Domains_ as follows: <li> Security Services</li><li>Purchase Processing</li><li>Data Access<li>Ad Services</li>  
|**Project _Sub-Domains_**| Use a _Sub-Domain_ to represent your software _Application_. |

## Using the Domain Dashboard

A full view of all _Domains_ is based upon your _User_ privileges. The view is displayed in a list view, starting at the highest level _Domain_ with the ability to drive down into the _Sub-Domains_, and _Sub-Domains_ after that.

When scrolling up or down the _Domain_ hierarchy the detail information is re-displayed according to where you are in the list. Below are the details for a _Domain_.

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
| **_Sub-Domains_** | A list of all _Sub-Domains_ assigned to this _Domain_.

### Access Control

 _Users_ within the three default _Groups_ can update the _Domain_ in various ways. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available _Groups_ list onto the desired access list. All _Users_ who belong to a _Group_ in one of the Access lists will be granted access to the _Domain_.  Access control for _Domains_ include:

| Access     | Description                                                                          |
|------------|--------------------------------------------------------------------------------------|
| **View**   | Allows the _Group_ to see the _Domain_.                                              |
| **Change** | Allows the _Group_ to change the _Domain's_ characteristics i.e. Name, Summary, etc. |
| **Read**   | Allows the _Group_ to see the _Domain_.                                              |
| **Write**  | Allows the _Group_ to create _Sub-Domains_.                                           |
