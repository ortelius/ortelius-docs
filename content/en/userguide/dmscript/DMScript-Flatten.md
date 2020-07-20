---
title: "Flatten"
linkTitle: "Flatten"
weight: 62
description: >
  Get a string representing all values in an array. 
---

_flatten_ operates on an array. It returns a string representing all the values within the array. If any of the array values are other arrays these are also flattened recursively until the entire array is represented by a single string. During this process all of the keys are lost, so the output order of Lists can be determined, but the order of Arrays cannot. It is generally more useful with Lists than Arrays.

**Usage:**

```bash
array.flatten()

or

flatten(array)

Returns:

String: A string containing all the values in the array.
```

**Example:**

```bash
set a={

"a": "value1",

"b": "value2",

"c": {

"c1": "value3",

"c2": "value4"

},

"d": "value5"

};

echo "a.flatten is ${a.flatten()}";

Result:

a.flatten is "value5" "value1" "value2" ""value3" "value4""
```

**See Also:**

filter(), sum(), to\_json()
