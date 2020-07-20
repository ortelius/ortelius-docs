---
title: "Octal"
linkTitle: "Octal"
weight: 84
description: >
  Convert any value into an octal representation. 
---

octal converts any value that can be converted into an integer (boolean, integer, a string containing only numeric characters or a date) into an octal representation. An optional base parameter specifies the base to be used when converting the string. If no base parameter is given, base defaults to 10.

**Usage:**

value.octal([base])

or

octal($value[,base])

Where:

base is the base to be used when performing the conversion.

**Returns:**

String.

**Examples:**

Convert a Unix file permission mask (-rwxrwxrwx) into its Octal equivalent suitable for a chmod operation.

set perms="-rwxr-xr-x";

echo "perms is $perms";

// Convert to binary by substituting 0 for � and then anything

// that isn't a 0 gets converted to a 1.

set b = ${perms.regsub("-","0").regsub("[^0]","1")};

// Convert to octal by converting the string using base 2.

echo "chmod ${b.octal(2)}";

Result:

perms is -rwxr-xr-x

chmod 755

**See Also:**

hex(), decimal()
