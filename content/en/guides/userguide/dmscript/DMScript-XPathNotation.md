---
title: "Xpath Notation"
linkTitle: "Xpath Notation"
weight: 126
description: >
 Identify the elements to change in an XML document.
---

_Xpath notation_ supports subset of xpath notation to identify the elements to change in an XML document. The following restrictions apply:

- All parent elements must be identified using a full path, starting from the root node.
- Wildcards are not permitted.
- The "|" operator is not permitted to select multiple elements.

The following are valid xpath descriptors for Ortelius:
| Descriptor | Description|
| --- | --- |
| /root/branch/element | All elements under branch. |
| /root/branch/element[2] | The 2nd element under branch. |
| /root/branch/element[@attr] | Every element under branch containing the named attribute. |
| /root/branch/element[@attr=val] | Every element under branch with the specified attribute set to the named value. |
| /root/branch/element[last()] | The last element under branch. |
| /root/branch/element[last()-1] | The penultimate element under branch. |
| /root/branch/element[position()\>1] | Every element under branch apart from the first one. |
| /root/branch/element[position()\<3] | The first two elements under branch. |
|

The statements that can be included in the modify statement block are listed below:

## Text\_replace

This statement can only be included if the modifier parameter in the parent modify statement is set to "text". It is used to replace one string with another in the file specified by the file parameter in the parent modify statement.

_text\_replace_ takes two mandatory and one optional named parameter:
| Parameter| Description|
| --- | --- |
| find | The string to locate in the source file. This is a _regular expression_. Mandatory. |
| replace | The string which will replace all occurrences of the find string in the source file. Mandatory. |
| line | Boolean (true/false). Optional - defaults to false. If present and set to true, sets _text\_replace_ into _line processing_ mode – each line of the file is read and processed individually. This is useful when using regular expressions to process beginning and ends of lines. |

### Example

 Assuming we have a file called "config.txt" which looks like this:

```bash
Stack: \_STACK\_

Memory: \_MEMORY\_

Restart: Yes

Replace the placeholders \_STACK\_ and \_MEMORY\_ with the value of attributes stored against the target _Environment_:

modify(file: 'config.txt', modifier: "text") {

text\_replace(find: "\_STACK\_", replace: "$STACK");

text\_replace(find: "\_MEMORY\_", replace: "$MEMORY");

}
```

STACK and MEMORY are attributes held against the different target _Environment_s. This ensures that the config.txt file is changed to reflect the values specific to that _Environment_.

If STACK and MEMORY are attributes held against each _Endpoint_, you can make a _Endpoint_-specific copy of the config.txt file. In this case, each _Endpoint_ will receive its own copy of the config.txt file, modified according to its own attributes.

```bash
modify(file: 'config.txt', modifier: "text", endpointspecific: true) {

text\_replace(find: "\_STACK\_", replace: "$STACK");

text\_replace(find: "\_MEMORY\_", replace: "$MEMORY");

}
```

In this case, an implicit loop is performed for each _Endpoint_ in the current _Endpoint_ list. This pushes each _Endpoint_ in turn (along with its _Endpoint_ attributes STACK and MEMORY) onto the stack. The file is then modified and a copy taken for each _Endpoint_. During a subsequent deployment, the version of the file specific to each _Endpoint_ is deployed, so each _Endpoint_ gets its own copy of the file with STACK and MEMORY set appropriately.

### Examples

Add an extra line to the end of the file:

```bash
modify(file: 'config.txt', modifier: "text") {

text\_replace(find: "\_STACK\_", replace: "$STACK");

text\_replace(find: "\_MEMORY\_", replace: "$MEMORY");

text\_replace(find: '$', value: "MaxDisk: $MAXDISK");

}
```

As we have not specified line processing mode, the regular expression $ refers to the end of the file. The new config directive is then added at the end of the file. Note we use single quotes around the regular expression to avoid Ortelius trying to expand the $.

Assuming MAXDISK is set to 20G in the targeted _Environment_ the result will be something like:

```bash
Stack: 128M

Memory: 1024M

Restart: Yes

MaxDisk: 20G
```

### Examples

 Add an entry to the start of the file:

