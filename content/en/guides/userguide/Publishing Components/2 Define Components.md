---
title: "Defining Components"
linkTitle: "Defining Components"
weight: 2
description: >
  How to Publish Components to Domains
---

## _Component_ List View allows Adding or Deleting

Use the _Component_ List View accessible from the left hand _Component_ menu option to manage your _Components Base Version_ and _Component Versions_. Because each _Environment_ has a row where the _Component Base Version_ or _Component Version_ has been deployed, there can be multiple entries for the same _Component_ if it has been deployed to multiple _Environments_. A list of all _Components_ is organized by the following:

| List Column | Description|
|---|---|
|**Version**|  The _Component Base Version_ or _Component Version_ number. |
|**Domain**| The _Domain_ to which the _Component_ belongs.|
|**Parent**| The _Component Base Version_ from which the _Component Version_ was created. This will be empty for the _Component Base Version_.|
|**Environment**| The _Environment_ to which the _Component_ has been deployed. Each _Environment_ will represent a different row in the List View table.|
|**Last Deployment to Environment**| The Deployment Log number.|
|**Completed**|The date and time of the last deployment to the listed _Environment_.|
|**Results**| Success or Fail.|

Note: If you have not defined any _Components_ to Ortelius, you will see only the sample data.

You can also use the Filter bar, represented by a funnel icon, to reorder your _Component_ List View:

- Domain
- Environment
- Last Deployment
- Parent
- Result
- Version

## Additional Tabs from the _Component_ List View

| Tab | Description |
| --- | --- |
|**Refresh** | Refreshes the browser. |
| **+Add Base** | Allows you to Add a new _Component Base Version_. You will select from one of three types: Container, Application File, Database |
| **+Add Version** | Creates a copy of the selected _Component_.  |
| **Delete** | Deletes the selected item. However, you must delete the _Components_ starting from the newest to the oldest.  The _Component Base Version_ would be deleted last. Sorting by "Version" gives you the order.  |
| **List** | Return to List View if in the Map View. |
| **Map** | Displays a global Map of all _Component_ versions, with their _Application_ relationships.  |

## _Component_ Types

When adding new _Components_ select the  _Component_ Type from the drop down list/:

| **Type** | **Description** |
| --- | --- |
| **Container** | For Containers such as Docker.  |
| **Application File** | For binary files such as .jar, .war, .ear, .exe, .dll, Linux executable files, Oracle Forms, or similar artifacts.   |
| **Database** | For SQL files such as .ddl or other database update scripts. |

## How to View and Edit _Components_

_Components_ are defined as Container, Application File, or Database.  These are the different types of _Components_ you may need from microservices to binaries and DB updates. The Dashboard view displays all information related to a specific _Component Base Version_ or _Component Version_. Depending on what type of _Component_ you are defining, you will be presented with different data definition fields.

The following fields are common to all _Components_:

| Field | Description |
| --- | --- |
| **Full Domain** | The fully qualified path of the _Domain_ that the _Component_ is to be associated, showing all parent _Domains_. |
| **Name** | The name of the _Component._ |
| **Owner Type** | Owned by a User or Group. |
| **Owner** | The owner of the _Component_, whose default value is the creator of the _Component_.
| **Summary** | A short text field with a description of the _Component_. |
| **Created** | The date and time that the _Component_ was created. |
| **Modified** | The date and time of the last change. |
| **Object**| Displays _Component_ for the Base Version or _Component Version_.|
| **Type**| The kind of Component created, i..e. Container, Application File, or Database.|
|**Endpoint Type** | Used to map the _Component_ to _Endpoints_ within an _Environment_ at deployment.  This allows Ortelius to map the _Component_ to the correct _Endpoint_ when moving across different environments.  You can add your own _Endpoint_ Types from the Customize Types menu or select from the default options.|
| **Change Request Data Source** | This _Data Source_ is assigned to the _Component_ for tracking Change Request. A Change Request Data Source must be pre-defined for this field to be used. |
| **Category** | Assigning a Category to an Object allows lists of Objects based on Categories to be used throughout Ortelius. Add a new Category in the entry field or use an existing Category displayed in the drop down. Categories are most commonly associated with _Actions_, _Functions_ and _Procedures_. Pre-defined Categories include: <li>Build - _Actions_, _Functions_ and _Procedures_ for calling ANT (SalesForce integration).</li><li>Database - _Actions_, _Functions_ and _Procedures_ for database updates.</li><li>Deploy- _Actions_, _Functions_ and _Procedures_ for Deployments.</li><li>Dropzone- _Actions_, _Functions_ and _Procedures_ for interacting with the Dropzone.</li><li>File Logic- _Actions_, _Functions_ and _Procedures_ related to File manipulation.</li><li>Flow Logic- _Actions_, _Functions_ and _Procedures_ for if then else in DMScript.</li><li>Loops- _Actions_, _Functions_ and _Procedures_ for file looping.</li><li>General-Non-categorized Objects (default).</li><li>WebLogic- _Actions_, _Functions_ and _Procedures_ for deploying to WebLogic.</li><li>WebSphere- _Actions_, _Functions_ and _Procedures_ for deploying to WebSphere.</li><li>Windows- _Actions, Functions_ and _Procedures_ used for Windows deployments.</li>   |
| **Always Deploy** | The _Component_ is deployed to the associated _Endpoints_ in the _Target Environment_ regardless if the _Component_ is already present on the _Endpoints_. This is useful for monolithic applications where you want to copy over a binary for example.|
|**Deploy Sequentially** | Normally when a _Component_ in an _Application_ is deployed to several _Endpoints_ in an _Environment_, it is deployed to each _Endpoint_ at the same time (in parallel). The "Deploy Sequentially" option changes this behavior to force the _Component_ to deploy to each _Endpoint_ in turn, sequentially. |
| **Custom Action** | An _Action_ that replaces the usual Deployment Engine processing. Custom _Actions_ can be used to call Ansible, Helm or other external deployment tools.|

