---
title: "Try Catch Finally"
linkTitle: "Try Catch Finally"
weight: 110
description: >
  Execute a catch. 
---

A _try/catch/finally_ block with optional finally. Exceptions are not typed, so you can only have one catch. The _finallyblock_ is executed however the block finished - either normally or after the catch has been executed. Abort can be caught.

```bash
try {
 // code that can raise an exception

if ($a = 1) {

echo "a is 1 – bailing out";

abort; // this will raise an exception

}

echo "a was not 1";
 } catch(ex) {
 // ex will be ABORT (this is the exception)

echo "We aborted (a was 1)!";
 } finally {
 // this code always executes

echo "a was 1 or something else";
 }
```

Here is an example of catching a parse error when converting an XML document into an Array. If the try/catch were not in place, the parse error would throw an exception and end the script.

```bash~
set test="<a><b>hello</b><b>goodbye</b>";

try {

// This will fail as there is no closing </a> tag.

set jsonvals = ${test.xmlparse()};

} catch(ex) {

echo "exception caught!";

echo $ex;

}

echo "This code executes regardless of a parse error or not";
```