```bash
modify(file: 'trans.txt', modifier: "text", serverspecific:true) {

text\_replace(find: "\_STACK\_", replace: "$STACK");

text\_replace(find: "\_MEMORY\_", replace: "$MEMORY");

text\_replace(find: '^', replace: "MaxDisk: $MAXDISK");

}
```

As we have not specified line processing mode, the regular expression ^ refers to the beginning of the file. The new config directive is then added at the end of the file.

Assuming MAXDISK is set to 20G in the targeted _Environment_ the result will be something like:

```bash
MaxDisk: 20G

Stack: 128M

Memory: 1024M

Restart: Yes

Example: Use line processing mode to add an automatic comment to every line. This uses the regular expression substitution markers "(" and ")" and replaces them in the target string by using \1, \2 etc.

modify(file: 'config.txt', modifier: "text", serverspecific: true) {

text\_replace(find: "\_STACK\_", replace: "$STACK");

text\_replace(find: "\_MEMORY\_", replace: "$MEMORY");

text\_replace(

find: '^(.\*): (.\*)$',

replace: "\1: \2 // set \1 to \2",

line: true);

}

Result:

Stack: 128M // set Stack to 128M

Memory: 1024M // set Memory to 1024M

Restart: Yes // set Restarts to Yes
```

## Set\_Text

_Set\_text_ can only be included if the modifier parameter in the parent modify statement is set to "xml". It is used to set the text of the specified XML element(s).

_set\_text_ takes two named parameters:

| xpath | An xpath descriptor indicating the location(s) in the XML document of the element(s) to be modified. |
| --- | --- |
| value | The value of the text to add to the element(s). |

### Examples

 Given an input file "servers.xml" that looks like this:

```bash
\<Ortelius\>

\<server name="server1" type="unix" /\>

\<server name="server2" type="windows" /\>

\<server name="server3" type="as400" /\>

\</Ortelius\>

Set text for each server:

modify(file: 'servers.xml', modifier: "xml") {

set\_text(xpath: "/Ortelius/server", value: "server\_text");

}

Result:

\<Ortelius\>

\<server name="server1" type="unix"\>server\_text\</server\>

\<server name="server2" type="windows"\>server\_text\</server\>

\<server name="server3" type="as400"\>server\_text\</server\>

\</Ortelius\>
```~

NOTE: If the selected element(s) already have text, then that text is replaced by the _set\_text_ operation.

### Examples

```bash
Set text for _Endpoints_ of type "windows":

modify(file: 'testfile.xml', modifier: "xml") {

set\_text(xpath: "/openmake/server[@type=windows]",

value: "server\_text");

}

Result:

\<Ortelius\>

\<server name="server1" type="unix" /\>

\<server name="server2" type="windows"\>server\_text\</server\>

\<server name="server3" type="as400" /\>

\</Ortelius\>
```

## Add\_element

This statement can only be included if the modifier parameter in the parent modify statement is set to "xml". It is used to add an XML element into an XML document.

_add\_element_ takes three named parameters:

| Parameter | Description|
| --- | --- |
| xpath | An xpath descriptor indicating the location(s) in the XML document where the element is to be inserted. |
| pos | A string indicating the position of the insert location relative to the xpath. Is one of: |
| "before" | The specified element is added before the element identified by the xpath. |
| "after" | The specified element is added after the element identified by the xpath. |
| "inside" | The specified element is added inside the element identified by the xpath. |
| element | The element to insert. Must be in XML syntax. |

### Examples

 Given an input file "servers.xml" that looks like this:

```bash
\<Ortelius\>

\<server name="server1" type="unix" /\>

\<server name="server2" type="windows" /\>

\<server name="server3" type="as400" /\>

\</Ortelius\>

Add a "_Component_" element to each _Endpoint_:

modify(file: 'servers.xml', modifier: "xml") {

add\_element(xpath: "/Ortelius/server",

pos: "inside", value: '\<_Component_ name="mycomp" /\>');

}

Result:

\<Ortelius\>

\<server name="server1" type="unix"\>

\<_Component_ name="mycomp" /\>

\</server\>

\<server name="server2" type="windows"\>

\<_Component_ name="mycomp" /\>

\</server\>

\<server name="server3" type="as400"\>

\<_Component_ name="mycomp" /\>

\</server\>

\</Ortelius\>
```

### Examples

Add a "_Component_" element to the second "server" element:

