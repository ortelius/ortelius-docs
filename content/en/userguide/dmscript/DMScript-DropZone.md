---
title: "DropZone Physicl Path"
linkTitle: "DropZone Physical Path"
weight: 46
description: >
 Get the DropZone physical path.
---

Returns the physical path to the named _DropZone_ on the deployment engine _Endpoint_. This is useful if an external script is going to be called which processes files in the _DropZone_.

**Usage:**

```bash
DropZone (dzname)

Where:

dzname: The name of the DropZone.

Returns:

String: The full path to the DropZone location.
```

**Example:**

```bash
checkout(DropZone: "meta14", repository: "rep1", pattern: '\*.java');

set dzloc = DropZone("metal4");

echo "DropZone location is $dzloc";


There is another way of getting a DropZone directory location. If you are in a using DropZone block then there is a _DropZone_ object on the stack. You can get the full path of this DropZone by using:

${_DropZone_.path}

which will return the same information. This is useful when using implicit DropZones (such as in a pre-action to a _Component_ when there is an $DropZone on the stack containing the files from the corresponding Component items).
```
