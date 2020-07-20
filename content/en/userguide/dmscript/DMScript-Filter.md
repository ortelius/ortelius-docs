---
title: "Filter"
linkTitle: "Filter"
weight: 60
description: >
  Get a subset of an array. 
---

_filter_ operates on an array. It returns a new array which contains a subset of the array containing just those entries whose keys match the given regular expression.

**Usage:**

```bash
array.filter(regexp)

or

filter(array,regexp)

Where:

regexp is a Regular Expression

Returns:

Array: A subset of the passed array containing those entries whose keys match the specified regular expression.
```

**Example:**

```bash
set test="\<a\>\<b\>hello\</b\>\<b\>goodbye\</b\>\</a\>"

"\<c\>\<d\>Hallo\</d\>\<d\>auf wiedersehen\</d\>\</c\>";

set jsonvals = ${test.xmlparse()};

echo "jsonvals is ${jsonvals.to\_json()}";

set newarr = ${jsonvals.filter("c")};

echo "newarr is ${newarr.to\_json()}";

Result:

jsonvals is {"a":{"b":["hello","goodbye"]},"c":{"d":["Hallo","Auf Viedersien"]}}

newarr is {"c":{"d":["Hallo","Auf Viedersien"]}}


xmlparse converts XML into a _DMScript_ array. It is described later in this chapter.

```

**See Also:**

xmlparse, flatten, sum
