---
title: "Rename"
linkTitle: "Rename"
weight: 91
description: >
  Change a file name in the DropZone. 
---


_Rename_ changes a file name in the _DropZone_. When the file is transferred to the target _Endpoint(s)_ (either via an explicit transfer call or via an implicit deployment) it will be given the new name.

_rename_ takes three named parameters:

| Parameter | Description |
| --- | --- |
| from | Mandatory. The name of the file to be renamed. |
| to | Mandatory. The new name for the file. |
| serverspecific | Optional. A Boolean value (true/false) that indicates that the file should be renamed for each target _Endpoint_. Defaults to false. Set this parameter to true should the new name include a value associated with an _Endpoint_. |

**Example:**

```bash
Rename a file before it's deployed:

rename(from: "config.txt", to: "config.xml");

Example: Create a file named for each _Endpoint_:

rename(from: "config.txt", to: "${server.name}\_config.xml",

serverspecific: true);

If the target _Endpoint_s are server1 and server2 then server1 will receive the config.txt renamed to server1\_config.xml and server2 will receivethe config.txt renamed to server2\_config.xml.
```
