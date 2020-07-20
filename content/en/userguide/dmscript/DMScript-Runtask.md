---
title: "Runtask"
linkTitle: "Runtask"
weight: 94
description: >
  Invoke a Task associated to a Domain.
---

_runtask_ allows _DMScript_ to invoke a task associated with a _Domain_. It allows tasks to be invoked via scripts, providing more opportunities for automation. Executing tasks via _DMScript_ allows you to:

<ul style="list-style-type: none;"><li>Automatically move an _Application Version_ from one Domain to Another</li>
<li> Approve an _Application Version_</li>
<li> Create a New _Application Version_ </li>
<li> Run a "Request" Task.</li></ul>

NOTE: _runtask_ cannot be used to run a Deploy Task. The invoking user must have _execute_ access to the task otherwise a runtime error occurs.

_runtask_ takes a mandatory named parameter. Other parameters can be specified depending on the task type:

|Parameter| Description|
| --- | --- |
| task | Mandatory. The name of the task to execute. The task name can be qualified with as many domain names as required to uniquely identify the task. |
| note | Optional String. For _Move_, _Approve_ and _Request_ Task Types. Specifies the free text "note" associated with the task execution. This note is included in the history entry and can be included in any attached notification (with the $NOTE variable). |
| approve | Optional Boolean. For _Approve_ Tasks only. If false (default) this represents a rejection. Specify true to ensure the _Application_ is marked as approved. |
| predecessor | Optional _Application_ Object. For _Create Version_ Tasks only. Specifies the parent _Application_ to be used for the newly created _Application_. |

_runtask_ is also useful for occasions where it may be required to suspend a deployment whilst a manual operation is performed. For example, it may be required to stop the deployment whilst a backup is taken of a target _Endpoint_. Once the backup is performed, the deployment can be allowed to continue. To do this, runtask can be used in combination with waitfor in order to implement a "wait for manual step". In this case, runtask executes a "request" task which is linked to a stand-alone task which confirms the manual step has been performed.

**Example:**

Execute an automatic approval following a successful deployment:

```bash
runtask(

task: "${_Application_.fqdomain}.Approve",

note: "This is an automated approval",

approve: true);
```

Here, the deployed _Application_'s fully qualified domain is prepended to the name of the task "Approve" in order to accurately identify the task regardless of where the _Application_ is in the Life Cycle.

NOTE: Tasks that operate on _Application_s require the _Application_ to be on the stack. During a deployment operation, the _Application_ will be on the stack and accessible via the $_Application_ object. If you are running a task outside of the deployment process you will need to push the _Application_ onto the stack by executing the task within a using _Application_ block. See _using Application_ later in this chapter for more information.

**Example:**
Send out a request for a manual step to be performed and suspend deployment:

```bash
runtask(task: "${_Application_.fqdomain}.Request Manual Step");

waitfor(task: "${_Application_.fqdomain}.Manual Step Performed");
```

Here, DMscript calls the task "Request Manual Step". This is a "request" task linked to the "Manual Step Performed" task. When this task is invoked, Ortelius will issue the notification to the users in the group who have execute access to the "Manual Step Performed" task and place the request to execute this task into those users' _To Do_ list on their home page.

The script will then call _waitfor_ which will suspend the script execution until the "Manual Step Performed" task is run. At which point the script will continue automatically.
