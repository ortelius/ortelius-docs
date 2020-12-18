---
title: "To Json"
linkTitle: "To Json"
weight: 108
description: >
  Push files in the current DropZone to all Endpoints.
---

_transfer_ pushes the files in the current _DropZone_ to all the _Endpoint_s in the current _Endpoint_ set. transfer takes no parameters – all the files in the _DropZone_ are pushed to every _Endpoint_ in the current _Endpoint_ set. You can limit the _Endpoint_ set by placing the transfer in an if block to reduce the _Endpoint_ set to those matching the specified expression. You can also use remove to remove files from the _DropZone_ before calling transfer.

_transfer_ is generally only required when writing custom actions. It is called implicitly during a conventional deployment. A pre action on a _Component_ can be used to modify the drop zone before the _Component_ is deployed.

**Example:**
Checkout files and transfer them to all the _Endpoint_s in the current _Endpoint_ set.

```bash
checkout(repository: "myrep", pattern: "\*.exe");
transfer;
```
