---
title: "Delete"
linkTitle: "Delete"
weight: 42
description: >
  Remove a file or a directory from the DropZone.
---


_Delete_ removes a file or a directory from the _DropZone_. Any file or directory marked as deleted will not be transferred to the target _Endpoint_(s) in any subsequent deployment.

_delete_ takes the following optional named parameters:
| Parameter  | Description |
| --- | --- |
| file | Optional. The name of the file to be removed. |
| dir | Optional. The name of the directory to be removed. |

NOTE: A single file or dir parameter _must_ be specified.

**Example:**

```bash
Remove all files of zero length from the _DropZone_. If this is done in a pre-action to a _Component_, then no zero length file will be deployed to the _Endpoint_ even if they have been checked out from the repository:

set filelist = ${DropZone.files};

iterate(file: $filelist) {

echo "File size is ";

echo ${file.size};

if (${file.size} = 0) {

echo "Removing file ${file.dzpath}";

delete(file: ${file.dzpath});

}

}
```

**Example:**

```bash
 _Pre Action_ to a _Component_:

  Remove all files with a modification time prior to the time the _Component_ was last deployed to the _Endpoint_. If this removes all files, the _Component_ will not be deployed (since there are no files left in the _DropZone_). This allows you to set a _Component_ to "Deploy Always" and only push files that have been added to the _Component_ since it was last deployed.

if (${dep.same}) {

// We're deploying the same version of Application as currently

// on the Target Environment

psloop {

// for each Endpoint in the Environment…

set dt = ${server.deptime($Component)};

if ($dt) {

// This Component has previously been deployed to

// this Endpoint. Check the files and remove any

// that predate this deployment time

set filelist = ${DropZone.files};

iterate(file: $filelist) {

if (${file.mtime} < $dt) {

echo "Removing file $file";

delete(file: $file);

}

}

}

}

}
```
