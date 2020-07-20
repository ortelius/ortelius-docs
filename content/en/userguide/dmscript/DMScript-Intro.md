---
title: "Intro to Customizing Actions with DMScript"
linkTitle: "Intro to Customizing Actions with DMScript"
weight: 1
description: >
  Customize any Action using Built-in Functions and Procedures with DMScript.
---

_DMScript_ (_D_eployment _M_anagement _Script_ing) is Ortelius' own scripting language. It underpins nearly all the activities that take place during a deployment.

Users with the appropriate permissions can create their own _DMScript Activities_ by creating custom _Procedures_ and _Functions_. _DMScripts_ can be stored in the Ortelius database (as stored procedures) or can be held in an external filesystem or even in a _Repository_. Storing _DMScript_ in a _Repository_ allows it to be version controlled.

_Actions_ are a set of _Functions_ and _Procedures_ that define your deployment _Workflow_ logic. You use the action editor by dragging and dropping _Functions_ and _Procedures_ onto the design pallet, connecting the order in which they execute. When you run the _Action_, Ortelius parses the _Functions_ and _Procedures_ in the _Action Workflow_, generates one big _DMScript_ which is then passed to the deployment engine for deployment execution.

Although it is not necessary to understand _DMScript_ in order to use Ortelius, doing so will allow you to create more sophisticated and highly custom deployments. It is also useful to understand the Stack Architecture which underpins _DMScript_. Doing so will allow you to understand variable scoping and inheritance which is useful even if you generate all custom activities via the _Action Workflow Editor_.

## Prerequisites

Some scripting or programming experience (in any other scripting or programming language) is assumed. _DMScript_ is object-orientated and has a similar syntax to Javascript but has features from other scripting languages.

Knowledge of Ortelius and its various objects (_Environments, Endpoints, Applications, Components_ etc.) and how they interact is also assumed. Web Based API calls assume some knowledge of SOAP and RESTful interfaces.

## Why Use DMScript

Ortelius can call any external script or program (either locally on the deployment engine or remotely on the target _Endpoint_ during a deployment). Given that fact, why would you need to use _DMScript_?

_DMScript_ has:

- Knowledge of the Ortelius object model. For example, _DMScript_ allows you to find all the _Endpoint_s in an _Environment_ that have a specific attribute. Doing this in external scripts is difficult if not impossible.

- Full knowledge of the attributes set against the selected objects. Uses values that have been set against _Endpoint_s, _Environments_, or _Applications_.

