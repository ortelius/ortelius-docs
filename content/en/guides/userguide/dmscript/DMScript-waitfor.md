---
title: "Wait For"
linkTitle: "Wait For"
weight: 120
description: >
  Suspend a script execution.
---


waitfor suspends script execution until the specified task has been run against the _Application_ on the stack. It is typically used to suspend a deployment until such time as a manual step has been performed (for example: backing up a database).

waitfor takes a mandatory named parameter:

task: Mandatory. The name of the task to wait for. The task name can be qualified with as many domain names as required to uniquely identify the task. The task _must_ previously have been requested via a _Request Task_.

When waitfor executes, the script suspends waiting for the named task to be run against the _Application_ that is currently on the stack. The task _has_ to be executed _after_ the deployment has been started. If the task has been executed _before_ the deployment started, it will need to be executed again. Once the task has been executed, waitfor will return and the rest of the script will continue.

NOTE: The task that is waited for _must_ have been requested to be executed via a _request task_. This is because _DMScript_ monitors the "requested task" list, waiting for the named task to be removed from this list.

waitfor can only be executed during a deployment process. This is because it uses the start time of the deployment to determine whether the waitfor task has been executed after the deployment start time.

An _Application_ object _must_ be on the stack. The waitfor task has to be executed against this _Application_ in order for waitfor to return.

Example:

Send out a request for a manual step to be performed and suspend deployment:

runtask(task: "${_Application_.fqdomain}.Request Manual Step");

waitfor(task: "${_Application_.fqdomain}.Manual Step Performed");

Here, DMscript calls the task "Request Manual Step". This is a "request" task linked to the "Manual Step Performed" task. When this task is invoked, Ortelius will issue the notification to the users in the group who have execute access to the "Manual Step Performed" task and place the request to execute this task into those users' _To Do_ list on their home page.

The script will then call waitfor which suspends the script execution until the "Manual Step Performed" task is run. At which point the script will continue automatically.
