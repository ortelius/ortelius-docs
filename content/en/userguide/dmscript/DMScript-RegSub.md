---
title: "Regsub"
linkTitle: "RegSub"
weight: 89
description: >
  Convert a value to a string and replace all occurrences. 
---

regsub converts the value to a string and then replaces all the occurrences of the given regular expression with the specified substitute string.

**Usage:**

String.regsub(regexp,substitute)

Or

regsub(String,regexp,substitute)

Where:

regexp Is a regular expression to find in the String.

substitute Is a String to replace for the located regular expression.

**Returns:**

String: The result of substituting each occurrence of the matched regular expression with the substitute string.

Examples:

set a = "Hello There";

echo ${a.regsub("^.e","x")};

// echoes "xllo there";

**See Also:**

substr(), length()
