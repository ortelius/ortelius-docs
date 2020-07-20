---
title: "Stack"
linkTitle: "Stack"
weight: 100
description: >
  Manage the Ortelius Stack.
---



The stack is a fundamental part of Ortelius. During deployment, objects are pushed onto and popped off the stack. Objects such as _Environments_, _Applications_, and _Endpoints_ each have their own properties. These are accessible as variables in _DMScript_ (provided the object is currently on the stack).

Regardless of why the _DMScript_ has been invoked (either a deployment or via it being linked to a manually invoked task), there is always a  "global" scope. This contains all the _Environment_ variables available to the deployment engine, any additional parameters specified for the invoking task and any variables set with the –g option.

The following variables are always defined in the Global scope:

| Variable | Description | Example |
| --- | --- | --- |
| ARGC | Count of command line args | $ARGC |
| ARGV | Array of command line | ${ARGV[1]} |
| DMHOME | Home directory of engine | $DMHOME/demo\_repo |
| $ | Process id of engine process | $$ |
| JSESSIONID | The session id of the Web UI | $JSESSIONID |

You can use $DMHOME to reference files that are stored in directories relative to the Ortelius engine installation location.

Every invocation of the engine results in a new engine process (and therefore a new value of $$). You can use the $$ variable to create filenames that are guaranteed to be unique even if multiple engines are running simultaneously.

If the _DMScript_ has been invoked from the Ortelius Web User Interface (i.e.: a manual deployment or a task invocation) then JSESSIONID is set to the session ID of the web session. You can use this to call the Ortelius API from inside _DMScript_ without the need to explicitly log in to the API.

During a deployment, the _Environment_ (and its attributes) are pushed onto the stack, followed by the _Application_ being deployed. At this point, the stack looks like this:

```bash

Application

Environment

Global
```

Thus, any attributes in the _Global_ scope can be overridden by attributes in the selected _Environment_. Similarly, any attributes defined in the _Environment_ can be overridden by attributes defined in the _Application_.

For example, suppose the _Environment_ "Test _Environment_ A " has an attribute called QUEUE\_NAME which is set to queue1. The _Application_ "MyApp;2 " also has an attribute QUEUE\_NAME which is set to queue2.

During a deployment of  "MyApp;2 " to  "Test _Environment_ A ", a reference to $QUEUE\_NAME will return queue2 – since QUEUE\_NAME is defined as  "queue2 " against the _Application_ and the _Application_ is higher in the stack.

If you want to retrieve the value of an attribute at a specific point in the stack, then you will have to reference the specific object scope. Each object scope has a specific name. Using the example above, $QUEUE\_NAME will be queue2 but ${_Environment_.QUEUE\_NAME} will be queue1.

Each scope is named as follows:

| Scope Name | Description |
| --- | --- |
| Global | Contains all Environment variables and any  "additional attributes " set by the user when the invoking task is run. |
| Environment | Pushed during a deployment or when a manual task is invoked by right-clicking on an Environment. This scope contains the Environment Object itself and any attributes defined for that Environment. |
| Application | Pushed during a deployment or when a manual task is invoked by right-clicking on an Application. This scope contains the Application Object itself and any attributes defined for that Application. |
| Endpoint | Pushed during a deployment when a particular Endpoint is being targeted. Also available during a psloop (see  "psloop " later in this section). This scope contains the Endpoint Object itself and any attributes defined for that Endpoint. |
| Component | Pushed during a deployment when the Application is being deployed. The scope contains the Component Object itself and any attributes defined for that Component. |

_DMScript_ has built-in methods that allow you to iterate through _Endpoint_ and _Component_s and these push each _Component_/server onto the stack at the start of the loop and pop them off again at the end of the loop. This happens automatically for each iteration through the loop. So, for example, you could print the names of all the target _Endpoint_s by writing this:

```bash
psloop {

echo  "${server.name} - ${server.hostname} ";

}
```

_psloop_ stands for _Physical Server Loop_. It iterates through each _Endpoint_ in the current _Endpoint_ list (by default, this is all the _Endpoint_s associated with an _Environment_). Each _Endpoint_ is pushed onto the stack at the  "top " of the loop and popped off again at the end. So this loop will:

