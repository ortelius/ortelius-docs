---
title: "Customize Your Actions"
linkTitle: "Customize Your Actions"
weight: 30
description: >
  Understanding and Adding Actions for defining your deployment logic.
---

## Intro to Actions

An _Action_ is a selection of _Functions_ and _Procedures_ which are executed in sequence in order to provide the unique logic required for the deployment of each _Component_. You can create _Actions_ or use the Built-in _Actions_.  _Actions_ are created with a graphical editor by simply dragging and dropping the _Procedures_ and _Functions_ that make up your _Action_.

In addition, a _Custom Action_ can replace the usual Ortelius deployment engine processing by calling an external deployment engine or scripts that perform the deployment steps (Helm for example).

### Procedures and Functions

_Actions_ are used to customize Ortelius around deployments, and _Tasks_.  For most users, no configuration of _Actions_ is required.  However, if you want to use your own deployment scripts, then you will need to use a _Custom Action_.  This section will get you started on creating your own _Actions._

Ortelius comes with a set of reusable Built-in _Actions_. An _Action_ includes a set of _Functions_ and/or _Procedures_ which are executed in sequence to provide the logic of a _Component's_ deployment. _Actions_ can also be used as Pre or Post deployment steps to an _Application_ or _Release_.

_Actions_ depend on _Procedures_ and _Functions_ to do the work.  If you want to create a new _Custom Action_, you will need to define the _Procedures_ and _Functions_ that the _Action_ will use before you create the _Action_. Alternatively, you can use the Built-in _Actions_,  _Procedures_, and _Functions_, that ship with Ortelius for defining the Steps of your new _Action_.  For most user, the Built-in _Actions_ will be sufficient for working with standard environments like Docker Containers.

In addition, a _Custom Action_ can replace the usual Deployment Engine processing by calling an external script that performs its own deployment activities. _Custom Actions_ call _Functions_ and _Procedures_ that  execute external process such as Helm or Ansible. _Functions_ and _Procedures_ can be:

_Actions_ can be implemented in many ways including:

- Written in DMScript - Ortelius' internal deployment scripting language. DMScript has access to the Ortelius Object Model.  DMScript ships with several pre-installed _Procedures_ and _Functions_. It is also easy to create your own and add them to the activities that can be used when creating your _Components_ installation logic. For more information see [Dmscript](/userguide/dmscript/).

- A 'local' script  - written in any scripting language that is supported by Linux, and executes in the Ortelius Container mounted from the Docker Host.

- A 'remote' script - written in any scripting language supported by the target _Endpoint's_ operating system and accessible to Ortelius.  If allowed, the script is automatically copied to the target _Endpoint_ and executed there. (Note: Copy remote must be set to TRUE at the _Function_ or _Procedure_ Level).

_Actions_ can be invoked:

- Before any _Task_ in a _Domain_ is executed: When the _Task_ is created, a "Pre-Action" can be specified. This can be either a _Procedure_ or a _Function_. The specified _Procedure_ or _Function_ is invoked before the _Task_ is executed. If the _Procedure_ or _Function_ aborts or returns a non-zero return code, the _Task_ itself is prevented from running.

- After any _Task_ in a _Domain_ is executed: When the _Task_ is created, a "Post-Action" can be specified. The specified _Action_ is invoked after the _Task_ is executed. This can be used to connect to external systems to notify others that a _Task_ has been executed (for example, to notify a bug-tracking system that an _Application Version_ has been moved to a Testing state).

- As a stand-alone _Action_ that can be invoked from the Ortelius User Interface: The _Action_ is associated with a "Run Action" _Task_. When invoked, the _Action_ is executed. A user can right-click on the _Domain_ to view the _Task_ to execute the _Action_. Alternatively, they can right-click on an _Application_ or a _Component_. In these circumstances, the selected object is pushed onto the _Stack_ and is available via the $application or $component objects. See DMScript [Stack](/userguide/dmscript/dmscript-stack/) for more information.

- Before an _Application_ is deployed: An _Application_ can be defined as having a "Pre-Action." This can be either an _Action_ or a _Function_. When the _Application_ is deployed, this "Pre-Action" is invoked first before any other operation. If this Pre-Action aborts or returns a non-zero return code, the deployment itself will be prevented.

