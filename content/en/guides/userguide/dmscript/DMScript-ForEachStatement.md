---
title: "For Each Statement"
linkTitle: "For Each Statement"
weight: 64
description: >
  Use a generic iterator for string tokenization.
---

_foreach_ is a generic iterator for string tokenization, array/list member access and stream manipulation. Braces are mandatory. _break_ and _continue_ may be used – break to terminate the loop (as previously described) and continue to restart the loop from the beginning with the next value.

There are two syntaxes for foreach – both operate in the same way, use whichever you prefer:

```bash
foreach(name: expression) {
 // loop-body
 }

foreach name in expression {
 // loop-body
 }
```

**Example:**

Here is an example of a _String iterator_ – this splits the specified string using the global variable IFS as a separator. If IFS is not set, the default is " \t" (space or tab). The iterator can also remove quotes if the global variable DEQUOTE is true. e.g.

```bash
set IFS ='|';
set DEQUOTE = true;
foreach(bar:'alpha|"beta"|gamma|delta') {
echo $bar; // alpha, beta, gamma, delta.
 }

**Example**
Here is an example of an _Array iterator_ – this iterates over all the keys in the specified array (i.e.: the subscripts). e.g.

set arr = {'a' =\>'1','b' =\>'2','c' =\>'3' };
foreach(k: $arr) {

// $k will iterate through the subscripts "a", "b" and "c"
echo "$k =\> ${arr[$k]}"; // output will be a =\> 1 etc
 }

 ```

**Example:**

Here is an example of a _Stream iterator_ – this splits a stream on newlines (and/or carriage returns) e.g.

```bash
echo"Hello\nWorld" \>\> $stream1;
foreach(line: $stream1) {
echo $line;
 }

// output is

// Hello

// World

This can be used to set _DMScript_ variables from a file. Assume we have a file in a repository called "myfile.txt" containing the following:

# example file containing variables to set

var1=23

var2="hello there"

var3="this is a test"

var4=90

You can set these variables in _DMScript_ by using the following code:

using stream $varfile; // create the stream

using _DropZone_ "tdz" {

checkout(repository: "Openmake\_Demo.demorep2",pattern: "myfile.txt");

read(file: "myfile.txt", stream: $varfile);

foreach(line: $varfile) {

set line=${line.regsub('#.\*$',"")}; // remove comments

if (${line.length()}\>0 &amp; ${line.instr("=")}\>0) {

eval("set ${line};");

}

}

}

echo "var1=$var1";

echo "var2=$var2";

echo "var3=$var3";

echo "var4=$var4";

Result:

var1=23

var2=hello there

var3=this is a test

var4=90
```
