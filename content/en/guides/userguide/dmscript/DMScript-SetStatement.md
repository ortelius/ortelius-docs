---
title: "Set Statement"
linkTitle: "Set Statement"
weight: 96
description: >
  Assign a variable or array element to a value.
---

_Set_ assigns a variable or array element to a value. It has four possible modifiers:

|Modififier| Description |
| --- | ---|
| -a | Appends the value. |
| -l | Appends all values from an array or list. |
| -g | Sets the variable in global scope. |
| -i | Sets the nocase option. |

The +=, -= and \*= operators perform increment, decrement and multiply on the current value. In append mode the global variable SEPARATOR can be used to act as the separator string between the values.

```bash
set variable = expression;

set variable += expression;

set variable -= expression;

set variable -= expression;

set array[expression] = expression;
```

**Examples:**

```bash
**set** foo = "bar";
**set** bat = 1;
**set** fred = true;
**set** jim[2] = "value";
**set** -a foo = "bat"; // -a = append. foo is now "barbat"
**set** -l arr1 = $arr2; // appends arr2 to arr1
**set** -g myglobal = "value"; // sets in global scope
**set** -i mynocase = "MiXeD"; // variable is not case sensitive

if ($mynocase = "mixed") {

echo "match"; // This will match since mynocase is

} // case insensitive
**set** SEPARATOR = ', '; // variable SEPARATOR used for set -a
**set** -a foo = "ball"; // "barbat, ball"
```
