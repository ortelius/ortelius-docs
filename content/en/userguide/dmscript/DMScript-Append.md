---
title: "Append"
linkTitle: "Append"
weight: 4
description: >
  Append one path to another.
---

_append_ appends one path to another formatting the paths according to the optional _systemtype_ parameter. If the system type is not specified, then the system type is taken from the _Endpoint_ currently on the stack. If no _Endpoint_ is on the stack, an exception is thrown.

_append_ is also a method that can be called on an _Endpoint_ object. In this case, the system type is taken from the _Endpoint_ itself.

### Usage

append(path1, path2 [, systemtype])

or

Server.append(path1,path2)

### Returns

String: The result of appending path2 to path1, formatted according to the specified systemtype or the system type of the _Endpoint_ object.

**Example:**

```bash

set res = append('/tmp', 'file.txt', 'unix');

//

// res is /tmp/file.txt
 //

set res = append(@'C:\Temp', 'file.txt', 'windows');

//

// res is C:\Temp\file.txt
 //

set res = append('$2$DKA200:[FERDU01]', 'file.txt', 'vms');

//

//res is $2$DKA200:[FERDU01]file.txt

//
```

See Also:

appendstd()
