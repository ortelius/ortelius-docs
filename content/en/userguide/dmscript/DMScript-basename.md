---
title: "basename"
linkTitle: "basename"
weight: 22
description: >
  Get the base file name of a specified  directory path.
---

_basename_ returns the base filename of a specified full directory path. You can specify an optional systemtype parameter to identify the type of system the path represents. If the systemtype is not specified then the system type is taken from the _Endpoint_ currently on the stack. If no _Endpoint_ is on the stack, an exception is thrown.

_basename_ is also a method that can be called on an _Endpoint_ object. In this case, the system type is taken from the _Endpoint_ itself.

**Usage:**

basename(path [,systemtype])

or

_Server_.basename(path)

**Returns:**

String: The filename taken from the specified path.

**Example:**

```bash

set res = basename("C:\temp\myfolder\myfile.txt,'windows'");

//

// res is myfile.txt

//

set res = basename('$2$DKA200:[FERDU01.TEST]vmsfile.txt','vms');

//

// res is vmsfile.txt

//

set unixserv = getserver('solaris1');

set res = ${unixserv.basename("/opt/myapp/mylib.so")};

// res is mylib.so
```

**See Also:**

dirname()
