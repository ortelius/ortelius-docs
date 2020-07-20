---
title: "XML Parse"
linkTitle: "While Loops"
weight: 124
description: >
 Parse an XML String. 
---

_xmlparse_ operates on a String. If the string contains valid XML data, then this is converted into a _DMScript_ array. The following rules are applied:

- XML tags are converted to keys in the array
- The value associated with the key is the content of the XML tag (that is, the data between the opening and closing tags). If the tag is self-closing (i.e. like \<this /\>) then the value is a null length string.
- If the tag contains nested tags, then the value is another array containing the values. This occurs recursively to any depth.
- Any repeating tag causes the value to become a list
- Any attributes in the tag are created as an array with the key being the tag name (preceded by a @ character) and the value being the value of the attribute.

**Usage:**

_String_.xmlparse()

or

xmlparse(string)

**Returns:**

Array: An encoded version of the passed XML string.

**Examples:**

```bash
_Parse an XML document and process it with DMScript:_

using stream $xmlstr {

echo "\<demo\>";

echo "\<employees dept=\"west\"\>";

echo "\<employee\>";

echo "\<given\>Mark\</given\>";

echo "\<surname\>Smith\</surname\>";

echo "\</employee\>";

echo "\<employee\>";

echo "\<given\>Peter\</given\>";

echo "\<surname\>Jones\</surname\>";

echo "\</employee\>";

echo "\<employee\>";

echo "\<given\>Kevin\</given\>";

echo "\<surname\>Doe\</surname\>";

echo "\</employee\>";

echo "\</employees\>";

echo "\</demo\>";

}

set parsed = ${xmlstr.xmlparse()}; // convert to Array

echo "parsed is ${parsed.to\_json()}"; // Output the array as JSON

set employees = ${parsed.demo.employees.employee};

echo "Employees:";

// Loop through the employee records in the array

for (i=0;$i\<${employees.length()};i=$i+1) {

echo "${employees[$i].given} ${employees[$i].surname}";

}

Result:

parsed is {"demo":{"employees":{"@dept":"west","employee":[{"surname":"Smith","given":"Mark"},{"surname":"Jones","given":"Peter"},{"surname":"Doe","given":"Kevin"}]}}}

Employees:

Mark Smith

Peter Jones

Kevin Doe
```

Since the \<employee\> tag repeats, xmlparse turns this repeating tag into a single list of arrays, each holding an employee record (given name and surname).

The line:

```bash
set employees = ${parsed.demo.employees.employee};

sets employees to be a list of these employee records. The number of employee records is given by:

${employees.length()}
```

We can therefore loop through each record like this:

```bash
for (i=0;$i\<${employees.length()};i=$i+1) {

echo "${employees[$i].given} ${employees[$i].surname}";

}
```

Which outputs each employee's given name and surname.

_xmlparse_ is useful when calling external SOAP based APIs which may return embedded XML strings which need to be parsed before processing. See soap in this chapter for an example.

_xmlparse_ will throw an exception if the passed XML cannot be parsed for any reason. This will normally stop the script. You can use try/catch to catch such exceptions:

```bash
set test="\<a\>\<b\>hello\</b\>\<b\>goodbye\</b\>";

try {

// This will fail as there is no closing \</a\> tag.

set jsonvals = ${test.xmlparse()};

} catch(ex) {

echo "exception caught!";

echo $ex;

}
```
