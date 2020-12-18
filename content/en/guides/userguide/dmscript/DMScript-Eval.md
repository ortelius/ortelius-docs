---
title: "Eval"
linkTitle: "Eval"
weight: 56
description: >
 Evaluate a block of code.
---

_Eval_ dynamically evaluates a block of code to give a piece of text, which is fed through the parser. This gives a statement list, which is then executed.

**Usage:**

eval(expression);

**Example:**

```bash

set x = "foo";
set y = "bar";
set bar = "bat";
eval("set $x = \$$y;"); // _evaluates to set foo = $bar_

// foo will now be "bat"
```
