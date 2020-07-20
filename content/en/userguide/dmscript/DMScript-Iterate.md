---
title: "Iterate"
linkTitle: "Iterate"
weight: 75
description: >
  Loop through a list of Objects. 
---


_iterate_ is similar to foreach but loops through each array/list member, setting a variable to the _value_ of the array element rather than the _key_ (as foreach does). It greatly simplifies the syntax required to iterate through a list of objects.

Braces are mandatory. _break_ and _continue_ may be used – _break_ to terminate the loop (as previously described) and _continue_ to restart the loop from the beginning with the next value.

There are two syntaxes for iterate – both operate in the same way, use whichever you prefer:

```bash

iterate (name: expression) {
 // loop-body
 }

iterate name in expression {
 // loop-body
 }
```

NOTE: Unlike _foreach_, iterate only operates with Arrays/Lists. Because it sets the variable to the content of each array element, the key value is not available in the body of the loop.

**Example:**
Here is an example of an _Array iterator_ – this iterates over all the values in the specified array (i.e.: the subscripts). e.g.

```bash
set arr = { ';a'; =\> ';1';, ';b'; =\> ';2';, ';c'; =\> ';3'; };
iterate(k: $arr) {

// $k will iterate through the values "1", "2; and "3";
echo "$k"; // output will be 1, 2, 3
 }

Here is an example of iterating through a list of Objects. Get a list of UserGroups to which the invoking user belongs:

set me=me();

echo "hello ${me.name}";

iterate(g: ${me.groups}) {

echo ${g.name};

}

### Result:

hello admin

EVERYONE

Developers

Administrators
```
