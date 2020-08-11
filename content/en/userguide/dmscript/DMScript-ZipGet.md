---
title: "Zip Get"
linkTitle: "Zip Get"
weight: 130
description: >
 Get a file or group of files from a zip archive for the current DropZone.
---

_zipget_ extracts a file from the specified zipfile and places it into the current _DropZone_. Unless it is subsequently removed, the file will be deployed to the appropriate _Endpoint_(s) in any subsequent transfer operation. WAR, JAR and EAR files are simply ZIP files with a different extension. You can thus use _zipget_ (and _zipadd_ and _zipdel_) with WAR, JAR and EAR files as well as with ZIP archives. This provides a powerful way of manipulating WAR, JAR and EAR files in the _DropZone_ before onward deployment to the target _Endpoints_.

_zipget_ is useful for extracting a file from a zip archive, modifying the file and then replacing the original version of the file in the archive with _zipadd_. You can use a combination of _zipget_ and _zipadd_ to manipulate XML configuration files that are embedded in a web archive.

_zipget_ takes a mandatory named parameter. Other parameters can be specified depending on what is being extracted from the zipfile:

|Parameter|Description|
|---|---|
| zipfile | Mandatory. The name of the zipfile in the _DropZone_ from which files should be extracted. If the specified file does not exist in the _DropZone_, a run time error is thrown. |
| files | Optional. If specified, refers to either an array or list of _DropZone File_ objects. Each file in the array or list is extracted from the specified zipfile and placed into the drop zone. The filename extracted from the zipfile is taken from the dzpath of the _DropZone File_ object. Note: if the file referenced by the _DropZone File_ object does not exist in the specified zipfile, then a run-time error is thrown. |
| file | Optional. If specified, refers to either a _DropZone File_ object or a string giving the name of a file to extract from the zipfile. If the file parameter refers to a _DropZone File_ object, then the filename used is taken from the dzpath of that object. If the file parameter is a string, then it is taken to be a path to a file within the zipfile. In either case, the specified file is extracted from the specified zipfile and placed into the drop zone. If a file with the same name already exists in the drop zone then it is automatically replaced. If the file referenced does not exist in the zipfile then a run-time error is thrown. |

NOTE: You can call dir() on a _DropZone File_ object representing a zipfile to return an array of _DropZone File_ objects that you can then pass to zipget.

**Examples:**

Extract all the files in a zipfile:

```bash
// get a list of myapp.war files in the _DropZone_ (probably only one)

set warfilearr = ${_DropZone_.find("myapp.war")};

// Need to iterate since find returns an array keyed by filename.

// However, if there's only one "myapp.war", this will only execute once.

iterate(warfile: $warfilearr) {

// get list of files in myapp.war

set files = ${warfile.dir()};

// Now extract all those files

zipget(zipfile: "myapp.war", files: $files);

}
```

**Examples:**

 Modify a configuration file within a WAR file

```bash
// Step 1 – extract web.xml from the WAR file

//

zipget(zipfile: "mywapp.war", file: "web.xml");

// Step 2 - Set the ODBC connection string to the correct value for

// the target _Environment_. Note DBSTRING will be on the stack and is

// _Environment_ specific.

//

modify(file: 'web.xml', modifier: "xml") {

set\_attribute(

xpath: "/web-app/context-param/[@param-name=DBConnectionString]/@param-value",

value: $DBSTRING);

}

// Step 3 – put the modified web.xml file back in the WAR file. Remove the

// modified file from the _DropZone_ so we don't end up deploying it.

//

zipadd(zipfile: "myapp.war", file: "web.xml", delete: true);
```
