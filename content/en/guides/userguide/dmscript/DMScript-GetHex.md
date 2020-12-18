---
title: "Get Hex"
linkTitle: "Get Hex"
weight: 69
description: >
  Convert a value to an integer.
---

hex converts any value that can be converted into an integer (boolean, integer, a string containing only numeric characters or a date) into a lowercase hexadecimal representation. An optional base parameter specifies the base to be used when converting the string. If no base parameter is given, base defaults to 10.

**Usage:**

value.hex([base])

or

hex($value[,base])

Where:

base is the base to be used when performing the conversion.

**Returns:**

String.

**Examples:**

set a = 255;

echo ${a.hex()};

echo ${a.hex(8)};

Result:

ff which is 255 (base 10) in hexadecimal notation

ad which is 255 (base 8) = 173 decimal which is "ad" in hexadecimal notation.

**See Also:**

octal, decimal
