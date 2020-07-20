---
title: "Switch/Case/Default"
linkTitle: "Switch/Case/Default"
weight: 104
description: >
  Evaluate a conditional expression and compare for a match. 
---

The _Switch/Case/Default_ condition expression is evaluated and compared to each case label in turn until a match is found. Subsequent labels will be executed until a break is executed. A default clause will always match. The case expressions do not need to be constants and can be of any type.

**Examples**

```bash
switch($response) {
case "hello":

echo "Hello to you too!";

break;
case "goodbye":

echo "See you later!";
break;
default:

echo "I've no idea what you mean!";
break;
 }
```

Note, the break statement is required to prevent the execution continuing into the next block.

```bash
For example:

set v=2;

switch($v) {
case 1:

echo "v is 1";
case 2:

echo "v is 2";
default:

echo "v is not 1 or 2";
break;
 }
```

Since there is no break at the end of the case 2 code segment, _DMScript_ will continue to execute the code following the "default" clause:

```bash
v is 2

v is not 1 or 2
```

If this is not desired, make sure you include break.
