---
title: "Modify"
linkTitle: "Modify"
weight: 81
description: >
  Change a file in the DropZone.
---

_Modify_ changes a file in the _DropZone_. _modify_ is used to make changes to either flat files or XML files before they're deployed to the target _Endpoints_. Changes can be made that are specific to individual _Endpoints_ within the _Endpoint_ list. In this case, each _Endpoint_ receives its own copy of the modified file.

_modify_ opens a statement block containing the file modification statements. The statements that are permitted in the modify block are dependent on the type of modification being performed (either text file or XML file). It is these modification statements that specify what changes are made to the specified file – the parent _modify_ statement specifies the file and its format.

_modify_ takes a variable number of named parameters:

| file | The name of the file in the _DropZone_ to modify. Mandatory. |
| --- | --- |
| modifier | A mandatory text string indicating the type of modifier: |
| "text" | simple text replacement. File is a standard text file. |
| "xml" | XML modifications. File is XML based. |
| outfile | The name of the file to which the modified file is written. The original input file is left unchanged. This parameter is optional – if not specified then the changes are written back to the original input file. |
| serverspecific | A Boolean value (true/false). If set to true then a copy of the modified file is created for each _Endpoint_ in the current _Endpoint_ set. If set to false - or not specified – then the same changed file is sent to each _Endpoint_ in the current _Endpoint_ set. |

NOTE: When running modify with server specific set to true, an implicit _Endpoint_ loop is performed and the modify operation is performed for each _Endpoint_ in the current _Endpoint_ set. You can therefore substitute _Endpoint_-specific attributes or use _Endpoint_ properties (such as ${server.hostname}).

A copy of the modified file is made for each _Endpoint_. It is only during a subsequent deployment operation (either implicitly or with a call to _transfer_) that these modified files are transferred to their appropriate _Endpoint_.
