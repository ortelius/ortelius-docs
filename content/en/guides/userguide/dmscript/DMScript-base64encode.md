---
title: "base64encode"
linkTitle: "base64encode"
weight: 18
description: >
  Perform operations on a stream of data.
---


_base64encode_ operates on a stream. It converts the stream content (which may contain binary data) into a base64 encoded string and returns it.

**Usage:**

Stream.base64encode()

or

base64encode(stream)

**Returns:**

String: The base64 encoded representation of the passed stream data.

**Examples:**

```bash
1. _Create a string and convert it to Base64:_

echo "Hello Ortelius!" >> $teststream;

set b64 = ${teststream.base64encode()};

echo "b64 is $b64";

Result:

b64 is SGVsbG8gUmVsZWFzZSBFbmdpbmVlciE=



2. _Call_ base64encode _directly, passing the stream as a parameter:_

echo "Hello Ortelius!" >> $teststream;

set b64 = base64encode($teststream);

echo "b64 is $b64";

Result is identical:

b64 is SGVsbG8gUmVsZWFzZSBFbmdpbmVlciE=


3. _Read a file into a stream and convert it to base64:_

using _DropZone_'dp' {

using stream $configzip;

checkout(repository:'DPRep', pattern:'demo1.zip');

// read demo1.zip file into configzip

read(file:'demo1.zip',stream: $configzip);

set b64 = ${configzip.base64encode()};

// b64 is now a base64 encoded version of the file "demo1.zip"

}
```

**See Also:**

base64decode()
