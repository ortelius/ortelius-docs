---
title: "Assert"
linkTitle: "Assert"
weight: 10
description: >
  Assert compares two strings, objects or expressions.
---

**_assert_** is used to compare two strings, objects or expressions for equality. If the values passed are not identical then an exception is thrown. This exception will normally stop the script but can be caught and handled by a _try/catch block_.

_assert_ takes a number of named parameters:

| Expression | Description |
| --- | --- |
| expr | Specifies an expression to execute. The expression must return true in order for the assertion to succeed. If the expression returns false an exception is thrown. |
| expr1 | Specifies an expression to execute. The result is compared to the result of the expression specified by expr2. |
| expr2 | Specifies an expression to execute. The result is compared to the result of the expression specified by expr1. |
| str1 | A String to compare to str2. |
| str2 | A String to compare to str1. If str1 and str2 differ then an exception is thrown. |
| obj1 | An object to compare to obj2. |
| obj2 | An object to compare to obj1. If the two objects differ then an exception is thrown. |

Note, only the following combinations of arguments are permitted:

_assert_ takes a number of named parameters:

| **Expression**  |  **Description** |
| --- | --- |
| expr | expr on its own is checked for true/false. |
| expr1 and expr2 | The results of the two expressions are compared. |
| str1 and str2 | The two strings are compared for equality. |
| obj1 and obj2 | The two objects are compared for equality. |

Any other combination of arguments is invalid and will result in an error.

**Example:**

```bash
 Use a Pre Action to an _Application_ to prevent an _Application Version_ from being deployed if it is not the latest version.

set latest = ${_Application_.parent.latest()};

try {

assert (obj1: $latest, obj2: $_Application_);

} catch(ex) {

abort(msg: "Can only deploy the latest version (${latest.name})");

}
```

If the _Application_ being deployed ($Application) is the same as the calculated latest version then the assertion check succeeds and the script exits without error, allowing the deployment to continue. If $Application differs from the calculated latest version then the assertion fails and an exception is thrown. The _try/catch block_ simply catches this error and issues a more "user friendly" error message.