- A RESTful and SOAP API client. Makes calls to external systems (or even Ortelius' own API) quickly and easily.

- A built-in JSON/XML parser. This means the results of RESTful and SOAP API calls are available as variables within _DMScript_ without the need for complex parsing.

- A built in ODBC tool. You can query (or update) databases and have the results available in your _DMScript_. This means you can query a database as part of a deployment activity and perform different steps dependent on the results of the query.

- A built-in LDAP query tool. Query LDAP _Endpoint_s and use the results in your scripts.

- A built-in mail client. You can construct your own emails (with attachments) and control when they are sent and to whom. This is useful if the normal Ortelius "template" mechanism is insufficient for your needs.

- A built-in base64 encoder/decoder.

- Built-in support for parallel execution. Run scripts on different _Endpoint_s in parallel.

- Fine control over the deployment scheme. If you want to change the default deployment mechanism, use _DMScript_.

If you need to do any of these things, either as part of a deployment activity or as part of an integration (for example, notifying an external system when an _Application Version_ has been moved or deployed) then use _DMScript_.
You can customize any _Action_ using DM Script. Ortelius has _built-in Functions_ and _Procedures_ ready for you to call when you need customization. _Actions_ call _Activities_ that are _Functions_ or _Procedures_. _Function_ performs an _Activity_ and returns an _Object_. A _Procedure_ performs an _Activity_ and returns only 'success'or 'fail.'

# Storing DMScripts

When you write your own DMScripts for _Procedures_ and _Functions_, you can set the "kind" to either "_DMScript __Procedure__ in Database_" or "_DMScript __Procedure__ in Repository_".

DMScript Procedure in Database

If the "kind" is "_DMScript __Procedure__ in Database_" then a "Body" tab will appear. This will show the text of the _DMScript_. Clicking the pencil icon will open a pop-up editor. This editor has syntax highlighting, search and replace options (including searching for regular expressions) and other editor _Functions_. When the edited _DMScript_ is saved (by clicking the OK button or the save icon) a syntax check is performed automatically. If the _DMScript_ fails, then the line in error is highlighted and the dialog stays open.

DMScript in Repository

If the "kind" is "_DMScript in Repository_" then you will be asked to specify the repository in which the _DMScript_ file is located and the name of the file containing the _DMScript_.

NOTE: You can only specify the name of the file containing the _DMScript_, so the repository definition _must_ include all the other details required to locate the file in the repository. It may therefore be necessary to define a new repository specifically for _DMScript_.

# Functions

_Functions_ return a new object (such as _getApplication_ or _getcredential_), perform a conversion (such as _xmlparse_), or can make calls to external web-based APIs and return structured results (such as _soap_ or _restful\_post_). Some _Functions_ act as object _methods_. For example _length()_ can be called on a string (to return its length in characters) or on an array (to return the number of elements). In these cases, the _Function_ can be called directly from the object itself like this:

```bash
set str="Hello There";

set len=${str.length()};

echo "length is $len"; // echoes length is 11

Or one can call the _Function_ "stand-alone" passing it the object as the first parameter:

set str="Hello There";

set len=length($str);

echo "len is $len"; // echoes len is 11
```

When a _Function_ relates to an object, this will be indicated.

### Define a Function

A _Function_ can be defined simply by using the keyword _Function_ followed by the _Function_ name, its parameters and the code that makes up the _Procedure_ in braces.

Example:

```bash
_Function_ testfunc(arg1, arg2)

{

return "$arg1 $arg2";

}
```

When adding _Functions_ via the Ortelius Web User Interface, the "_Function_" header is implied. The argument names are taken from the Arguments tab. There is no need to use the syntax outlined here. However, you can use this in an external _DMScript_ file (one stored in a repository) and call it from other _Procedures_ or _Functions_ stored in the same file.

### Call a Function

_Functions_ can be called as a simple statement. For example, using the testfunc_Function_ which we defined previously:

```bash
set myres = testfunc("Deploy", "Hub");

echo $myres; // echoes "Ortelius"
```

**NOTE:** The _Function_ called can also be _DMScript_ stored in the Ortelius database, _DMScript_ held in an external repository, or it can be an external script which is executed. The method used is based on the "kind" of the _Procedure_.

Built-in _Functions_ can be stand-alone _Functions,_ which can be called as described above. There are also _Functions_ which are defined as methods on _DMScript_ Objects. To call a method on an object, use the following syntax:

```bash
set res = ${object.method(p1,p2)};

Where:

object is the DMScript object.

method is the name of the method that the object provides

p1,p2 are the parameters passed to the method.

A _Function_ with no parameters can be called like this:

set res = myfunc();
```

# Procedures

A _Procedure_ can be defined in _DMScript_ by using the keyword _Action_ followed by the _Procedure_ name and the code that makes up the _Procedure_ in braces.

Example:

```bash
actionmyaction

{

echo **"** myarg1 **= $** myarg1 **";**

echo **"** myarg2[1] = $myarg2[1]";

}
```

**NOTE:** When adding _Procedures_ via the Ortelius Web User Interface, the "action" header is implied. There is no need to use the syntax outlined here. However, you can use this in an external _DMScript_ file (one stored in a repository) and call it from other _Procedures_ or _Functions_ stored in the same file.

### Call a Procedure

_Procedures_ can be called as a simple statement. A new scope is pushed for the called _Procedure_ and populated with the parameters, which are essentially name value pairs. e.g.

myaction(myarg1: "value1", myarg2: { "some", "list", "value" } );

The _Action_ scope being populated with the values from the invocation means that the called _Action_ can read its parameters just by accessing the variable name. In other words, myaction can simply read $myarg1 and $myarg2.

When the above action is called, the _Procedure_ defined above will echo:

```bash
myarg1 = value1

myarg2[1] = list
```

**NOTE:** The _Procedure_ called can also be _DMScript_ stored in the Ortelius database, _DMScript_ held in an external repository or it can be an external script which is executed. The method used is based on the "kind" of the _Procedure_.

If the action does not have any parameters, then the call should be made with no enclosing braces like this:

myaction;

This is to allow _DMScript_ to differentiate between _Procedures_ and _Functions_.

# DMScript Syntax

_DMScript_ is an object-orientated scripting language. It uses a fairly broad syntax with elements of Java, Perl, and Shell Script. Any developer should be able to become proficient in _DMScript_ fairly quickly.

_DMScript_ has knowledge of the Ortelius object model. Each object (_Endpoint_, _Environment_, _Application_, _Component_ etc) has a corresponding object in _DMScript_. Thus, you can use ${_Environment_.name} to get the current _Environment_ name (deployment target) and ${_Application_.name} to get the name of the _Application_ being deployed. Other objects (such as _Endpoint_ and _Component_) only become "in scope" when they are pushed onto the _Stack_ during a deployment operation.

This knowledge of the object model allows _DMScript_ to use fairly sophisticated operations. For example if you have an _Application Version_ object:

~~~
$app

Then

$app-1

is the version immediately preceding this _Version_.

$app-2

is two revisions of this Version. Similarly,

$app+1

is the revision immediately after this _Version_.
~~~

NOTE: this operation will not work if the version has two or more child versions (due to branching).

## DMScript Interpreter

_DMScript_ is an interpreted language. It is not compiled either to machine language or to any intermediate p-code.

In Ortelius, _Procedures_ and _Functions_ can be external scripts (written in any language) which are then executed either on the local deployment engine or on the target _Endpoint_ during a deployment. You can also create _Procedures_ and _Functions_ in _DMScript_ and invoke them as part of a deployment. _DMScript_ can call other _Functions_ and _Procedures_ and these can be written in _DMScript_ or can be external scripts written in any language.

Actions are created by dragging and dropping _Functions_, _Procedures_ and workflow directives onto the action editor. When the action is invoked (as part of a deployment or as a stand-alone action), Ortelius generates _DMScript_ from the action flow and then executes it using the built-in _DMScript_ interpreter.

NOTE: To see the _DMScript_ generated from an action, right-click in the action editor flow and select "Show Generated _DMScript_".

## Statements

Statements should always end with a semi-colon to indicate the end of the statement. White space (spaces, tabs, newlines) are usually ignored by the _DMScript_ interpreter so you are free to layout your script as you see fit. There are some restrictions on this – these will be highlighted where necessary.

## Comments

Comments begin with a double forward-slash like this:

// this is a comment

Everything after the // is ignored by the _DMScript_ interpreter.

You can also comment over multiple lines by using /\* to start a comment and \*/ to end it.

/\* This comment

\* runs over several lines

\*/

## Variables

Variables in _DMScript_ are not typed. It is not necessary to explicitly declare the variable as being a string, an integer or an object. Rather, the variable is declared and set using the set keyword and _DMScript_ implies the type of the variable from what it is set to.

Variables can be either simple _Scalar Variables_ (i.e. variables that hold either a number or a string), an _Object_ (such as an _Environment_ or an _Application_) or can be _Arrays_ or _Lists_. In _DMScript_, arrays are _associative_. This simply means that an array subscript can be text as well as a number.

NOTE: _DMScript_ does not support floating point variables.

Objects have _Properties_ and _Methods_ associated with them. Nearly every object has a name property (which returns the object's name) and an id property (which returns the object's unique internal ID).

Properties are returned by appending the property name to the object variable name with an intervening period. To reference the entire property, the complete variable name must be enclosed with braces.

For example, here is how to get the name property for the current target _Environment_:

```bash
set envname = ${Environment.name};

echo "Target Environment is $envname";
```

Methods differ from Properties in that they normally require one or more (possibly optional) parameters. These parameters should be enclosed in parenthesis after the method name.

For example, here is how you use the latest method of an _Application_ object to get the latest version of an _Application_ on a branch identified by the variable mybranch:

```bash
set latestapp = ${_Application_.latest($mybranch)};

echo "latest app on branch $mybranch is ${latestapp.name}";
```

The following is an example of setting and using a Scalar Variable

```bash
set MYVAR = 1;

echo $MYVAR; // echoes "1"

set MYVAR = $MYVAR + 1;

echo $MYVAR; // echoes "2"

incr MYVAR; // Increments MYVAR (same as set MYVAR=$MYVAR+1;)

echo $MYVAR; // echoes "3"

And here's how you set and use arrays:

set myarray[1] = "one";

set myarray[2] = "two";

echo $myarray[1]; // echoes "one"

echo $myarray[2]; // echoes "two"

// Array subscripts don't need to be numeric…

set myarray["testone"] = 1;

set myarray["testtwo"] = 2;

echo $myarray["testone"]; // echoes "1"

echo $myarray["testtwo"]; // echoes "2"

set a="testtwo";

echo $myarray[$a]; // echoes "2"
```

You can also set associative array members by using { ... } syntax and using => to specify the subscript and the value:

```bash
set myarray = { "testone" => "ONE", "testtwo" => "TWO" };

echo $myarray["testone"]; // echoes "ONE"

echo $myarray["testtwo"]; // echoes "TWO"

Arrays can also be assigned using JSON syntax:

set myarray = {
 "one": "val one",
 "two": "val two",
 "three": 3,
 "four": true,
 "five": null
 };

echo $myarray["one"]; // echoes "val one"
```

Since array members (like any other variable in _DMScript_) are not _typed_, array members can contain values of different types. In the example above, there are two strings ("val one" and "val two"), one integer (3), one Boolean (true) and a null indicator.

This lack of typing means that an array member can contain other arrays or lists.

```bash
set myarray = {

"one": "val one",

"two": {

"x": 3,

"y": 4

}

};
```

In this example, the array member identified by the subscript "two" actually contains another array with subscripts "x" and "y".

As well as the quoted subscript syntax, _DMScript_ also supports _dot notation_. This means you can "dereference" array members by specifying the subscript by name with a dot after the array name:

```bash
echo ${myarray.one}; // echoes "val one"

echo ${myarray.two.y}; // echoes "4"
```

NOTE: When using dot notation it is necessary to use enclosing braces as shown. The dot notation is also only available should the subscript name not include spaces.

You can convert an array into a JSON format string by using the .to\_json method on the array:

```bash
echo ${myarray.to\_json()}; // echoes {"one":"val one","two":{"x":"3","y":"4"}}
```

A _List_ is simply an array with implied numeric keys. You can set a list like this:

```bash
**set** mylist={"a","b","c"};
```

And reference the individual members by using numeric subscripts like a conventional array:

```bash
echo $mylist[1]; // echoes "b"
```

NOTE: In common with most other languages, list subscripts start at 0, not 1.

This array and list mechanism allows _DMScript_ to easily parse the results of calls to external RESTful and SOAP based APIs. When the result of such a call is a JSON or XML encoded string, _DMScript_ will parse this into an associative array. The values can then easily be retrieved using the dot notation as described above.

## Variable Expansion

Variables are automatically expanded to their value if:

- They are preceded by a $ character (as in the examples above).
- They are not enclosed by single quotes (').

For the most part, both double-quotes and single-quotes can be used to delimit character strings. However, if a variable name is preceded by a $ character in a double-quote delimited string then it is expanded normally. If the variable name is enclosed in single-quotes then it is not.

For example:

```bash
set MYVAR="James";

echo "My name is $MYVAR"; // echoes "My name is James"

echo 'My name is $MYVAR'; // echoes "My name is $MYVAR"
```

Special "escape" characters in strings are automatically expanded:

| Character| Description|
| --- | ---|
| \t | expands to a tab. |
| \n | expands to a newline. |
| \r | expands to a carriage-return. |
| \u00xx | expands to the character represented by the 2 hex digits xx (but only if the character is in the range 0x20-0x7F (32-127). |
| \\ | expands to \ |
| \" | expands to " |
| \' | expands to ' |

You can prevent this expansion by prefixing the string with a @ character:

```bash
seta="hello\there";

setb=@"hello\there";

echo$a; // echoes hello\here

echo$b; // echoes hello\there
```

If the variable being referenced contains a period (dot) – for example if you're dereferencing an array member – then you must enclose the variable name in braces:

```bash
${array.member}
```

As described above, this also applies when referencing properties or methods in _DMScript_ objects.

You can always use braces around variable names. For example:

```bash
$myvar

and

${myvar}

are equivalent.
```

Use braces to tell _DMScript_ when the variable name ends when it is not otherwise obvious. For example:

```bash
set myvar1 = 12;

set myvar1a = 24;

echo $myvar1a; // echoes 24

echo "${myvar1}a"; // echoes 12a
```

## Statement Blocks

Statements can be grouped together in blocks by surrounding the statements with braces.

Example:

```bash
if ($x=1) {

// these statements all execute if x equals 1

echo "statement 1";

echo "statement 2";

}
```

## Operators

_DMScript_ has the usual operators you would expect in a conventional scripting language.

| **Operator** | **Description** | **Example** |
| --- | --- | --- |
| + | <ul style="list-style-type: none;"><li>Integer addition</li><li>Date offset</li><li>App Version tree walk</li><li>Array/List joining</li><li>String Concatenation</li></ul> | <ul style="list-style-type: none;"><li>2 + 2 = 4</li><li>$date + 7200 = 2 hours later</li><li>$av + 1 = successor</li><li>arr3 = $arr1 + $arr2</li><li>str3 = $str1 + $str2</li></ul> |
|-|<ul style="list-style-type: none;"><li>Integer subtraction</li><li> Date difference</li><li> Date negative offset</li><li> App Version tree walk</li></ul>|<ul style="list-style-type: none;"><li>5 - 2 = 3</li><li> $date1 - $date2 = X seconds</li><li> $date - 3600 = an hour earlier</li><li> $av - 2 = grandfather </li></ul>|
| \* | <ul style="list-style-type: none;"><li>Integer Multiplication</li></ul>| <ul style="list-style-type: none;"><li>2 \* 2 = 4 </li></ul>|
| / | <ul style="list-style-type: none;"><li>Integer division </li></ul>|<ul style="list-style-type: none;"><li>5 / 2 = 2</li><li>1 / 0 = \<empty\></li></ul>|
| % | <ul style="list-style-type: none;"><li>Integer modulus </li></ul>| <ul style="list-style-type: none;"><li>5 % 2 = 1 </li></ul>|
| & or -a | <ul style="list-style-type: none;"><li>Logical and</li></ul> |<ul style="list-style-type: none;"><li> true & true = true</li></ul> |
| l or -o | <ul style="list-style-type: none;"><li>Logical or</li></ul> | <ul style="list-style-type: none;"><li> true & false = true</ul></li> |
| Unary-  | <ul style="list-style-type: none;"><li>Unary minus</li></ul> | <ul style="list-style-type: none;"><li>-1 = -1</li></ul> |
| ! | <ul style="list-style-type: none;"><li>Logical not </li><li>String set test</li><li>Object ref test</li></ul> | <ul style="list-style-type: none;"><li>!true = false</li><li> !0 = true or !"" = true</li><li>!null = true</li></ul> |
| () | Sub-expression | Changes precedence |
| = or -eq | Equals | Boolean, Integer, String, Object |
| != or -ne | Not equals | Boolean, Integer, String, Object |
| > or -gt | Greater than | Boolean, Integer, String, Object |
| >= or -ge | Greater than or equal to | Boolean, Integer, String, Object |
| < or -lt | Less than | Boolean, Integer, String, Object |
| <= or -le | Less than or equals to | Boolean, Integer, String, Object |
| ~ | Matches | Right Hand Side is regular expression. |

**Examples:**

```bash
set a=2;

set b=5;

set c=7;

echo $a+$b; // echoes 7

echo $c-$a; // echoes 5

echo $b\*$c; // echoes 35

echo $c/$b; // echoes 1

echo $c%$b; // echoes 2

echo $a\*$b+$c; // echoes 17

echo $a\*($b+$c); // echoes 24

set app = get_Application_("ITGuys;2"); // gets an _Application_

set app=$app-1; // get the predecessor

echo "${app.name}"; // echoes ITGuys;1

set a="hello";

set b="there";

echo $a+$b; // echoes hellothere

set list1={"hello","from"};

set list2={"Deploy","Hub"};

set list3 = $list1 + $list2;

echo $list3; // echoes ["hello","from","Deploy","Hub"]
```

When adding associative arrays, the keys are merged and values from the 2nd array replace the ones in the first:

```bash
set arr1={"key1": 1, "list1": [1,2,3], "key2": 2};

set arr2={"key1": 9, "list2": [4,5,6], "key3": 3};

set arr3=$arr1+$arr2;

echo $arr3;

This will echo:

{"key3":3,"list1":[1,2,3],"list2":[4,5,6],"key1":9,"key2":2}
```

Note that key1 exists in both arrays and has been replaced with the value of key1 from arr2.

## String Concatenation

Strings can be concatenated (joined together) by using a + operator or by simply placing individual strings where a single variable would normally go.

**Examples:**

```bash
seta="hello" " " "there";

echo$a; // echoes hello there

set a="$a" " this is a test";

echo $a; // echoes hello there this is a test
```

When concatenating strings in this way, do not put any white space between the strings. If you want to put whitespace, it will be necessary to enclose variables in double quotes as shown in the example above.

**Example:**

```bash
set a="hello";

set b=$a$a; // correct (b="hellohello")

set b = $a $a; // syntax error

set b = "$a" "$a"; // correct (b="hellohello")

set b = "$a $a"; // correct (b="hello hello")
```

## Variable Substitution

It is possible to set a value for a variable only if the variable is not currently defined. Similarly, it is possible to only set a value for the variable if it is already set to another value. This is similar to the way Korn shell operates and uses identical syntax:

:+ denotes if unset

and

:- denotes if set.

**Examples:**

```bash
set foo1 = "hello";

echo ${foo1:-'defval'}; // echoes "hello" (since foo1 is set)

echo ${foo2:-'defval'}; // echoes "defval" (since foo2 is unset)

echo ${foo1:+'defval'}; // echoes "defval" (since foo1 is set);

echo ${foo2:+'defval'}; // echoes blank (since foo2 is unset);

```

This can be used when concatenating values into a string:

```bash
set list = ${list}${list:+','}${foo};

```

The first time this is called (withlistnot set) thenlistwill be set to the value of foo. This is because${list:+','}is substituted with a null string sincelist is not set. This is the equivalent of:

```bash
set list = ${list}${foo};
```

The second time this is called (withlistset) then${list:+','}will expand to ","(sincelistis set). This is the equivalent of:

```bash
set list = "${list}" "," "${foo}";
```

## Expression Substitution

It is possible to evaluate expressions and return the result as a string which can then be processed. To do this use the $(…) syntax. Anything between the opening and closing braces is evaluated and the results returned as a string.

**Examples:*

```bash
echo "Here is an expression: $(23\*72)";

Will echo:

Here is an expression: 1656
```

You can use this to call external _Functions_ or _Procedures_ and capture the results back into a _DMScript_ variable. For example, suppose you had a "local external script or program" _Procedure_ called testscript containing the following code:

```bash
@echo off

echo "hello from myscript.bat!";

This DMScript:

echo "here's the result of testscript: $(testscript())";

Will echo:

here's the result of testscript: hello from myscript.bat
```

## Scope

Variables exist in the _Function_ or _Procedure_ in which they are defined. When the _Function_ or _Procedure_ exits, the variable is no longer in scope and cannot be accessed.

As an example, suppose you have created a _Function_ in a domain called "myfunc". This _Function_ takes two parameters (arg1 and arg2) and simply multiplies them together and returns the result.

```bash
myfunc:

set x=99;

return $arg1\*$arg2;
```

This _Function_ can be called like this:

```bash
set x=20;

set res = myfunc(10,20); // res will be 200

echo "$res $x"; // echoes 200 20
```

Note, the value of x is still 20, even though the _Function_myfunc contains the line set x=99. This is because the variable x in myfunc is _local_ to myfunc. Changing the value in myfunc simply changes the local version of x. The version of x in the calling _Procedure_ is not changed.

You can force a variable to be declared in global scope by using set –g as follows:

```bash
myfunc:

set –g x=99;

return $arg\*$arg2;
```

However, the calling _Procedure_ needs to specify a global version of x as well. Otherwise, the version of x that is used in the calling _Procedure_ is local to that _Procedure_.

```bash
set –g x=20;

set res = myfunc(10,20); // res will be 200

echo "$res $x"; // echoes 200 99
```

By using the –g option to set in both the calling _Procedure_ and the called _Function_, the version of x that both use is the same global variable.