### Container Specific Data Definition

Helm is required for deploying Container _Components_. Ortelius interfaces with Helm to support a Kubernetes Cluster deployment.

Initially, you will need to create a _Custom Action_ for using Helm as your deployment engine. Once your _Custom Action_ has been created, it can be reused by all _Users_ as long as you define the _Custom Action_ to your "Global" Domain. Follow the steps at [Helm for Container Deployments](/guides/userguide/integrations/helm/).

A Container _Component_ has the following optional attributes:

| **Field**| **Description** |
| --- | --- |
|**Build Job** | The Continuous Delivery Build Job that is used to build/compile the _Component_.  |
|**Last Build Number** | The number of the last Continuous Delivery (CD) Workflow that created the files referenced within the _Component._ This number will default to the Build ID if one is not set by the CD Workflow.|
| **Build ID** | The internal identifier for the _Build Engine_. |
|**Build URL**| The URL to the _Build Engine_. |
|**Build Date**| The timestamp from when the last build job was run.|
|**Helm Chart** | The Helm Chart used to deploy the _Component_. |
|**Helm Chart Version** | The Helm Chart Version from the Helm Repository. |
|**Helm Chart Namespace** | The sub-division of the Kubernetes cluster where your _Component_ Container should run. |
|**Operator**| The RedHat Operator used to deploy your _Component_ container.|
|**Container Registry**| The Container registry where the Container is stored. |
|**Container Digest**| The SHA number of the Container image. |
|**Container Tag**| The tag that was assigned to the Container image. ||
|**Git Commit**| The Git SHA number. Populated when integrated into Continuous Delivery Pipelines.|
|**Git Repo**| The Git Repository that triggered the build.Populated when integrated into Continuous Delivery Pipelines.|
|**Git Tag**| The last tag for the Git Repository. Populated when integrated into Continuous Delivery Pipelines.|
|**Git URL**| The URL for the Git Repository.Populated when integrated into Continuous Delivery Pipelines.|

### Application Specific Data Definition

