---
title: "Attachment"
linkTitle: "Attachment"
weight: 12
description: >
  Add an attachement to your email via SMTP Notifiers.
---


An _attachment_ statement can only be included in a notify block. It is used to add an attachment into an outgoing email (via SMTP notifiers). It allows much finer control over the attachment content than that provided by the attachment parameter to the notify statement.

_attachment_ takes a number of named parameters:

|**Parameter**| **Description** |
| --- | --- |
 | name | The name of the attachment. The attachment will appear with this name in the received email.|
 | body | Optional - The message.|
 | A stream | The content of the stream creates the content of the attachment.|

_attachment_ can optionally open a code block. If body is not specified then the content of the attachment is taken from the output created by this code block.

## Example

```bash
 Checkout a file and include it as an attachment in an email:

// Checkout "myfile.txt" and read it into the stream $myfile.

using DropZone "test" {

checkout(repository: "Openmake\_Demo.demorep2", pattern: "myfile.txt");

using stream $myfile {

read(file: "myfile.txt");

}

}

// Send the email, including the attachment.

set me=me();

notify(notifier: "SMTP\_Notifier", to: $me, subject: "Example 1") {

echo "Dear ${me.realname}";

echo "";

echo "Attached is myfile.txt for your information";

attachment(name: "myfile.txt", body: $myfile);

}

```bash

**Example**

```bash
Create an attachment with a script and include it in an email:

set me=me();

notify(notifier: "SMTP\_Notifier", to: $me, subject: "Example 2") {

echo "Dear ${me.realname}";

echo "";

echo "Attached is genfile.txt which is created by a script";

attachment(name: "genfile.txt") {

echo "These lines are included in genfile.txt";

echo "The following lines are generated from an external script";

testaction(arg1: 'hello', arg2: 'world');

}

}
```

**Example:**

```bash
Send an email containing the Change Requests associated with the Application.

set me=me();

set crlist = ${_Application_.requests};

notify(notifier: 'SMTP\_Notifier',to: $me, subject: 'Test Notification', HTML: true) {

echo "\<;h3<Dear ${me.realname}\<;/h3<";

echo "Change Requests for _Application_ ${_Application_.name}";

echo "\<;table border=1<";

iterate(cr: $crlist) {

echo "\<;tr<\<;td<${cr.id}\<;/td<\<;td<${cr.name}\<;/td<\<;/tr<";

}

echo "\<;/table<";

}
```bash

Email Received:
![Sample Email](/guides/userguide/dmscript/Attachment.jpg)