```bash
modify(file: 'servers.xml', modifier: "xml") {

add\_element(xpath: "/Ortelius/server[2]",

pos: "inside", value: '\<_Component_ name="mycomp" /\>');

}

Result:

\<Ortelius\>

\<server name="server1" type="unix" /\>

\<server name="server2" type="windows"\>

\<_Component_ name="mycomp" /\>

\</server\>

\<server name="server3" type="as400" /\>

\</Ortelius\>
```

### Examples

Add a "_Component_" element to each server of type "unix":

```bash
modify(file: 'servers.xml', modifier: "xml") {

add\_element(xpath: '/Ortelius/server[@type=unix]',

pos: "inside", value: '\<_Component_ name="mycomp" /\>');

}

Result:

\<Ortelius\>

\<server name="server1" type="unix"\>

\<_Component_ name="mycomp" /\>

\</server\>

\<server name="server2" type="windows" /\>

\<server name="server3" type="as400" /\>

\</Ortelius\>
```

### Examples

Add different _Component_ elements to _Endpoints_ of specific types:

```bash
modify(file: 'servers.xml', modifier: "xml") {

add\_element(xpath: '/Ortelius/server[@type=unix]',

pos: "inside", value: '\<_Component_ name="mycomp1" /\>');

add\_element(xpath: '/Ortelius/server[@type=windows]',

pos: "inside", value: '\<_Component_ name="mycomp2" /\>');

}

Result:

\<Ortelius\>

\<server name="server1" type="unix"\>

\<_Component_ name="mycomp1" /\>

\</server\>

\<server name="server2" type="windows"\>

\<_Component_ name="mycomp2" /\>

\</server\>

\<server name="server3" type="as400" /\>

\</ Ortelius\>
```

### Examples

 Add a new "server" element:

```bash
modify(file: 'servers.xml', modifier: "xml") {

add\_element(xpath: "/Ortelius /server[last()]",

pos: "after",

value: '\<server name="server4" type="windows" /\>');

}

Result:

\<Ortelius\>

\<server name="server1" type="unix" /\>

\<server name="server2" type="windows" /\>

\<server name="server3" type="as400" /\>

\<server name="server4" type="windows" /\>

\</Ortelius\>
```

### Examples

 Add a "_Component_" element to every _Endpoint_ apart from the first one.

```bash
modify(file: 'servers.xml', modifier: "xml") {

add\_element(xpath: "/Ortelius/server[position()\>1]",

pos: "inside", value: '\<_Component_ name="mycomp" /\>');

}

Result:

\<Ortelius\>

\<server name="server1" type="unix" /\>

\<server name="server2" type="windows"\>

\<_Component_ name="mycomp" /\>

\</server\>

\<server name="server3" type="as400"\>

\<_Component_ name="mycomp" /\>

\</server\>

\</Ortelius\>
```

### Examples

Create an entry specific for each _Endpoint_ in the targeted _Environment_.

```bash
modify(file: 'servers.xml', modifier: "xml", serverspecific: true) {

add\_element(xpath: "/Ortelius/server[last()]",

pos: "after",

value: "\<server name='${server.name}'"

" type='${server.type}' /\>");

}
```

### Examples

This example shows several techniques:

