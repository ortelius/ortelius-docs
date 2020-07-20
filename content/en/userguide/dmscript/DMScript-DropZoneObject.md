---
title: "DropZone Object"
linkTitle: "DropZone Object"
weight: 48
description: >
 Get the DropZone Object. 
---

The _DropZone Object_ represents a _DropZone_. A _DropZone_ is an area on disk on the Ortelius Server where deployment artefacts are stored and manipulated before onward transmission to the target _Endpoint_(s). A _DropZone_ is placed onto the stack during a using _DropZone_ statement – all operations within this block have access to this _DropZone_ via the _DropZone Object_. A _DropZone Object_ is also present on the stack during pre and post action processing for a _Component_. In this case, the content of the _DropZone_ are the files checked out from the repository for the associated _Component_ Items.

The following properties can be accessed for a _DropZone_ object:

| **Property** | **Type** | **Description** |
| --- | --- | --- |
| name | String | _DropZone_ name. |
| path | String | The full path of the location on disk where the _DropZone_ is located. Useful for passing to external scripts that may need to manipulate files in the _DropZone_. |
| files | Array | An Array of _DropZone Object_, each one of which represents a file in the _DropZone_. The array is keyed by the full path name of the file. |

The following methods can be called on the _DropZone_ object:

| **Method** | **Return Type** | **Description** |
| --- | --- | --- |
| find(pattern) | Array | Returns an Array of _DropZone Object_, each one of which represents a file in the _DropZone_. The Array is restricted to files whose file name matches the specified pattern. The array is keyed by the full path name of the file. |
| dir() | String | The full path of the location on disk where the _DropZone_ is located. Equivalent to the path attribute. |

###
