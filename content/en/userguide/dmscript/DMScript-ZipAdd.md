---
title: "Zip Add"
linkTitle: "Zip Add"
weight: 128
description: >
 Add a file or group of files into a zip archive for the current DropZone.  
---

_zipadd_ adds a file (or a group of files) into a zip archive within the current _DropZone_. If the zip archive does not currently exist then zipadd will create it. WAR, JAR and EAR files are simply ZIP files with a different extension. You can thus use _zipadd_ (and _zipget_ and _zipdel_) with WAR, JAR and EAR files as well as with ZIP archives. This provides a powerful way of manipulating WAR, JAR and EAR files in the _DropZone_ before onward deployment to the target _Endpoint_(s).

_zipadd_ takes a mandatory named parameter. Other parameters can be specified depending on what is being added to the zipfile:

| Parameter| Description |
| --- | --- |
| zipfile: | Mandatory. The name of the zipfile in the _DropZone_ to which files should be added. The file is automatically created if it does not currently exist in the _DropZone_. |
| files: | Optional. If specified, refers to either an array or list of _DropZone_File objects. Each file in the array or list is added into the specified zipfile. If the file already exists in the zipfile, then it is automatically replaced. The filename added into the zipfile index is taken from the dzpath of the _DropZone_File object. Note: if the file referenced by the _DropZone_File object does not exist in the current _DropZone_, then a run-time error is thrown. |
| file: | Optional. If specified, refers to either a _DropZone_File object or a string giving the filename of a file within the current _DropZone_. If the file parameter refers to a _DropZone_File object, then the filename added is taken from the dzpath of that object. If the file parameter is a string, then it is taken to be a path to a file within the _DropZone_ (unless the stream parameter is also given). In either case, the specified file is added to the specified zipfile. If a file with the same name already exists in the zipfile then it is automatically replaced. If the file referenced does not exist in the current _DropZone_ (and stream is not specified), then a run-time error is thrown. |
| delete: | Optional. A Boolean flag indicating whether the specified file(s) should be removed from the _DropZone_ after they have been added to the zipfile. Defaults to false. If the delete flag is specified and is set to true then the file(s) are deleted from the _DropZone_ after they have been added to the zipfile. They will no longer be deployed to the _Endpoint_ in any subsequent transfer operation. |
| stream: | Optional. Only valid along with the file parameter. If specified, the file parameter should be a string and need not refer to a file in the _DropZone_. Instead, the file is created within the zipfile (with the name given by the file parameter) and its content is taken from the contents of the specified stream. |

**Examples***

Zip all the files in the _DropZone_ into a zip archive and remove them from the _DropZone_. If this is done as a pre-action to a _Component_ then the _Component_ will deploy a single zipfile and not the individual files that were checked out for the _Component_ items.

```bash
set dzfiles = ${_DropZone_.files};

zipadd(zipfile: "myapp.war", files: $dzfiles, delete: true);
```

**Examples:**

Create a "readme.txt" file and include it in the web archive to be deployed:

```bash
using stream $readme {

echo "This is _Application_ ${_Application_.name}";

echo "It uses the following _Component_s:";

set complist = ${_Application_._Component_s};

iterate(comp: $complist) {

echo "${comp.name}";

}

echo "It was deployed by ${user.name}";

}

//

// Assuming the _Component_ is webapp.war, add the README.TXT

// file to the root of the WAR file.

//

zipadd(zipfile: "webapp.war", file: "README.TXT", stream: $readme);
```
