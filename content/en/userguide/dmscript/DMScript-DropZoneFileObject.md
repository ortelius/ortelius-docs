---
title: "DropZone File Object"
linkTitle: "DropZone File Object"
weight: 47
description: >
 Get the DropZone File Object. 
---

The _DropZone File Object_ represents a file in the _DropZone_. It can be retrieved from the _DropZone_ object via the files property or the find method. Both of these calls return an array of _DropZone File Objects_, keyed on the filename. You can also call dir() on a _DropZone File Object_ that represents a zipfile to get an array of _DropZone File Objects_ representing the zipfile content.

The following properties can be accessed for a _DropZone File Object_:

| **Property** | **Type** | **Description** |
| --- | --- | --- |
| dzpath | String | The relative path of the file in the _DropZone_. |
| repopath | String | The relative path of the file as located in the Repository (this path is relative to the base directory of the repository). |
| size | Integer | The size of the file in bytes. |
| ctime | Date | The creation time of the file. |
| mtime | Date | The modified time of the file. |

The following methods can be called on the _DropZone_File object:

| **Method** | **Return Type** | **Description** |
| --- | --- | --- |
| delete() | Integer | Removes the file represented by the _DropZone File Object_ from the _DropZone_. After this operation the file will no longer be transferred to the target server in any subsequent transfer operation. Returns 1 (true) if the file was successfully removed, 0 otherwise. |
| dir() | Array | If the _DropZone File Object_ refers to a zipfile (including web archive files such as WAR, JAR, EAR) then dir() will return an array of _DropZone File Objects_ which represent the content of the zipfile. The array is keyed by the filename and can be used as input to the zipget and zipdel statements. |

NOTE: See also the description for zipadd, zipget and zipdel.
