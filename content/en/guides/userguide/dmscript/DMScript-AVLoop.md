---
title: "AVLoop"
linkTitle: "AVLoop"
weight: 14
description: >
  Create an Application Version Loop between any two versions on the Stack.
---

**_Avloop_** creates an _Application Version_ loop between any two versions of the _Application_ on the stack, iterating through all the intervening versions.

**NOTE:** There is always an "implicit" _avloop_ performed when deploying an _Application Version_ to an _Environment_. In this case, the loop runs from the _Application Version_ currently recorded as being on the target _Environment_ to the _Application Version_ being deployed. The variables ${dep.first}, ${dep.last}, ${dep.same}, ${dep.rollforward} and ${dep.rollback} are therefore available throughout the deployment process.

_avloop_ has optional named parameters. These are:

| Parameter | Description |
| --- | --- |
| _from_ | Indicates the _Application Version_ which should be used for the start of the loop. If this parameter is not present, Ortelius will look for the version of the _Application_ on the target _Environment_. The value of "from" can either be a string indicating the name of the version, or an _Application Version_ object.|
| _to_ | Indicates the _Application Version_ which should be used for the end of the loop. If this parameter is not present, Ortelius will use the _Application Version_ being deployed or the _Application Version_ on the stack. The value of "to" can either be a string indicating the name of the version or an _Application Version_ object.|
| Both _from_ and _to_ | If specified, must refer to versions of an _Application_ on the stack. If an _Application_ has been selected (for a deployment, approval or move for example) then the selected _Application_ will already be on the stack. The avloop _must_ refer to versions of this _Application_.

If you are running a stand-alone action, then you must select an _Application_ in order to push it onto the stack. Failure to do so will result in a run-time error ("No _Application_ on the Stack").

To use an _Application_ other than that selected, you can put the avloop in a "using _Application_" statement. This will push the specified _Application_ onto the stack.

Within the body of the loop, the following variables are set to indicate the status of the loop:

| **Variable Name**  |  **Value**  |
| --- | --- |
| ${dep.rollforward} | true if the "to" version is later than the "from" version, false otherwise. |
| ${dep.rollback} | true if the "to" version is earlier than the "from" version, false otherwise. |
| ${dep.first} | true if this is the first time through the loop (the _Application Version_ on the stack is the "from" version), false otherwise. |
| ${dep.last} | true if this is the last time through the loop (the _Application Version_ on the stack is the "to" version), false otherwise. |
| ${dep.same} | true if the "to" version is the same as the "from" version. |

_avloop_ will examine the _Application Version_ graph to determine the route between the two _Application Versions_. There has to be a direct route between the from and to versions in order for the avloop to execute successfully. If there is no direct route then a runtime exception is thrown.

For example, consider the following version graph:

**Example Using _Application_ Objects:**

```bash
using Application "ITguys" {

// Ensure DayOneApp is on the stack

set appfrom = getApplication("ITguys;1");

set appto = getApplication("ITguys;3");

if (${dep.rollforward}) {

echo "Rolling Forward";

} else {

echo "Rolling Back";

}

}

avloop(from: $appfrom, to: $appto)

{echo "${Application.name}}";

}//

// This will echo:

// Rolling Forward

// ITguys;1

// ITGuys;2

// ITGuys;3

//

```

**Example Using _Application Version_ Names:**

```bash
using Application "ITGuys" {

// Ensure ITGuys is on the stack

avloop(from: "ITGuys;3", to: "ITGuys;1") {

if (${dep.rollforward}) {

echo "Rolling Forward";

} else {

echo "Rolling Back";

}

echo "${_Application_.name}";

}

}

//

// This will echo:

// Rolling Back

// ITguys;3

// Rolling Back

// ITGuys;2

// Rolling Back

// ITGuys;1

//

Example: No Direct Path - Error

using _Application_ "ITGuys" {

// There is not direct path between version 1a

// and version 3 as they are on different branches

//

avloop(from: "ITGuys;1a", to: "ITGuys;3") {

if (${dep.rollforward}) {

echo "Rolling Forward";

} else {

echo "Rolling Back";

}

echo "${_Application_.name}";

}

}

//

// This will throw a Runtime Exception:

// There is no path between "ITGuys;1a" and "ITGuys;3"

//
```
