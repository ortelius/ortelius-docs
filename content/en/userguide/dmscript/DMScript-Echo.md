---
title: "Echo"
linkTitle: "Echo"
weight: 50
description: >
 Echo an expression.
---

The _Echo_ command simply echoes the expression that follows to the output. If the _DMScript_ is being run as part of a deployment then the output from the echo is included in the deployment log.

If the _DMScript_ is being run as part of a task (either a pre or post action on an existing task or as a stand-alone task) then the output will normally be lost. To ensure the output is visible, check the "Show Output" option on the task. This will open a dialog box after the task exits with the content of the _DMScript_ output (including any echoed text).

You can redirect the output of the echo to a stream. A stream is a block of data which you can manipulate using _DMScript_ (search it, save it as a file, convert it to base64 etc.). To redirect the output of the echo to a stream, use the >> redirect operator.

**Example:**

```bash
set a=10;

echo $a; // writes 10 to the output

echo $a >> $mystream; // appends "10" to mystream

```

You can use "using stream" to redirect every echo within the associated block to the desired stream.

**Example:**

```bash

set a=10;

set b=20;

using stream $mystream {

echo $a;

echo $b;

}

This will produce no output but the stream "mystream" will contain 10 followed by a newline and 20.
```