- push the first _Endpoint_ onto the stack;
- the  "echo " will print the name and the hostname of this _Endpoint_ (by explicitly naming the _Endpoint_ scope, the attributes  "name " and  "hostname " are pulled from the _Endpoint_ object on the stack);
- pop the _Endpoint_ off again;
- repeat (a)-(c) for _Endpoint._

### Stack Content During Deployment

As discussed above, the stack has different objects pushed onto it at various stages in the deployment process. Knowing the deployment process allows you to understand which objects are available to _DMScript_ at which point.

During a Deployment, the following steps are followed:

- The Global, _Environment_ and _Application_ scopes are pushed onto the stack.

- If any Pre-Action is linked to the invoked deployment task, then the action is executed. If this action exits with an error then the process is halted.

- If any Pre-Action is linked to the _Application_ being deployed, then the action is executed. If this action exits with an error, then the process is halted.

- An  "_Application_ Loop " is automatically invoked to loop between the version of the _Application_ on the target _Environment_ and the version being deployed.

- If rolling forward (the _Application Version_ being deployed is later than the version in the target _Environment_), the  "interim " versions of the _Application_ are checked to see if any _Component_ contains a  "_Component_ item " with  "roll-forward " option set. If so, the _Component_ is pushed onto the stack and deployed.

- If rolling backward (the _Application Version_ being deployed is earlier than the version in the target _Environment_), the  "interim " versions of the _Application_ are checked to see if any _Component_ contains a  "_Component_ item " with  "rollback " option set. If so, the _Component_ is pushed onto the stack and deployed.

- When a _Component_ is being deployed, the following steps are performed:
  - Each _Component_ Item is executed in sequence to pull the items from the associated repository into the drop-zone.
  - The _Endpoint_ list to which the _Component_ is to be deployed is determined.
  - Each target _Endpoint_ is checked to see if the version of the _Component_ that is associated with the _Endpoint_ is different to the version in the _Application_. If the _Component_ version differs or the _Component_ is set to  "Always Deploy " then the _Component_ is deployed:
    - Any Pre-Action on the _Component_ is executed.
    - If the _Component_ has a Custom Action, then the Custom Action is executed.
    - If the _Component_ does not have a Custom Action, then the drop-zone content is pushed to the target _Endpoint_. If the drop-zone is empty, then no push is performed.
    - Any Post-Action on the _Component_ is executed.

### Pre Action to Task

|  **Invocation Point**  |  **Available Objects and Variables** |
| --- | --- |
| $_Component_| The selected _Component_ if the task was invoked on a _Component._ |
|$Application Object| The selected _Application_ if the task was invoked on an _Application.|   $Environment_Object| The _Environment_ being deployed to if this is a Deployment Task. |

### Post Action to Task

|  **Invocation Point**  |  **Available Objects and Variables** |
| --- | --- |
| $? Integer| The Exit Status of the task.|
| $_Component_ Object|The selected _Component_ if the task was invoked on a _Component._
|$_Application_ Object| The selected _Application_ if the task was invoked on an _Application._ ||$_Environment_ Object| The _Environment_ being deployed to if this is a Deployment Task. |

### Pre Action for _Application_

|  **Invocation Point**  |  **Available Objects and Variables** |
| --- | --- |
| ${dep.rollforward} Boolean| Set during a deployment to true or false.Indicates if the version being deployed is later than the version in the target _Environment_.|
| ${dep.rollback} Boolean| Set during a deployment to true or false. Indicates if the version being deployed is earlier than the version in the target _Environment_. |
|${dep.same} Boolean| Set during a deployment to true or false. Indicates if the version being deployed is the same as the version in the target _Environment_.|
|$_Application_ Object| The _Application_ being deployed.
|$_Environment_ Object| The _Environment_ being deployed to. |

### Post Action for _Application_

|  **Invocation Point**  |  **Available Objects and Variables** |
| --- | --- |
| $? Integer| The Exit Status of the deployment.|
| ${dep.rollforward} Boolean| Set during a deployment to true or false. Indicates if the version being deployed is later than the version in the target _Environment_.
|${dep.rollback} Boolean| Set during a deployment to true or false. Indicates if the version being deployed is earlier than the version in the target _Environment_.|
|${dep.same} Boolean| Set during a deployment to true or false. Indicates if the version being deployed is the same as the version in the target _Environment_.|
|$Application_Object| The_Application_ being deployed.
|$Environment_Object.|  The_Environment_ being deployed to.

