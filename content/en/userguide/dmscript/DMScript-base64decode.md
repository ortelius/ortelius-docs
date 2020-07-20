---
title: "base64decode"
linkTitle: "base64decode"
weight: 16
description: >
  Convert a string of base64 encoded data into a stream.
---


_base64decode_ converts a string of base64 encoded data into a stream and returns the number of bytes written to the stream. The stream needs to be passed as an optional parameter. If the stream is not specified, _base64decode_ needs to be called within a using stream block. If _base64decode_ is called outside of a using stream block and no stream parameter is passed, an error occurs.

**Usage:**

_String_.base64decode([stream])

or

base64decode(string[,stream])

Where:

_stream_ is the name of an existing stream. If the stream does not currently exist, an error occurs. If stream is not specified, base64decode will write the decoded output to the stream identified in the enclosing using stream block.

**Returns:**

Integer: The length of the decoded data. The decoded data is written to the stream identified by the outer using stream statement.

**Examples:**

```bash

1. Convert a base64 encoded string into a stream:_

// Encode a String into Base 64

echo "Hello Ortelius!" >> $teststream;

set b64 = ${teststream.base64encode()};

echo "b64 is $b64";

// Now decode it again

using stream $resultstream {

set len = ${b64.base64decode()};

}

echo "res is $resultstream";

echo "len is $len";

Result:

b64 is SGVsbG8gUmVsZWFzZSBFbmdpbmVlciE=

res is Hello Ortelius!

len is 23


2. Call_ _base64decode_ _directly, passing the string as a parameter_

set b64="SGVsbG8gUmVsZWFzZSBFbmdpbmVlciE=";

using stream $resultstream {

set len = base64decode($b64);

}

echo "res is $resultstream";

echo "len is $len";

Result:

res is Hello Ortelius!

len is 23

1. Pass the stream directly into _base64decode_:

set b64="SGVsbG8gUmVsZWFzZSBFbmdpbmVlciE=";

using stream $resultstream; // ensure stream exists

set len = ${b64.base64decode($resultstream)};

echo "res is $resultstream";

echo "len is $len";

Result:

res is Hello Ortelius!

len is 23
```

**See Also:**

base64encode()
