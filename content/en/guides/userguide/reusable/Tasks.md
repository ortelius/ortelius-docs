## Deployment Tasks

Task are used for executing deployments, managing approvals, or staging a deployment. Tasks can be assigned to any _Domain_. However, they are most commonly associated to _Project Domains_ and _Life Cycle Domains_. You can assign a Task at a higher _Domain_ level allowing any child _Domains_ to automatically inherit the Tasks. This inheritance simplifies managing Tasks by making some common to all of your _Subdomains_. However, this means that a Catalog _Domain_ may include Tasks that it cannot use.

The following Tasks are available as default Tasks, but you can create any type of custom Task. A custom Task will call a Custom [_Action_](/guides/userguide/customizations/2-define-your-actions/):

- Move Version to the Next or Previous Pipeline State
- Deploy Version to _Environment_
- Manually Trigger _Action_ to be executed

**DeployHub Pro**:

DeployHub Pro includes a ["smart" Calendar](/guides/userguide/profeatures/calendar/).  The following Task are used to interact with the Ortelius Smart Calendar for Requesting and Approving deployments.

- Request Calendar Entry for Deployment to an _Environment_
- Approve Version for Move to Next Pipeline State

### Adding, Editing and Deleting Tasks

 You can add new Tasks from the _Domain_ Dashboard by navigating to the _Domain_ and interacting with the Tasks Section.  Select the +Add option from the Tasks Section and a pop-up displays all available Tasks. Selecting a Task will add a new row into the table.  Use the Task Detail Section to define the unique details of your new Task. You can update or remove a Task by using the Task Section table.  Using the checkbox, select the item and use the the Delete or Edit options.

Once you create a Task, it is recommended that you rename that Task to more closely describe its use depending on the options selected.

Below is a description of all Tasks and their detailed information.

 **Move Version to the Next or Previous Pipeline State**

Moves an _Application_ or _Release_ version from one Pipeline state (Life Cycle _Subdomain_) to another. This can be used as a promotion or a demotion of an _Application_ or _Release_ version between Life Cycle states. When the Task is defined, the Life Cycle _Subdomain_ has to be specified as part of the Task definition. The Approval Task must be accepted before the Move Version is to succeed.

| "Move" Task Detail Fields| Description|
|---|---|
|**Name**| The unique name of the Task. |
|**Created**| Auto-generated date and time the Task was added. |
|**Modified**| Auto-generated date and time the Task was updated.|
|**Pre-Action**| Change the default behavior by assigning a custom _Action_ to execute as a Pre-processing step.    |
|**Post-Action**| Change the default behavior by assigning a custom _Action_ to execute as a Post-processing step. |
|**Available in _Subdomains_**| Once selected, all _Subdomains_ will have access to this Task.  |
|**Move To _Domain_**| The target _Domain_ where the version will be moved. |
|**Success _Notify Template_**| The _Notify Template_ emailed on a successful move. You need to define the _Notify Template_ from the Setup Menu.  See more on [_Notify Templates_](/guides/userguide/customizations/2-notifier-templates/).  |
|**Failure _Notify Template_**| The _Notify Template_ emailed on a failed move. You need to define the _Notify Template_ from the Setup Menu.  See more on [_Notify Templates_](/guides/userguide/customizations/2-notifier-templates/).  |

**Deploy Version to _Environment_**

Deploys an _Application_ or _Release_ version to an _Environment_. Select the target _Environment_ via a drop-down list.

| "Deploy" Task Detail Fields| Description|
|---|---|
|**Name**| The unique name of the Task. |
|**Created**| Auto-generated date and time when added. |
|**Modified**| Auto-generated date and time when updated.|
|**Pre-Action**| Change the default behavior by assigning a custom _Action_ to execute as a Pre-processing step.    |
|**Post-Action**| Change the default behavior by assigning a custom _Action_ to execute as a Post-processing step. |
|**Available in _Subdomains_**| If selected, all _Subdomains_ will have access to this Task.  |

**Manually Trigger _Action_ to be executed**

Runs a stand-alone _Action_. For example, if you need to interrupt a deployment process, this Task allows you to execute the steps manually. The manually triggered _Action_ will be placed in the "To do" list of the _User_ or _Group_ that executed the Deploy Task.

| "Manually Trigger" Task Detail Fields| Description|
|---|---|
|**Name**| The name of the Task - can be changed to make the Task unique. |
|**Created**| The auto generated date and time the Task was added. |
|**Modified**| The auto generated date and time the Task was updated.|
|**Pre-Action**| You can change the default behavior by assigning a custom _Action_ to execute as a Pre-processing step.    |
|**Post-Action**| You can change the default behavior by assigning a custom _Action_ to execute as a Post-processing step. |
|**Action to Run**| The Action that will be executed manually. |
|**Available in _Subdomains_**| If selected, all _Subdomains_ will have access to this Task.  |
|**Success _Notify Template_**| The _Notify Template_ that will be emailed on a successful _Action_. You will need to define the _Notify Template_ from the Setup Menu.  See more on [_Notify Templates_](/guides/userguide/customizations/2-notifier-templates/).  |
|**Failure _Notify Template_**| The _Notify Template_ that will be emailed on a failed _Action_. You will need to define the _Notify Template_ from the Setup Menu.  See more on [_Notify Templates_](/guides/userguide/customizations/2-notifier-templates/).  |