- After an _Application_ is deployed: An _Application_ can be defined as having a "Post-Action." When the _Application_ has completed a deployment, this "Post-Action" is invoked. This can be used to connect to external systems to notify others that an _Application_ has been deployed.

- As a _Custom Action_ for the _Application_: An _Application_ can be defined as having a "Custom Action." This "Custom Action" is then executed to deploy the _Application_. It is the responsibility of this _Custom Action_ to deliver the update to the target _Endpoints._

- Before a _Component_ is deployed to an _Endpoint_: A _Component_ can be defined as having a "Pre-Action." When a _Component_ is being deployed to an _Endpoint_, the _Component_ is processed, and the files are pulled from the _Repositories_ and placed into the _Dropzone_. Any action defined as a Pre-Action to a _Component_ is executed **after** the _Dropzone_ has been populated from the _Components_ but **before** the _Component_ is pushed to the Target _Endpoints_. A Pre-Action to a _Component_ can be used to manipulate files in the _Dropzone_ before the files are delivered to the Target _Endpoint_ (for example, a modification to a configuration file).

- After a _Component_ is deployed to an _Endpoint_. A _Component_ can be defined as having a "Post-Action." When a _Component_ has been deployed any "Post-Action" is executed. A Post-Action to a _Component_ can be used to run scripts on the _Endpoint_ after the files have been delivered (for example, to install SQL changes or restart the Application Server).

- As a _Custom Action_ for the _Component_. When a _Component_ is defined, it can have a _Custom Action_ associated to it. This _Custom Action_ is then executed to deploy the _Component_. It is the sole responsibility of this _Custom Action_ to deliver the update to the target _Endpoint_. Use a _Custom Action_ when the delivery method differs from the usual "push files" mechanism – for example, invoking Ansible to install a piece of infrastructure or to issue a RESTful call to update the configuration of a load balancer.

## The _Action_ List View for Adding or Deleting

From the _Action_ menu option to the left of the Ortelius main panel, you will be taken to a list of all available _Actions_ which you have access to based on the _Domain_. You can also use the Filter bar, represented by a funnel icon, to reorder your _Actions_ List View.  You can filter on:

- Domain
- Action

The _Action_ List View has the following Tabs.

| Tab | Description |
| --- | --- |
|Refresh | Refreshes the browser. |
| Add | Allows you to Add a new _Action_. |
| Delete | Deletes the selected item. |

From the _Action_ List View, double click on the _Action_ to view the details.

## Using the _Action_ Dashboard for Viewing and Editing

The Dashboard view displays all information related to a specific _Action_.

| Details | Description |
| --- | --- |
| **Full Domain** | The fully qualified _Domain_ to which the _Action_ belongs. |
| **Name** | A unique Name that describes the _Action._ |
| **Summary** | A brief description of what the _Action_ does. |
| **Category** | Categories are used to arrange _Actions_ in an orderly manner. Assigning a Category to an _Action_ allows lists of Categories to be used throughout Ortelius. Clicking on an individual Category expands the list and shows all _Actions_ that belong to that Category. You can add a new Category by simply adding it to the list using the entry field. Pre-defined Categories include: <li>Build - _Actions_, _Functions_ and _Procedures_ for calling ANT (SalesForce integration).</li><li>Database - _Actions_, _Functions_ and _Procedures_ for database updates.</li><li>Deploy-_Actions_, _Functions_ and _Procedures_ for Deployments.</li><li>Dropzone- _Actions_, _Functions_ and _Procedures_ for interacting with the Dropzone.</li><li>File Logic-_Actions_, _Functions_ and _Procedures_ related to File manipulation.</li><li>Flow Logic-_Actions_, _Functions_ and _Procedures_ for if then else in DMScrit.</li><li>Loops-_Actions_, _Functions_ and _Procedures_for file looping.</li><li>General-Non-categorized Objects (default).</li><li>WebLogic-_Actions_, _Functions_ and _Procedures_ for deploying to WebLogic.</li><li>WebSphere-_Actions_, _Functions_ and _Procedures_ for deploying to WebSphere.</li><li>Windows-_Actions, Functions_ and _Procedures_ used for Windows deployments.</li>  |
| **Owner Type** | User or Group |
| **Owner** | The _User_ or _Group_ name of the _Action's_ owner. The default owner is the _User_ who created the _Action_. |
| **Created** | An auto generated date when the _Action_ was created (read-only). |
| **Modified** | An auto generated date when the _Action_ was last modified (read-only). |
|**Display Name**| You can use this field to create a more user friendly name for your _Action_|