1. The serverspecific flag performs an implicit loop through all the _Endpoints_ in the current _Endpoint_ list.
1. A copy of the servers.xml file is taken for each _Endpoint._
1. Each _Endpoint_-specific copy of the servers.xml file is modified to insert an element specific to that _Endpoint_ (in this case including its name and type taken from the $server object.
1. Note the value string is made up of two concatenated strings.
1. The value string is surrounded by double quotes in order that variable expansion (of the $server attributes name and type) can occur. To ensure the XML is syntactically correct, the values are surrounded by single quotes. This will not prevent variable expansion because the single quotes are effectively "escaped" by the surrounding double quotes (this is identical to the way Linux/Unix shells perform expansion). The XML parser will substitute double quotes.

```bash
Result:

Transferred to _Endpoint_ "midtier1":

\<Ortelius\>

\<server name="server1" type="unix" /\>

\<server name="server2" type="windows" /\>

\<server name="server3" type="as400" /\>

\<server name="midtier1" type="unix" /\>

\</Ortelius\>

Transferred to _Endpoint_ "fronttier1":

\<Ortelius\>

\<server name="server1" type="unix" /\>

\<server name="server2" type="windows" /\>

\<server name="server3" type="as400" /\>

\<server name="fronttier1" type="windows" /\>

\</Ortelius\>

```

## Set\_attribute

This statement can only be included if the modifier parameter in the parent modify statement is set to "xml". It is used to modify or create an attribute in specified element(s) in an XML document.

_set\_attribute_ takes two named parameters:
| Parameter| Description|
| --- | --- |
| xpath | An xpath descriptor indicating the location(s) of the element and the attribute to modify. |
| value | The new value for the specified attribute in the selected element(s). |

NOTE:The xpath must specify an attribute using @ syntax – see examples below.

### Examples

Given an input file "servers.xml" that looks like this:

```bash
\<Ortelius\>

\<server name="server1" type="unix" /\>

\<server name="server2" type="windows" /\>

\<server name="server3" type="as400" /\>

\</Ortelius\>

Change server2 to be of type "unix":

modify(file: 'servers.xml', modifier: "xml") {

set\_attribute(xpath: "/Ortelius/server[@name=server2]/@type",

value: "unix");

}

Result:

\<Ortelius\>

\<server name="server1" type="unix" /\>

\<server name="server2" type="unix" /\>

\<server name="server3" type="as400" /\>

\</Ortelius\>
```

### Examples

Add a new attribute to every _Endpoint_ apart from the first one.

```bash
modify(file: 'servers.xml', modifier: "xml") {

set\_attribute(xpath: "/Ortelius/server[position()\>1]/@newattr",

value: "newval");

}

Result:

\<Ortelius\>

\<server name="server1" type="unix" /\>

\<server name="server2" type="windows" newattr="newval" /\>

\<server name="server3" type="as400" newattr="newval" /\>

\</Ortelius\>
```

### Examples

Add an attribute specific for each _Endpoint_:

```bash
psloop {

modify(file: 'servers.xml', modifier: "xml") {

set\_attribute(

xpath: "/openmake/server[@name=${server.name}/@serverattr",

value: "$serverval");

}

}
```

This works by looping through each _Endpoint_ in the current _Endpoint_ set (using _psloop_). Inside the body of the loop, each _Endpoint_ is pushed onto the stack in sequence (setting the $server object along with all the _Endpoint_'s attributes). The element associated with the current _Endpoint_ is then located (with the xpath /openmake/server/[@name=${server.name}] and the attribute serverattr is then set to the _Endpoint_'s attribute serverval.

Assuming that "server1" has an attribute "serverval" set to "val1", "server2" has an attribute "serverval" set to "val2" and "server3" has an attribute set to "val3", the result will be:

```bash
\<Ortelius\>

\<server name="server1" type="unix" serverattr="val1" /\>

\<server name="server2" type="windows" serverattr="val2" /\>

\<server name="server3" type="as400" serverattr="val3" /\>

\</Ortelius\>
```

## Remove\_element

This statement can only be included if the modifier parameter in the parent modify statement is set to "xml". It is used to remove an XML element from an XML document.

_remove\_element_ takes a single named parameter:

xpath An xpath descriptor indicating the elements(s) in the XML document to be removed.

### Examples

Given an input file "servers.xml" that looks like this:

```bash
\<Ortelius\>

\<server name="server1" type="unix" /\>

\<server name="server2" type="windows" /\>

\<server name="server3" type="as400" /\>

\</Ortelius\>

Remove server2:

modify(file: 'servers.xml', modifier: "xml") {

remove\_element(xpath: "/Ortelius/server[@name=server2]");

}

Result:

\<Ortelius\>

\<server name="server1" type="unix" /\>

\<server name="server3" type="as400" /\>

\</Ortelius\>
```

### Examples

Remove all Unix _Endpoints_:

```bash
modify(file: 'servers.xml', modifier: "xml") {

remove\_element(xpath: "/Ortelius/server[@type=unix]");

}

Result:

\<Ortelius\>

\<server name="server2" type="windows" /\>

\<server name="server3" type="as400" /\>

\</Ortelius\>
```

### Examples

Ensure each _Endpoint_ gets its own copy of the file with its own entry removed.

```bash
modify(file: 'servers.xml', modifier: "xml", serverspecific: true) {

remove\_element(xpath: "/Ortelius/server[@name=${server.name}]");

}
```
