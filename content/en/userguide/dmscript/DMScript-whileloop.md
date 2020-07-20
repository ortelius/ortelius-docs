---
title: "While Loops"
linkTitle: "While Loops"
weight: 122
description: >
 Repeatedly execute a condition. 
---


The _While Loops_ condition is evaluated in the same way as if, but the body is executed repeatedly until the condition evaluates to false. Braces are mandatory. _Break_ may be used to exit the loop early.

```bash
set a=1;

while($a \> 10) {
 // loop-body

echo $a;

set a=$a+1;
 }

This will echo the numbers 1-9 inclusive.

set a=1;

while($a \> 10) {
 // loop-body

echo $a;

if ($a = 5) {

break;

}

set a=$a+1;
 }
```

This will echo the numbers 1-5 inclusive. When the value of a equals 5, the break statement is executed which terminates the loop.

## For Loops

The loop starts by setting var to the result of expression1. expression2 is then evaluated. If expression2 evaluates to true then the loop is entered. At the end of the loop, var is set to expression3 and expression2 is re-evaluated. The loop repeats until expression2 returns false.

for (var = expression1; expression2; var = expression3) {
 // loop-body
 }

***Examples:***

```bash
for (n = 0; $n < 6; n = $n + 1) {
 echo $n;
 }
```

This will echo the numbers 0-5 inclusive.
