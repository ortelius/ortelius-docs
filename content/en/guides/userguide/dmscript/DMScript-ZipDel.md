---
title: "Zip Delete"
linkTitle: "Zip Delete"
weight: 128
description: >
 Delete a file or group of files from a zip archive for the current DropZone.
---

_zipdel_ removes files from the specified zipfile. WAR, JAR and EAR files are simply ZIP files with a different extension. You can thus use _zipdel_ (and _zipadd_ and _zipget_) with WAR, JAR and EAR files as well as with ZIP archives. This provides a powerful way of manipulating WAR, JAR and EAR files in the _DropZone_ before onward deployment to the target _Endpoints_.

_zipdel_ takes a mandatory named parameter. Other parameters can be specified depending on how the files are being removed from the zipfile:

| Parameter | Description |
| --- | --- |
| zipfile: | Mandatory. The name of the zipfile in the _DropZone_ from which files should be deleted. If the specified file does not exist in the _DropZone_, a run time error is thrown. |
| files: | Optional. If specified, refers to either an array or list of _DropZone_File objects. Each file in the array or list is deleted from the specified zipfile. The filename deleted from the zipfile is taken from the dzpath of the _DropZone_File object. Note: if the file referenced by the _DropZone_File object does not exist in the specified zipfile, then a run-time error is thrown. |
| file: | Optional. If specified, refers to either a _DropZone_File object or a string giving the name of a file to delete from the zipfile. If the file parameter refers to a _DropZone_File object, then the filename used is taken from the dzpath of that object. If the file parameter is a string, then it is taken to be a path to a file within the zipfile. In either case, the specified file is deleted from the specified zipfile. If the file referenced does not exist in the zipfile then a run-time error is thrown. |

NOTE: You can call dir() on a _DropZone_File object representing a zipfile to return an array of _DropZone_File objects that you can then pass to zipdel.

**Examples:**

```bash
Remove an unused library from a WAR file:

zipdel(zipfile: "myapp.war", file: "WEB-INF/lib/asm-5.0.3.jar");
```

```bash
Remove all txt files from a web archive:

// get a list of myapp.war files in the _DropZone_ (probably only one)

set warfilearr = ${_DropZone_.find("myapp.war")};

// Need to iterate since find returns an array keyed by filename.

// However, if there's only one "myapp.war", this will only execute once.

iterate(warfile: $warfilearr) {

// get list of files in myapp.war

set files = ${warfile.dir()};

// filter the list to only include txt files.

set files = files.filter("[.]txt$");

// Now delete all those files

zipdel(zipfile: "myapp.war", files: $files);

}
```
