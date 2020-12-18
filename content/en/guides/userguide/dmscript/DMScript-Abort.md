---
title: "Abort"
linkTitle: "Abort"
weight: 3
description: >
  Using _abort_ to end a script execution.
---

_abort_ throws an exception, which would normally end a script execution. It can take an optional message which Ortelius will issue when the script ends. _abort_ is typically used when a condition prevents the rest of the script from executing correctly. _abort_ takes a single, named parameter:

msg: The message to print on abort. If msg is not specified, the msg defaults to ABORT.

It can be caught with a try/catch block so you can break out of a block of code whilst still allowing the script to execute.

**Example:**

```bash
abort(msg: "Something went wrong");

This will end the script with the message "Something went wrong".

abort;

This will end the script with the message "ABORT"

try {

echo "About to abort";

abort(msg: "Custom Message");

echo "This will never execute";

} catch (ex) {

echo "Error: $ex";

}

echo "Carry on";
```bash

Result:

```bash
About to abort
Error: Custom Message
Carry on
```
