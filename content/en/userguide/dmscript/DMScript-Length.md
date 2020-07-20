---
title: "Length"
linkTitle: "Length"
weight: 76
description: >
  Get the length of the associated object.  
---

length returns a number indicating the length of the associated object. When called with a String it returns the number of characters in the string. When called from an Array it returns the number of elements in the Array. When called with a Stream it returns the size of the Stream in bytes.

**Usage:**

String.length()

Or

length(String)

Array.length()

Or

length(Array)

Stream.length()

Or

length(Stream)

**Returns:**

Integer representing the number of characters (String), elements (Array) or bytes (Stream) in the passed object.

**Examples:**

set mystr="Hello There";

echo "String length is ${mystr.length()}";

set list={"a", "b", "c"};

echo "Array length is ${list.length()}";

using _DropZone_ "temp" {

checkout(repository: "Openmake\_Demo.demorep2",pattern: "demo1.zip");

set filelist = ${_DropZone_.files};

echo "file size = ${filelist['demo1.zip'].size}";

using stream $mystream {

read(file: "demo1.zip");

}

echo "stream size is ${mystream.length()}";

}

Result:

String length is 11

Array length is 3

INFO: Checked out demo1.zip;0

file size = 36675

stream size is 36675

**See Also:**

substr(), regsub(), sum()
