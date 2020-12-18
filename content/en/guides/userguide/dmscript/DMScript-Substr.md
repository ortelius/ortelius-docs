---
title: "Substr"
linkTitle: "Substr"
weight: 102
description: >
  Converts the given value into a string.
---

_substr_ turns the given value into a String and then takes a substring from the integer start position (the first character in a string is position 0) to the end of the string or - if an optional length parameter is provided - of length characters.

**Usage:**

String.substr(start[,length])

or

substr(String,start[,length])

**Returns:**

String: The substring represented from the start point of the source string containing the rest of the string or length characters.

**Example:**

```bash
set a = "Hello There";

echo ${a.substr(0,5)}; // echoes "Hello"

echo ${a.substr(6)}; // echoes "There"
```