### Custom Action for _Application_

|  **Invocation Point**  |  **Available Objects and Variables** |
| --- | --- |
  ${dep.rollforward} Boolean: |Set during a deployment to true or false. Indicates if the version being deployed is later than the version in the target _Environment_.
|${dep.rollback} Boolean| Set during a deployment to true or false. Indicates if the version being deployed is earlier than the version in the target _Environment_.|
|${dep.same} Boolean| Set during a deployment to true or false. Indicates if the version being deployed is the same as the version in the target _Environment_.|
|$Application_Object| The_Application_ being deployed.|
|$Environment_Object| The_Environment_ being deployed to.|

### Pre Action for _Component_

|  **Invocation Point**  |  **Available Objects and Variables** |
| --- | --- |
 ${dep.rollforward} Boolean| Set during a deployment to true or false. Indicates if the version being deployed is later than the version in the target _Environment_.|
|${dep.rollback} Boolean| Set during a deployment to true or false. Indicates if the version being deployed is earlier than the version in the target _Environment_.|
|${dep.same} | Set during a deployment to true or false. Indicates if the version being deployed is the same as the version in the target _Environment_.|
|$_Component_Object| The _Component_ being deployed.|
|$server Object| The _Endpoint_ the _Component_ is being deployed to.|
|$Application_Object| The_Application_ being deployed.|
|$Environment_Object| The_Environment_ being deployed to.|
|$_DropZone_Object| The _DropZone_ containing the files to be transferred to the _Endpoint_. |

### Post Action for _Component_

|  **Invocation Point**  |  **Available Objects and Variables** |
| --- | --- |
| $? Integer| The exit code of the _Component_ deployment.|
|${dep.rollforward} Boolean| Set during a deployment to true or false. Indicates if the version being deployed is later than the version in the target _Environment_.${dep.rollback} Boolean: Set during a deployment to true or false. Indicates if the version being deployed is earlier than the version in the target _Environment_.|
|${dep.same} Boolean| Set during a deployment to true or false. Indicates if the version being deployed is the same as the version in the target _Environment_.|
|$_Component_Object| The _Component_ being deployed.|
|$server Object| The _Endpoint_ the _Component_ is being deployed to.|
|$_Application_Object| The _Application_ being deployed.|
|$_Environment_Object| The _Environment_ being deployed to.|
|${dep.files} List| The files deployed for this _Component._|
|$_DropZone_Object| The _DropZone_ containing the files to be transferred to the _Endpoint_. |

### Custom Actions for a _Component_

|  **Invocation Point**  |  **Available Objects and Variables** |
| --- | --- |
| ${dep.rollforward} Boolean |Set during a deployment to true or false. Indicates if the version being deployed is later than the version in the target _Environment_.|
|${dep.rollback} Boolean |Set during a deployment to true or false. Indicates if the version being deployed is earlier than the version in the target _Environment_.|
|${dep.same} Boolean| Set during a deployment to true or false. Indicates if the version being deployed is the same as the version in the target _Environment_.|
$_Component_Object| The _Component_ being deployed.|
$server Object| The _Endpoint_ the _Component_ is being deployed to.|
$_Application_Object| The _Application_ being deployed.|
$_Environment_Object| The _Environment_ being deployed to. |

_DMScript_ can be invoked at various stages in the deployment process.

## Where to Execute DMScript

Given the deployment sequence described previously, you should place _DMScript_ here to achieve your desired results.

| If you want to… | DMScript goes here |
| --- | --- |
| Call an External Application to confirm that an Application can be deployed (e.g.: Service Desk etc). | Pre-Action to Application or Deploy Task. |
| Modify or remove files in a Drop Zone before Deployment. | Pre-Action to Component. |
| Modify a File on a Target Endpoint after Deployment. | Post-Action to Component. |
| Call an external tool to deploy a Component (i.e.: Ansible). | Custom Action to Component. |
| Notify an External Application that an Application has been deployed. | Post-Action to Application or Deploy Task. |
