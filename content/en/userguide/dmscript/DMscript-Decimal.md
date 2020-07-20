---

title: "Decimal"
linkTitle: "Decimal"
weight: 41
description: >
  Convert any value into an integer.
---

_decimal_ converts any value that can be converted into an integer (boolean, integer, a string containing only numeric characters or a date) into a decimal representation. An optional base parameter specifies the base to be used when converting the string. If no base parameter is given, base defaults to 10.

Usage:

```bash
value.decimal([base])

or

decimal($value[,base])

Where:

base is the base to be used when performing the conversion.

**Returns:**

String.
```

**Examples:**

```bash
Convert a hexadecimal number into decimal notation.

set a="feff";

echo ${a.decimal(16)};

Result:

echoes 65279
```

**See Also:**

hex(), octal()