**Approve Version for Move to Next Pipeline State**

Approves the _Application_ or _Release_ version so that it can be moved to a specified state in the pipeline (Life Cycle _Subdomain_). This works in conjunction with the Move Version Task. When the Approve Task is defined, the Target _Domain_ has to be specified. When the Approve Task is executed, the selected _Application_ or _Release_ version can either be Approved or Rejected. Only when the an _Application_ or _Release_ version is "approved" can it be "Moved" or "Deployed".

Note: When an Approve Task has been defined for a _Domain_, it will force the use of the Approve Task before a "Move" or "Deploy" Task can be executed. If a "Move" or "Deploy" Task is attempted but has not been "Approved," an error will be displayed indicating that the Task must be Approved.

| "Approve" Task Detail Fields| Description|
|---|---|
|**Name**| The name of the Task - this information can be changed to make the Task unique. |
|**Created**| The auto generated date and time the Task was added. |
|**Modified**| The auto generated date and time the Task was updated.|
|**Pre-Action**| You can change the default behavior of this Task by assigning a custom _Action_ to execute as a Pre-processing step.    |
|**Post-Action**| You can change the default behavior of this Task by assigning a custom _Action_ to execute as a Post-processing step. |
|**Available in _Subdomains_**| If this is selected, all _Subdomains_ will have access to this Task.  |
|**Approval _Domains_**| The target _Domain_ that approval  is the subject of.   |
|**Approval _Notify Template_**| The _Notify Template_ that will be emailed on approval. You will need to define the _Notify Template_ from the Setup Menu.  See more on [_Notify Templates_](/guides/userguide/customizations/2-notifier-templates/).  |
|**Rejected _Notify Template_**| The _Notify Template_ that will be emailed on rejection. You will need to define the _Notify Template_ from the Setup Menu.  See more on [_Notify Templates_](/guides/userguide/customizations/2-notifier-templates/).  |

**Request Calendar Entry for Deployment to an _Environment_**

DeployHub Pro feature. Sends a request from a _User_ to add a time slot to the calendar for a deployment. The request is sent to _Group_ who has the authority to manage a particular _Enviornment's_ Calendar. When the Request Task is defined it is linked to the task to be requested. When the Request Task is executed an entry is placed into the "To Do" list of all the _Users_ who are members of the _Group_ with the calendar access. The Request Task can have a Request Notification Template defined which can send out a notification to the appropriate _Groups_.

| "Request" Task Detail Fields| Description|
|---|---|
|**Name**| The name of the Task - can be changed to make the Task unique. |
|**Created**| The auto generated date and time the Task was added. |
|**Modified**| The auto generated date and time the Task was updated.|
|**Pre-Action**| You can change the default behavior by assigning a custom _Action_ to execute a Pre-processing step. |
|**Post-Action**| You can change the default behavior by assigning a custom _Action_ to execute a Post-processing step. |
|**Available in _Subdomains_**| If selected, all _Subdomains_ will have access to this Task.  |
|**Linked Task**| The target _Domain_ where the version will be moved. |
|**Request _Notify Template_**| The _Notify Template_ emailed for the request. You will need to define the _Notify Template_ from the Setup Menu.  See more on [_Notify Templates_](/guides/userguide/customizations/2-notifier-templates/).  |

**Task Execute Access**

Once a _Task_ is defined, it must be granted execute access to a _Group_ before it can be invoked. Select the _Task_ using the check box. Drag the desired  _Group_ from the _Available Groups_ column to the _Group Access_ area. _Users_ of the _Group_ can then execute the specified task.

  _Groups_ are assigned authority on a _Task_ by _Task_ basis. It is possible for a _Domain_ to have two different _Tasks_ with the same function, one of which allows a particular _Group_ to run the _Task_, and the other which doesn't. This allows similar _Tasks_ to be created. They can have different characteristics assigned to them such as Pre-Actions and/or Post-Actions, Notification Templates, etc. Also different _User Groups_ can have the authority to run them.

- Example: A _Group_ can run a "Move" Task, sending an _Application Version_ from the Test Life Cycle State to the Production Life Cycle State. A Group consisting of testers perhaps does not have the ability to run that same Task.

- Example: A Move Task is linked to a Request Task. A User in the Test Group would run the Request Task, which notifies Users in the Release Group and requests that the Application Version be moved. Users in the Production Group would then receive the Request Task through their To Do List and optionally an email (which was designated as the Request Notification Template in the Request Task). They would then run the linked Move Task to move the Application Version to the Production Life Cycle State.

NOTE: Another way to accomplish this is to link an Approval Task to the Request Task. The User in the User Group would send the Request Task, and a User in the Admin Group would be notified. They would then run the Approve Task to allow the User in the Test Group to run the Move Task.

**Additional Task Parameters**

Additional parameters can be added to a Task. These additional parameters will set Global Variable at execution time. To add them, select the Task from the Task Section. Use +Add to create a new entry into the Parameters table for the selected task. It will have two columns:

- Label: This will appear on the Task's execution window whenever the Task is executed.

- Variable: An Entry, Password, or Dropdown field appears to the right of the Label whenever a Task is executed, where values can be either entered or selected, depending on the Type.

Use the Save to commit the change to the table. Use Edit to update a Task Parameter, or Delete to remove a Task Parameter.
