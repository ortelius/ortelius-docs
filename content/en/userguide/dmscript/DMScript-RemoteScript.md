---
title: "Remote Script"
linkTitle: "Remote Script"
weight: 90
description: >
  Execute a script on each remote Endpoint.
---


_Remotescript_ executes a script on each remote _Endpoint_ in the current server list. There are blocks that execute before and after the script is executed respectively. These blocks execute once for each _Endpoint_ in the current _Endpoint_ list.

During the execution, there is an implicit _serverloop_ (psloop). The _Endpoint_ object is pushed onto the stack, any "pre" block is executed, the specified script is then executed on the current remote _Endpoint_ and then any "post" block is executed. In the post block, the variable $? is set to the exit status of the script.

remotescript requires named parameters as follows:
| Parameter | Description |
| --- | --- |
| filepath | Mandatory: A full path to the script to be executed on the remote _Endpoint_. |
| params | Optional: A list of parameters to be passed to the script. |

**Example:**

Execute a script on each _Endpoint_ in the current target _Environment_:

```bash
remotescript(filepath: "/path/to/file");
```

**Example:**

Execute a script on each _Endpoint_ which has the attribute "ATT1" set to "Y":

```bash
if ($ATT1 = "Y") {

// This filters the current Endpoint list to those with //ATT1 set to Y. "remotescript" will now only execute on // those Endpoints.

remotescript(filepath: "/path/to/file");

}

```

**Example:**

Execute a script specific to each _Endpoint_ type within the _Environment_:

```bash
if (${server.type} = "windows") {

// Filters the _Endpoint_ list to those of type "windows"

remotescript(filepath: "C:\myapp\myscript.bat");

}

if (${server.type} = "unix") {

// Filters the _Endpoint_ list to those of type "unix"

remotescript(filepath: "/opt/scripts/myscript.sh");

}
```

**Example:**

Execute a script on each _Endpoint_ in the _Environment_, passing parameters:

```bash
set p = {"first\_param","$ATT"};

remotescript(filepath: "C:\myapp\myscript.bat", params: $p);

Example: Executing a script on each _Endpoint_ in the _Environment_, with pre and post block processing:

set p = {"first\_param","$ATT"};

remotescript(filepath: "C:\myapp\myscript.bat", params: $p) {

pre {

// pre block

echo "Running script on _Endpoint_ ${server.name}";

}

post {

// post block

echo "exit status is $?";

}

}
```

NOTE: An _Environment_ needs to be on the stack before the remotescript is executed. This sets the initial _Endpoint_ list. During a deployment (or if a stand-alone action is being invoked from a selected _Environment_) then the _Environment_ is on the stack and the _Endpoint_ list will be set to the members of that _Environment_. A runtime error will result if an _Environment_ cannot be found on the stack.
