---
title: "Split"
linkTitle: "Split"
weight: 99
description: >
  Take a source string and split it into substrings.
---

_split_ takes a source string and splits into a number of substrings. The split is performed at the specified character sequence. The resulting strings are returned in a list of strings.

**Usage:**

String.split(seq)

or

split(String,seq);

**Returns:**

Array. A List of Strings.

**Example:**

```bash
set mystr="/this/is/an/example";

set dirs=${mystr.split("/")};

foreach (d: $dirs) {

echo "dir=${dirs[$d]}";

}

Result:

dir=this

dir=is

dir=an

dir=example
~
