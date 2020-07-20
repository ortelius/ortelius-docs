---
title: "WebSphere"
linkTitle: "WebSphere"
weight: 78
description: >
  Executing deployments requiring a WebSphere Server.
---

A Ortelius deployment can point to one or more _Repositories_ which contain the artifacts (.ear, .jar, and .war files) that make up a WebSphere application. These are referenced in Ortelius by one or more _Components_ (and one or more of their _Component__Items_) within an _Application_. A _Post Action_ is then executed which deploys these artifacts into WebSphere. The user creates the _Action_, which itself contains _Procedures_. The Procedure defined to the _Action_ for a WebSphere deployment is called "WebSphereDeploy."

## Creating the WebSphere Action

## New Action for the WebSphere

Once you have imported your _Procedures_, you can define your _Action_. Change to the _Actions_ list view and select "Add" menu.  

Name the new Action "WebSphereDeployAction" (no spaces).

Now we are going to customize this Action. You will see the 'Activity Hub' on the righthand side of your screen. Navigate to your Domain to find the Procedures. Drag them onto the area under _Start._

At this point the Action is ready to be used by anyone with access (based on Domain and security options). Each Component that uses the Action will need to define specific values.
The _Action_ can now be placed into the _Post Action field_ of a _Component_ as part of an _Application_ deployed to a WebSphere region.

### _WebSphereDeploy_ Parameters

| **Field** | Value | Description |
| --- | --- | --- |
| **AppName** | ${AppName} | Application name |
| **EarFile**	| ${dep.files} |  Name of the ear file |
| **ServerName** | ${ServerName} |	Server name in the node |
| **ContextRoot** | ${ContextRoot} | Context Root for the application |
| **NodeName** | ${NodeName} | 	Name of the Node |
| **CellName** | ${CellName} | Name of the Cell |
| **ValidateInstall**	| ${ValidateInstall} | Y or N to Validate after deployment |
| **PrecompileJsps** | Checkbox	| Select to Precompile JSPs |
| **MapToVirtualHost** |	Checkbox | Select to map application to virtual host |
| **DistributeApp**	| Checkbox | Select to distribute application to all nodes |
| **UseMetadataFromBinary**	| Checkbox | Select to use metadata from archive |
| **DeployEjb**	| Checkbox | Select to deploy the EJB |	
| **CreateMbeansForResource** |	Checkbox | Select to create the mbeans for the EJB |
| **ReloadEnabled**	| Checkbox | Select to 	reload the application |
| **DeployWs**	| Checkbox | Select to deploy WS |
| **ProcessEmbeddedConfig**	| Checkbox | Select to process the config in archive |
| **AllowDispatchRemoteInclude** |	Checkbox	| Select to enable dispatch of remote include |
| **AllowServiceRemoteInclude**	| Checkbox |	Select to enable service to remove include |
| **UseAutoLink**	| Checkbox | Select to use auto link |
| **Tasks** | ${Tasks} | Admin tasks to perform |

**Set Your _Component_ Attributes_**

The following variables must be added to the Attributes Section for all  _Components_ using the WebSphereDeployAction _Post Action_.  The Attributes section can be found on the _Component_ Dashboard.  Use the +Add option in this section to add a row for the variable. You must use Save to commit the row to the table:

| Variable Name | Value Description |
|--- | --- |
| **AppName** | Application name |
| **ServerName** | Server name in the node |
| **ContextRoot** | Context Root for the application |
| **NodeName** | Name of the Node |
| **CellName** | Name of the Cell |
| **Tasks** | Use "changedDataSource,stopAndRemoveApp,installApp,startApp" |

For more information see:

- [Customizing Actions](/userguide/first-steps/2-define-your-actions/)
- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)
