---
title: "To Json"
linkTitle: "To Json"
weight: 106
description: >
  Get a String representing the contents of the array in JSON notation.
---


to\_json operates on an Array. It returns a String representing the contents of the array in JSON notation.

**Usage:**

_Array_.to\_json()

or

to\_json(array)

**Returns:**

String: A representation of the array content in JSON syntax.

**Example:**

```bash
set myarray = {

"one": "val one",

"two": {

"x": 3,

"y": 4

}

};

echo ${myarray.to\_json()};

// echoes {"one":"val one","two":{"x":"3","y":"4"}}
```

**See Also:**

filter(), sum()
