---
title: "Stdpath"
linkTitle: "Stdpath"
weight: 101
description: >
  Get a host path converted into a standard format.
---

Returns a host path converted to the standardized format using the optional systemtype parameter **.** If the systemtype is not specified then the system type is taken from the _Endpoint_ currently on the stack. If no _Endpoint_ is on the stack, an exception is thrown.

stdpath is also a method that can be called on a _Endpoint_ object. In this case, the system type is taken from the _Endpoint_ itself.

**Usage:**

stdpath(path [,systemtype])

or

_Server_.stdpath(path)

**Returns:**

String: The path converted to the format used by the specified systemtype.

**Example**

```bash
set res = stdpath('/tmp/file.txt', 'unix');

// res is /tmp/file.txt

set res = stdpath(@'C:\Temp\file.txt', 'windows');

// res is /Temp/file.txt

set res = stdpath('$2$DKA200:[FERDU01.TEST]file.txt', 'vms');

// res is /FERDU01/TEST/file.txt
```
