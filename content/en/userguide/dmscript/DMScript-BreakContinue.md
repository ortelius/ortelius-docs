---
title: "Break/Continue"
linkTitle: "Break/Continue"
weight: 24
description: >
  Break out of a loop or restart a loop. 
---


**_break/continue_** can be used to break out of loops or _switch_ statements. _continue_ can be used to force the loop to restart with the next value.

**Example with psloop:**

```bash

psloop {
echo ${server.name};

if ($myattribute = "nomore") {

// Stop when we find an Endpoint with myattribute = "nomore"

echo "Breaking";

break; // break out of loop

}
 }

echo "end of loop";

In this example, Ortelius will iterate through the current _Endpoint_ set, looking at the value of myattribute for each _Endpoint_. When it finds an _Endpoint_ with this attribute set to the value of nomore it will break out of the loop.
```

**Example with continue:**

```bash

for (i=1;$i<=10;i=$i+1) {

if ($i = 5) {

continue;

}

echo $i;

}

The output from this code will be:

1

2

3

4

6

7

8

9

10

This is because the fifth time through the loop, i will be 5. The condition will match and execute "continue" which will restart the loop with the next value (6).
```
