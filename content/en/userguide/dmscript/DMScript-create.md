---
title: "Create and Read"
linkTitle: "Create and Read"
weight: 32
description: >
  Create or Read a new file in the DropZone.
---


_Create_ adds a new file in the current _DropZone_. If an optional stream is specified, then the file is created from the stream content.

_create_ requires named parameters:
| Parameter | Description |
| --- | --- |
| file | Mandatory. The name of the file to create in the current _DropZone_. |
| stream | Optional. The stream to use to populate the file. If the stream parameter is absent, the file is created with zero size. |

Once the file is created it is marked for deployment. It will be pushed to the target _Endpoint_(s) during any subsequent _transfer_ operation.

**Example:**

```bash
Creates a config file and push it to the target _Endpoint_s. This should be placed into a Custom Action in a _Component_:

using DropZone 'demozone1' {

using stream $demostream {

echo "# This is a config file";

echo "[p1]";

echo "p1=$p1";

echo "p2=$p2";

}

create(file: "config.file", stream: $demostream);

transfer; // copies file in DropZone to target Endpoint(s)

}
```

## Read

Reads a file in the current _DropZone_ and writes its content into a stream.

_read_ takes at most two parameters:

| Parameter | Description |
| --- | --- |
| file | Mandatory. The name of the file to read. |
| stream | Optional when _read_ is used inside a using stream block, mandatory otherwise. Specifies the name of an existing stream. |

NOTE: If stream is not specified, then the file content is written into the stream used by the enclosing using stream block. If stream is not specified and read is used outside a using stream block a runtime error occurs.

**Example:**

```bash
Checkout a file from a repository, read its content into a stream, convert it to base64, create a new file containing the base64 encoded file and transfer it to the target _Endpoint_(s). This should be placed into a _Component_ as a Custom Action.

using DropZone 'dp' {

using stream $configzip; // create the stream

checkout(repository: 'DPRep', pattern: 'demo1.zip');

read(file: 'demo1.zip', stream: $configzip);

set b64 = ${configzip.base64encode()};

// create a new file

create(file: "demo2.b64", stream: $configzip);

delete(file: "demo1.zip"); // Remove original file

transfer; // transfer demo2.b64 to target

}
```

**Example:**

```bash
Create new users in Ortelius from a file. Assume the file is constructed like this:

jdoe|John Doe|jdoe@mycompany.com

bsmith|Bill [Smith|bsmith@mycompany.com](mailto:Smith%7Cbsmith@mycompany.com)

The following code, when executed, will read this file and call Ortelius' own API in order to add the users to the database:

set APIURL="http://mac:8080/dmadminweb/API/new/user/";

set session={"JSESSIONID": "$JSESSIONID"};

using DropZone 'users' {

using stream $users; // create the stream

checkout(repository: 'demorep2', pattern: 'users.txt');

read(file: 'users.txt', stream: $users);

foreach(line: $users) {

set elems = ${line.split("|")};

set attrs = {

"domain": "Openmake\_Demo",

"realname": "${elems[1]}",

"email": "${elems[2]}",

"pw": "welc0me" // initial password

};

set res = restful\_post($APIURL+${elems[0]},$attrs,$session);

if (${res.success}) {

echo "Added user ${elems[0]} okay";

} else {

echo "${res.error}";

}

}

Result:

Added user jdoe okay

Added user bsmith okay
```