### Access

The Access Section allows _Users_ within designated _Groups_ to update the _Action__ in various ways. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Action_ in the following ways:

| Access | Description |
| --- | --- |
|**View**| Allows _Users_ to see the _Action_. If the _User_ does not belong to a _Group_ in the View Access list, the _Action_ will not appear in the List View. |
|**Change**| Allows _User_ to change the _Action’s_ characteristics i.e. Name, Summary, etc. |
|**Execute**| Allows _Users_ to execute this _Action_. |

NOTE: **Ortelius** has only two Groups, _Administrators_ and _Users_. If you need more granularity in your UserGroups, you will need to upgrade to **DeployHub Pro.**

{{% include "userguide/reusable/AuditTrail.md" %}}

### Blueprint Section

The logic of an _Action_ is defined using a graphical drag and drop blueprint designer. A tree view on the right shows all the _Functions_ and _Procedures_ organized by categories that can be include in the _Action's_ logic. You can use the built-in activities for defining the logical steps of the _Action_ or you can create new _Procedures_ or _Functions_ and have them available as activities to use. See [_Functions_ and _Procedures_](/userguide/customizations/2-define-your-functions-and-procedures/) for more information.

The blueprint designer contains all activities that make up the _Actions_ logical processing steps, linked together in the order they are to be executed. Each step in the process has anchors where connections can be made. When you drag a item onto the designer, a blue input anchor is displayed at the top of the items "box." You will see a green anchor at the bottom representing output. In this way you can create connections between the processes.

Click on one of the Categories in the list to see the available _Functions_ or _Procedures_. Expand a Category and then select the desired Activity to drag and drop it into the _Action_ blueprint area. It appears as a box containing the name of the _Function_ or _Procedure_. It automatically links to the nearest "box" with a output anchor.

#### The _Function_ or _Procedure_ Parameter Dialog Box

The Parameter Dialog Box displays the options defined when the _Function_ or _Procedure_ was created using the Input Parameters Section from the _Functions_ and _Procedures_ Dashboard. When you add a new _Function_ or _Procedure_ to your _Action_ blueprint designer, the Parameter Dialog Box will automatically display.  If you are working on an existing _Action_ and want to view the parameters, a right click will display:

- View Details - opens the Parameter Dialog Box
- Got to the Procedure - takes you to the Dashboard of the _Function_ or _Procedure_. Your work will be saved automatically before navigating to the _Functions_ and _Procedures_ Dashboard.
- Delete this Activity - deletes the _Function_ or _Procedure_ from the blueprint designer.

An editor box opens automatically to set any input values required. If the dropped item is a _Function,_ then an additional _Result_ field is presented. This needs to be the name of a _Variable_ that receives the result of the _Function_.

You can connect items in any order you require. To do this, left-click and hold down the button on one of the output anchors, then drag the resulting line onto another input anchor. This connects the items together and determines the order for processing the steps. The lines connecting items can be deleted by right clicking on the connector line and selecting "Delete this Connector".

Some Built-in _Functions_ and _Procedures_ have more than one exit point. For example the "if" process can be used to create conditional branches where different routes are taken through the logic dependent on the evaluation of an expression. In such cases, there are multiple output "anchors" with labels (for example, true and false) which indicate the meaning of the anchor.

Some Built-in _Functions_ and _Procedures_ can contain other _Action's_ logic. When such _Actions_ are dropped onto the blueprint area they are represented by a larger "box" containing a diagram showing the other _Action_. Double clicking on such an item will "drill down" into that item and open up another blueprint editor. Such _Actions_ are typically "loops" (where the process "inside" the loop is executed for each iteration through the loop).

There are _Procedures_ and _Functions_ that ship with Ortelius, such as the Windows function 'listservices' and the WebSphere 'DeployWS' control procedure. These are editable (by an administrator with access to the GLOBAL _Domain_) just as any _User_ defined _Function_ or _Procedure_ would be. There are also some _Procedures_ and _Functions_ that simply wrap around DMScript (such as "Loop through Array Keys") that are not editable.

When the blueprint logic is executed, it's first converted into a DMScript Procedure. DMScript is Ortelius' built-in Object-Oriented Scripting Language.

{{% include "userguide/reusable/ListofActions.md" %}}
