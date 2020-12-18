---
title: "Sum"
linkTitle: "Sum"
weight: 103
description: >
  Interate through each arry element.
---

_sum_ operates on an array, iterating through each array element. The specified expression is passed to the totalizer and each value is added before the result is returned.

Expression can be $key in which case for each iteration the expression is set to the Array key (subscript) and this is the value that is passed to the totalizer. Expression can also be $value in which case the expression is set to the content of the Array element. If the Array element is an object then $value is the object itself. In this case, you can set expression to ${value.member} in order to access the member property of the value.

**Usage:**

Array.sum(expression)

or

sum(array,expression)

Where:

expression is:

$key to totalise the array subscript

$value to totalise the array element

${value.member} to totalise the specified member within each Element

**Examples:**

1. Add all the values up in a List.

```bash
set array = { 'fred' =\> 1, 'jim' =\> 2, 'sheila' =\> 4 };
 set sumofarray = ${array.sum('$value')};

In this case sumofarray will be 7 (1+2+4)
```

1. Add up all the filesizes in a drop zone

```bash
set sqlfiles = ${_DropZone_.find('\*.sql')};

set totalsize = ${sqlfiles.sum('${value.size}')};

sqlfiles will be set to an array of files matching the \*.sql pattern in the _DropZone_. sum then operates on each element within the array, passing the size of each file to the totalizer.


Note, it is necessary to surround the expression (e.g.: ${value.member}) with single quotes to prevent it from being expanded by the parser. If the expression is evaluated and expanded before being passed to sum an error will occur.
```