|**Field** | **Description**|
| --- | --- |
| **Base Directory**| Base, or high level, directory where the file will be deployed. This value will be ignored if the _Endpoint_ has a Base Directory defined.  See [Formatting Directories](/guides/userguide/publishing-components/2-define-components/#formatting-of-the-deployment-directory-with-base-and-target-directories-for-database-and-application-file-deployments) on the order of how the deployment directory is formatted. |
| **Target Directory** | The directory under the Base Directory where the file will be deployed, or final "Target" Directory. See [Formatting Directories](/guides/userguide/publishing-components/2-define-components/#formatting-of-the-deployment-directory-with-base-and-target-directories-for-database-and-application-file-deployments) on the order of how the deployment directory is formatted.|
| **Pre-Action** | An _Action_ that is to be run prior to the deployment of this _Component_. This can be used to perform prerequisite requirements, such as creating directories, creating files from scratch, or moving files between directories. |
| **Post-Action** | An _Action_ that is to be run after the deployment of this _Component_. This can be used to execute actions on the target _Endpoint_ after the _Component_ has been deployed. |
|**Build Job** | The Continuous Delivery Build Job that is used to build/compile the _Component_.  |
| **Last Build Number** | The number of the last Continuous Delivery (CD) Workflow that created the files referenced within the _Component._ This number will default to the Build ID if one is not set by the CD Workflow.|
| **Build ID** | The internal identifier for the _Build Engine_. |
| **Build URL**| The URL to the _Build Engine_. |
|**Build Date**| The timestamp from when the last build job was run.|
| **Repository** |  Choose the Repository that contains your _Application_ binaries, files, etc. This list box is populated based on the _Repositories_ pre-defined in your initial setup. Based on the _Repository_ you select, you may be provided override or append fields if they were made available. For a list of the _Repositories_  See [Connecting Your Repositories](/guides/userguide/first-steps/2-define-repositories/#using-the-repository-dashboard-for-viewing-and-editing) for more information.<ul><li>Filepath Override: Enter a filepath that will override the default filepath defined at the _Repository_ level.</li><li>Pattern Override: Enter a pattern that will override the default pattern defined at the _Repostory_ level.  Patterns are file types you want to pull from the _Repository_, such as \*.exe, \*.dll, \*.war. </li><li>Recursive Override: Select the box in order to override the default recursive behavior defined at the _Repository_ level. This will turn recursion on or off depending on the setting at the _Repository_ level. </li><li>Version Override: Overrides the default template of your versioning pattern defined at the _Repository_ level. </li></ul> |
|**FailureTemplate**| The name of the Failure Notification Template to use on a deployment failure. |
|**SuccessTemplate**| The name of the Success Notification Template to use on a deployment succes. |
|**CustomAction**| The name of the custom action to execute for the deployment. This will override the Post Action and Pre Actions. |
|**PreAction**| The name of the Pre Action to execute at the very beginning of the deployment. |
|**PostAction**| The name of the Pre Action to execute at the very end of the deployment. |

### Database Specific Data Definition

Database _Components_ are used for making database updates such as table changes using SQL Scripts. Note: An database form (such as an Oracle Form) can be compiled and should be defined as an Application File not Database _Component_.

| Field | Description |
| --- | --- |
| **Base Directory**|Base, or high level, directory where the file will be deployed. This value will be ignored if the _Endpoint_ has a Base Directory defined.  See [Formatting Directories](/guides/userguide/publishing-components/2-define-components/#formatting-of-the-deployment-directory-with-base-and-target-directories-for-database-and-application-file-deployments) on the order of how the deployment directory is formatted. |
| **Pre-Action** | An _Action_ that is to be run prior to the deployment of this _Component_. This can be used to perform prerequisite requirements, such as creating directories, creating files from scratch, or moving files between directories. |
| **Post-Action** | An _Action_ that is to be run after the deployment of this _Component_. This can be used to execute actions on the target _Endpoint_ after the _Component_ has been deployed. |
|**Roll Forward Target Directory**|  The directory under the Base Directory where the Roll Forward file will be deployed, or final "Target" Directory. See [Formatting Directories](/guides/userguide/publishing-components/2-define-components/#formatting-of-the-deployment-directory-with-base-and-target-directories-for-database-and-application-file-deployments) on the order of how the deployment directory is formatted. |
|**Roll Forward Repository**|  Choose the Repository that contains your Roll Forward SQL. This list box is populated based on the _Repositories_ pre-defined in your initial setup. Based on the _Repository_ you select, you may be provided override or append fields if they were made available. For more information on _Repositories_ see [Connecting Your Repositories](/guides/userguide/first-steps/2-define-repositories/#using-the-repository-dashboard-for-viewing-and-editing).<ul><li>Filepath Override: Enter a filepath that will override the default filepath defined at the _Repository_ level.</li><li>Pattern Override: Enter a pattern that will override the default pattern defined at the _Repository_ level.  Patterns are file types you want to pull from the _Repository_, such as \*.exe, \*.dll, \*.war. </li><li>Recursive Override: Select the box in order to override the default recursive behavior defined at the _Repository_ level. This will turn recursion on or off depending on the setting at the _Repository_ level. </li><li>Version Override: Overrides the default template of your versioning pattern defined at the _Repository_ level. </li></ul>  |
| **Rollback Target Directory** | The directory under the Base Directory where the Rollback file will be deployed, or final "Target" Directory. See [Formatting Directories](/guides/userguide/publishing-components/2-define-components/#formatting-of-the-deployment-directory-with-base-and-target-directories-for-database-and-application-file-deployments) on the order of how the deployment directory is formatted. |
| **Rollback Repository** | Choose the Repository that contains your Roll Forward SQL. This list box is populated based on the _Repositories_ pre-defined in your initial setup. Based on the _Repository_ you select, you may be provided override or append fields if they were made available. For more information on _Repositories_ see [Connecting Your Repositories](/guides/userguide/first-steps/2-define-repositories/#using-the-repository-dashboard-for-viewing-and-editing).<ul><li>Filepath Override: Enter a filepath that will override the default filepath defined at the _Repository_ level.</li><li>Pattern Override: Enter a pattern that will override the default pattern defined at the _Repository_ level.  Patterns are file types you want to pull from the _Repository_, such as \*.exe, \*.dll, \*.war. </li><li>Recursive Override: Select the box in order to override the default recursive behavior defined at the _Repository_ level. This will turn recursion on or off depending on the setting at the _Repository_ level. </li><li>Version Override: Overrides the default template of your versioning pattern defined at the _Repository_ level. </li></ul> |

### Formatting of the Deployment Directory with Base and Target Directories for Database and Application File Deployments

You must define the directory where your _Component_ file is going to be deployed on your _Endpoint_.  This is the purpose of your _Component_ Base and Target Directories. The Base Directory is the high level directory, the Target Directory is the lower level, or final "Target" directory.  _Endpoints_ may be managed by a System Administrator who may want to force the use of a particular Base Directory on the _Endpoint_.  If so, this directory can be set at the _Endpoint_ Base Directory and override the _Component_ level Base Directory.  When a deployment occurs, the process will check to see if the _Endpoint_ has a Base Directory defined, and will replace the _Component_ Base Directory with the _Endpoint_ Base Directory to create the full path for the deployment.

Below is how the full file deployment path is formatted:

| Component Base Directory Value| Component Target Directory Value | Endpoint Base Directory Value| Result |
|---|---|---|---|
| Has Value | Null | Null | The files will be placed in the _Component_ Base Directory. |
| Null | Has Value | Null | The files will be placed in the _Component_ Target Directory. |
| Null | Null | Has Value | The files will be placed in the _Endpoint_ Base Directory. |
| Null | Has Value | Has Value | The files will be placed in the Endpoint Base Directory + Component Target Directory. |
| Has Value | Null | Has Value | The files will be placed in the _Endpoint_ Base Directory. |
| Has Value | Has Value | Null | The files will be placed in the Component Base Directory + Component Target Directory. |
| Has Value | Has Value |Has Value| Endpoint Base Directory + Component Target Directory. |
| Null | Null | Null | Deployment will fail. |

### _Component_ Dependency Map

The Dependency Map provides a graphical view of all _Applications_ that is consuming this _Component_. This will remain empty until your  _Component_ is used by an an _Application_.

### _Endpoints_

This section lists all _Endpoints_ that the _Component_ has been installed to with its Deployment Number. The Deployment Number is generated by Ortelius for each unique deployment.  You can also use this section to stop incremental deployments and force a specific version to be deployed to the _Endpoint_. By manually adding a specific _Component Version_ to the _Endpoint_, you bypass the incremental deployment logic of the deployment engine.  For example, if you would like to deploy a particular container without accepting any intermediate updates, you would go to the intermediate _Component Versions_ and manually add them to the _Endpoints_, causing the deployment engine to believe that it was previously deployed. When you manually add an _Endpoint_, the Deployment Number will show "manually deployed." To manually add a _Component_ to an _Endpoint_, use the +Add option. You will be provided a list of available _Endpoints_. Use Save to commit the change to the table. You can select multiple _Endpoints_.  To Edit or Delete an _Endpoint_, select the _Endpoint_ and use the Edit or Delete option.

{{% include "guides/userguide/reusable/Attributes.md" %}}

### Deployed Environments for _Component_

A map showing all _Environments_ where the _Component_ is deployed.

### Consuming _Applications_

This section shows a list of all _Applications_ that are consuming this _Component_.

{{% include "guides/userguide/reusable/AuditTrail-withDeployments.md" %}}

### Access

The Access Section allows _Users_ within designated _Groups_ to update or view the _Component_. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Component_:

| Access | Description |
| --- | --- |
| **View** | This allows any _User_ that belongs to any _Group_ in this list to see the selected _Component_ in the List View. |
| **Change** | This allows any _User_ that belongs to any _Group_ in this list to make changes to the _Component_. |

{{% include "guides/userguide/reusable/ChangeRequest.md" %}}

## Publish a New _Component Version_ Based on an Existing _Component Version_

Create _Component Versions_ that are patterned after the _Component Base Version_ or any _Component Version_. Check the box _Component Base Version_ or _Component Versions_ from which you want to base the new version. Select the New Version Tab to access the _Component_ Dashboard and then edit the new _Component Version_. When you manually create a new _Component Version_ the name will be auto generated with a new number. You may need to provide it a unique name based on your versioning patterns.

## Publish New _Component Versions_ automatically via Continuous Delivery

Configure a continuous delivery system to automatically update new _Component Versions_ each time a new GitCommit triggers the workflow process.  Add Ortelius to the workflow to perform the continuous versioning of new _Components_ and their consuming _Applications_.  For more information, see [Using Ortelius with CI/CD](/guides/userguide/integrations/ci-cd_integrations/).
