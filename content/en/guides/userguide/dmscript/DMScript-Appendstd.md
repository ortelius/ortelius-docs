---
title: "Appendstd"
linkTitle: "Appendstd"
weight: 6
description: >
  Append one path to another with directory sperators.
---

_appendstd_ appends one path to another formatting the resulting path according to the optional systemtype parameter. If the systemtype is not specified then the system type is taken from the _Endpoint_ currently on the stack. If no _Endpoint_ is on the stack, an exception is thrown.

_appendstd_ is also a method that can be called on an _Endpoint_ object. In this case, the system type is taken from the _Endpoint_ itself.

_appendstd_ differs from append since it ensures that the directory separator chars are appropriate to the system type regardless of how they are formatted in the passed paths.

**Usage:**

appendstd(path1, path2 [, systemtype])

or

Server.appendstd(path1,path2)

**Returns:**

String: The result of appending path2 to path1, formatted according to the specified systemtype or the system type of the _Endpoint_ object.

**Example:**

```bash
set res = appendstd(@'C:\Temp', 'folder/file.txt', 'windows');

//

// res is C:\Temp\folder\file.txt

// separator char has been modified for windows _Endpoint_s.

//

set res = appendstd('$2$DKA200:[FERDU01]', 'TEST/file.txt', 'vms');

//

// res is $2$DKA200:[FERDU01.TEST]file.txt

//
```

**See Also:**

append()
