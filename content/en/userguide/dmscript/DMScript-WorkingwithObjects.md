---
title: "Working with Objects"
linkTitle: "Working with Objects"
weight: 2
description: >
  Working with Objects using DMScript.
---

_DMScript_ is an object-orientated scripting language. As such, it understands each object in the Ortelius model. You can access each object either by selecting it off the stack (e.g.: $_Environment_), by retrieving a reference to the object from some other object, or by calling a built-in _Function_ to retrieve it. Each object has accessible properties. Some objects also have methods that can be called.

The following is a list of the objects that you can reference in _DMScript_.

- Application
- Change Request
- Components
- Component Items
- Credentials
- Date
- Domain
- DropZone
- DropZone File
- Environment
- Endpoint
- User
- UserGroup

## Attributes

Attributes set against Ortelius objects are accessible as variables in _DMScript_.

For example, suppose QUEUE\_NAME is queue1 in "Test _Environment_ A" and queue2 in "Test _Environment_ B". When deploying to "Test _Environment_ A" the value of $QUEUE\_NAME will be queue1. When deploying to "Test _Environment_ B" the value of $QUEUE\_NAME will be queue2.

You do not need to use any specific syntax to access an Object variable. Whenever a variable is accessed, _DMScript_ will navigate up the _Stack_, looking for the first scope in which the variable is declared. When a variable with a matching name is found, the value at that point is returned. This means that variable values can be overwritten with other values declared higher in the stack. See the high-level section named The Stack for further discussion on this.

# Application Object

The _Application_ object represents either a Base _Application_, an _Application Version,_ or a Release. In **DeployHub Pro** there is always an _Application_ on the stack representing the _Application_/_Release_ being deployed referenced by $_Application_. You can also retrieve an _Application_ using the get_Application__Function_ or push an _Application_ onto the Stack via using _Application_.

NOTE: A _Release_ is a DeployHub Pro Object. It is of the _type__Application_. The release property indicates if the object represents a Release.

The following properties can be accessed for an _Application_ object:

| **Property** | **Type** | **Description** |
| --- | --- | --- |
| id | Integer | _Application_ id, as used in the database. |
| name | String | _Application_ name. |
| fqdomain | String | Fully qualified domain name. |
| summary | String | Summary text. |
| domain | Object | Domain in which the _Application_ is contained. |
| owner | Object | User or UserGroup that owns the _Application._ |
| parent | Object | The Base _Application._ |
| predecessor | Object | Predecessor _Application Version_ (the version on which this version is based). |
| _Release_ | Boolean | true if object is a _Release_, false otherwise. |
| _Applications_ | Array | Array of _Application_ objects if the object is a _Release_  a list of the consituent _Applications_. If the object is not a _Release_, this returns null. |
| _Components_ | Array | Array of _Component_ objects (keyed by _Component_ name) which make up this _Application._ |
| approvals | Array | Array of strings (approved/rejected) keyed by domain name for which the _Application_ is approved/rejected. |
| requests | Array | Array of _Change Request_ objects associated with this _Application_. |
| creator | User | User Object representing the user who created this _Application_. |
| modifier | User | User Object representing the user who last modified this _Application_. |
| ctime | Date | Date Object representing the date/time the _Application_ was created. |
| mtime | Date | Date Object representing the date/time the _Application_ was last modified. |
| attributes | Array | Array of Strings, keyed by Attribute Name |

The following methods can be called on the _Application_ object:

| **Method** | **Return Type** | **Description** |
| --- | --- | --- |
| children(all) | Array | Returns an array of _Application_ objects representing the descendants of this _Application_. If the parameter _all_ is passed as true then the returned array includes all the descendants of the immediate descendants recursively. If the parameter _all_ is omitted or passed as false then the return array only includes the immedate descendants. |
| versions(all) | Array | Synonym for children. Works identically. |
| getatt(attname) | String | Returns the value of the specified attribute held against the _Application_. Parameter is the attribute name. |
| requests(onlyForApp) | Array | Returns an Array of _Change Request_ objects. If onlyForApp is not specifed or passed as false then this is identical to accessing the requests attribute. If onlyForApp is specfied as true then only the change request records associated with the _Application_ itself are returned Note: No change request which is only associated with a consituent _Component_ is returned. This allows you to differentiate between change requests associated with the _Application_ and any of its _Components_. |
| latest(branchname) | Object | Returns the latest _Application Version_ of this _Application_. If branchname is specified then the returned _Application_ Object is the latest version on the specified branch. |

Attributes such as _owner_ and _parent_ return _Objects_. These objects have their own attributes. So, for example, one can get the owner name of an _Application_ by writing:

```bash

set owner = ${_Application_.owner};

echo ${owner.name};

or, more simply:

echo ${_Application_.owner.name};

Get _Application_ Approval Status:

set approvals = ${_Application_.approvals};

foreach(a: $approvals) {

echo "$a : ${approvals[$a]}";

}

// e.g.:

// Test : approved

// Prod : rejected
```

Since the array is keyed on the domain name, you can easily check if the app is approved for a particular domain:

```bash
set approvals = ${_Application_.approvals};

if (${approvals["Test"]} = "approved") {

// _Application_ is approved for Test Domain

}
```

Or you can use dot notation (assuming the target domain name does not contain spaces):

```bash
set approvals = ${_Application_.approvals};

if (${approvals.Test} = "approved") {

// _Application_ is approved for Test Domain

}
```

To iterate through the _Component_s that make up the _Application_:

```bash
set Components = ${Application.Components};

echo "This Application has ${Components.length()} Components";

iterate(c: $Components) {

echo "Component ${c.name} (id ${c.id})";

}
```

# Change Request Object

The _Change Request_ object represents a change request record associated with either a _Component_ or an _Application_. Arrays of _Change Request_ objects are returned by accessing the requests property of an _Application_ or _Component_ object or the requests() method of an _Application_.

The following properties can be accessed for a _Change Request_ object:

| id | String | The change request id. |
| --- | --- | --- |
| name | String | The change request description. |
| status | String | The change request status. |
| api\_url | String | A URL which - if passed to restful\_get - will return an array containing the full details of the change request from the external change tracking system. Useful for getting more information than the id / description / status combination which is stored in Ortelius. |
| html\_url | String | A URL which will direct a browser to the page describing the change request in the external change tracking system. |

# The Component and Component Item Objects

## Component Object

The _Component_ object represents either a _Base Component_ or a _Component_ Version. When deploying an _Application_, _Components_ are pushed onto the stack after each _Endpoint_. They can also be pushed onto the stack by using a comploop, retrieved from an _Application_ by using ${_Application_._Components_} or retrieved by calling _get_Component_.

The following properties can be accessed for a _Component_ object:

| **Property** | **Type** | **Description** |
| --- | --- | --- |
| id | Integer | _Component_ id, as used in the database. |
| name | String | _Component_ name. |
| fqdomain | String | Fully qualified domain name. |
| summary | String | Summary text. |
| domain | Object | Domain in which the _Component_ is contained. |
| owner | Object | User or UserGroup that owns the _Component._ |
| parent | Object | The Base _Component._ |
| predecessor | Object | Predecessor _Component_ Version (the version on which this version is based). |
| items | Array | An array of _Component_ Item objects. These represent the items that make up this _Component_. |
| servers | Array | An array of _Endpoint_ objects. These are the _Endpoints_ to which this _Component_ has been deployed. |
| requests | Array | Array of _Change Request_ objects – the change requests associated with this _Component_. |
| lastbuild | Integer | The last build number for this _Component_. 0 if never built. |
| creator | User | User Object representing the user who created this _Component_. |
| modifier | User | User Object representing the user who last modified this _Component_. |
| ctime | Date | Date Object representing the date/time the _Component_ was created. |
| mtime | Date | Date Object representing the date/time the _Component_ was last modified. |
| attributes | Array | Array of Strings, keyed by Attribute Name |

Attributes such as _owner_ and _parent_ return _Objects_. These objects have their own attributes. So, for example, one can get the owner name of a _Component_ by writing:

### Examples

```bash
set owner = ${_Component_.owner};

echo ${owner.name};

or, more simply:

echo ${_Component_.owner.name};
```

## Component Item

The _Component Item_ object represents a _Component_ item within a _Component_. Access to a _Component_ item is only possible by retrieving the array of _Component_ Item objects from the _Component_ Object.

The following properties can be accessed for a _Component_ item object:

| **Property** | **Type** | **Description** |
| --- | --- | --- |
| id | Integer | _Component_ Item id, as used in the database. |
| name | String | _Component_ Item name. |
| summary | String | Summary text. |
| parent | Object | The _Component_ to which this Item belongs. |
| repository | String | The Name of the Repository from which this _Component_ Item pulls files. |
| target | String | The target directory to which the files should be deployed. |
| rollup | Boolean | Whether this _Component_ Item should be deployed during a roll forward operation. |
| rollback | Boolean | Whether this _Component_ Item should be deployed during a roll back operation. |
| properties | Array | An array of Strings representing the values for the Repository Attributes |

### Example

```bash
Iterate through the _Component_ items for a _Component_:

iterate(ci: ${Component.items}) {

echo "name=${ci.name}"; // Component Item Name

echo "repository=${ci.repository}"; // Repository Name

echo "target=${ci.target}"; // Target Directory

echo "rollup=${ci.rollup}"; // rollup (true/false)

echo "rollback=${ci.rollback}"; // rollback (true/false)

set props = ${ci.properties}; // Other Properties

echo "properties:";

foreach(p: $props) { // Properties Specific

echo "$p = ${props[$p]}"; // to the Repository

} // for this Comp Item

}
```

# Credentials

The _Credential  Object_ can be accessed with the built-in getcredential_Function_but only if the user executing the _DMScript_ has read access to it.

If the _Credential_ can be read, then its attributes can be accessed:

The following properties can be accessed for a _Credential Object_:

| Property | Type | Description |
| --- | --- | --- |
| id | Integer | _Credential_ id, as used in the database. |
| name | String | _Credential_ name. |
| fqdomain | String | Fully qualified _Domain_ name. |
| summary | String | Summary text. |
| domain | Object | Domain in which the _Credential_ is associated. |
| owner | Object | User or UserGroup that owns the _Credential_ |
| username | String | Decrypted username. |
| password | String | Decrypted password. |
| b64auth | String | A string representing the decrypted username and password together, with a : separator and then base64 encoded. Used for Basic Authorization for web-based APIs. See the description of restful\_post, restful\_get and soap in the high level section named Built-In _Functions_ for more information.  |
| creator | User | User Object representing the user who created this _Credential_. |
| modifier | User | User Object representing the user who last modified this _Credential_. |
| ctime | Date | Date Object representing the date/time the _Credential_ was created. |
| mtime | Date | Date Object representing the date/time the _Credential_ was last modified. |
| kind | String | _Credential_ use. |

You can use the _Credential Object_ to access external systems in a secure and controlled manner. The user executing the _DMScript_ must have read access to the _Credential_. However, having read access does not allow the username/password to be viewed or modified using the Web UI. (The username is only displayed for the _Credential_ owner, the username and password can only be changed if the User has update access to the _Credential_).

## Example

```bash
set db2creds = getcredential("db2cred");

set username = ${db2creds.username};

set password = ${db2creds.password};

// username and password can now be used to access external system

b64authcan be used to generate an authorization string for Basic authentication for web- based APIs. For example:

set webcreds = getcredential("mydomain.webcred");

set auth = ${webcreds.b64auth};

set header = {

"Authorization": "Basic $auth"

};

set res = restful\_get("https://myurl",null,null,$header);
```

NOTE: See the description of restful\_get for more information.

NOTE: If you wish to prevent the credential from being decrypted, then you ensure that the right to create _DMScript_ is only granted to power users. Otherwise, a user could create a _DMScript_ to decrypt a credential to which they only have read access.

# Date Object

The _date object_ represents a date/time in _DMScript_. Dates can be created (with the date() or now()_Functions_) or can be retrieved from a _DropZoneFile_ object (which represents a file in the _DropZone_).

The following methods can be called on the _date object_:

| **Method** | **Return Type** | **Description** |
| --- | --- | --- |
| to\_int(secs) | Integer | Returns an integer representing the date as the number of seconds since midnight on January 1st 1970 (epoch). The secs parameter is optional. If specified, the specified number of seconds is added to the date/time before the new value is returned. |
| to\_char(fmt) | String | Formats the date into a string given by the passed fmt string. The fmt string should contain characters as specified below. |

## Date Format Characters

The to\_char() method returns a string which is identical to the passed fmt string with the exception of the special character sequences described below. Where these are present in the fmt string, they are replaced with the relevant _Component_ from the date/time as described below:

| **Sequence** | **Description** |
| --- | --- |
| %a | The abbreviated name of the day of the week according to the current locale. |
| %A | The full name of the day of the week according to the current locale. |
| %b | The abbreviated month name according to the current locale. |
| %B | The full month name according to the current locale. |
| %c | The preferred date and time representation for the current locale. |
| %C | The century number (year/100) as a 2-digit integer. |
| %d | The day of the month as a decimal number (range 01 to 31). |
| %e | Like %d, the day of the month as a decimal number, but a leading zero is replaced by a space. |
| %E | Modifier: use alternative format, see below. |
| %F | Equivalent to %Y-%m-%d (the ISO 8601 date format). |
| %G | The ISO 8601 week-based year with century as a decimal number. The 4-digit year corresponding to the ISO week number (see %V). This has the same format and value as %Y, except that if the ISO week number belongs to the previous or next year, that year is used instead. |
| %g | Like %G, but without century, that is, with a 2-digit year (00-99). |
| %h | Equivalent to %b. |
| %H | The hour as a decimal number using a 24-hour clock (range 00 to 23). |
| %I | The hour as a decimal number using a 12-hour clock (range 01 to 12). |
| %j | The day of the year as a decimal number (range 001 to 366). |
| %k | The hour (24-hour clock) as a decimal number (range 0 to 23); single digits are preceded by a blank. (See also %H.) |
| %l | The hour (12-hour clock) as a decimal number (range 1 to 12); single digits are preceded by a blank. (See also %I.) |
| %m | The month as a decimal number (range 01 to 12). |
| %M | The minute as a decimal number (range 00 to 59). |
| %n | A newline character. |
| %O | Modifier: use alternative format, see below. |
| %p | Either "AM" or "PM" according to the given time value, or the corresponding strings for the current locale. Noon is treated as "PM" and midnight as "AM". |
| %P | Like %p but in lowercase: "am" or "pm" or a corresponding string for the current locale. |
| %r | The time in a.m. or p.m. notation. In the POSIX locale this is equivalent to %I:%M:%S %p. |
| %R | The time in 24-hour notation (%H:%M). For a version including the seconds, see %T below. |
| %s | The number of seconds since the Epoch, 1970-01-01 00:00:00 +0000 (UTC). |
| %S | The second as a decimal number (range 00 to 60). (The range is up to 60 to allow for occasional leap seconds). |
| %t | A tab character. |
| %T | The time in 24-hour notation (%H:%M:%S). |
| %u | The day of the week as a decimal, range 1 to 7, Monday being 1. (See also %w.) |
| %U | The week number of the current year as a decimal number, range 00 to 53, starting with the first Sunday as the first day ofweek 01. (See also %V and %W.) |
| %V | The ISO 8601 week number of the current year as a decimal number, range 01 to 53, where week 1 is the first week that has at least 4 days in the new year. (See also %U and %W. (Calculated from tm\_year, tm\_yday, and tm\_wday.) |
| %w | The day of the week as a decimal, range 0 to 6, Sunday being 0. See also %u. |
| %W | The week number of the current year as a decimal number, range 00 to 53, starting with the first Monday as the first day of week 01. |
| %x | The preferred date representation for the current locale without the time. |
| %X | The preferred time representation for the current locale without the date. |
| %y | The year as a decimal number without a century (range 00 to 99). |
| %Y | The year as a decimal number including the century. |
| %z | The +hhmm or -hhmm numeric timezone (that is, the hour and minute offset from UTC). |
| %Z | The timezone name or abbreviation. |
| %% | A literal &#39;%&#39; character. |

### Alternate Format Modifiers

Some conversion specifications can be modified by preceding the conversion specifier character by the E or O modifier to indicate that an alternative format should be used. If the alternative format or specification does not exist for the current locale, the behavior will be as if the unmodified conversion specification were used. (SU) The Single UNIX Specification mentions %Ec, %EC, %Ex, %EX, %Ey, %EY, %Od, %Oe, %OH, %OI, %Om, %OM, %OS, %Ou, %OU, %OV, %Ow, %OW, %Oy, where the effect of the O modifier is to use alternative numeric symbols (say, roman numerals), and that of the E modifier is to use a locale-dependent alternative representation.

NOTE: The date is formatted by to\_char using the C _Function_strftime.

# Domain Object

The _Domain_ object represents a domain in _DMScript_. Domain objects can be retrieved from other objects (such as _Endpoints_, _Environments_, _Applications_ etc). The calling user's home domain can be retrieved via ${me.domain}

The following properties can be accessed on the _Domain_ object:

| **Property** | **Return Type** | **Description** |
| --- | --- | --- |
| id | Integer | Domain id, as used in the database. |
| name | String | Domain name. |
| fqdomain | String | Fully qualified domain name. |
| summary | String | Summary text. |
| domain | Object | Domain in which the Domain is contained |
| subdomains | Array | List of _Domain_ objects which are contained within this Domain. |
| Life Cycle | Boolean | true if the Domain contains a Life Cycle, false otherwise. |
| _Applications_ | Array | List of _Application_ objects which are contained within this domain. |
| _Environments_ | Array | List of _Environment_ objects which are contained within this domain. |
| creator | User | User Object representing the user who created this domain. |
| modifier | User | User Object representing the user who last modified this domain. |
| ctime | Date | Date Object representing the date/time the domain was created. |
| mtime | Date | Date Object representing the date/time the domain was last modified. |
| owner | Object | User or UserGroup that owns the Domain. |

# Dropzone and DropZone File Object

## DropZone

The _DropZone Object_ represents a _DropZone_. A _DropZone_ is an area on disk on the Ortelius Server where deployment artifacts are stored and manipulated before onward transmission to the target _Endpoint_(s). A _DropZone_ is placed onto the stack during a using _DropZone_ statement – all operations within this block have access to this _DropZone_ via the _DropZone Object_. A _DropZone Object_ is also present on the stack during pre and post action processing for a _Component_. In this case, the content of the _DropZone_ are the files checked out from the repository for the associated _Component_ Items.

The following properties can be accessed for a _DropZone_ object:

| **Property** | **Type** | **Description** |
| --- | --- | --- |
| name | String | _DropZone_ name. |
| path | String | The full path of the location on disk where the _DropZone_ is located. Useful for passing to external scripts that may need to manipulate files in the _DropZone_. |
| files | Array | An Array of _DropZone Objects_, each one of which represents a file in the _DropZone_. The array is keyed by the full path name of the file. |

The following methods can be called on the _DropZone_ object:

| **Method** | **Return Type** | **Description** |
| --- | --- | --- |
| find(pattern) | Array | Returns an Array of _DropZone Object_, each one of which represents a file in the _DropZone_. The Array is restricted to files whose file name matches the specified pattern. The array is keyed by the full path name of the file. |
| dir() | String | The full path of the location on disk where the _DropZone_ is located. Equivalent to the path attribute. |

## DropZone File

The _DropZone File Object_ represents a file in the _DropZone_. It can be retrieved from the _DropZone_ object via the files property or the find method. Both of these calls return an array of _DropZone File Objects_, keyed on the filename. You can also call dir() on a _DropZone File Object_ that represents a zipfile to get an array of _DropZone File Objects_ representing the zipfile content.

The following properties can be accessed for a _DropZone File Object_:

| **Property** | **Type** | **Description** |
| --- | --- | --- |
| dzpath | String | The relative path of the file in the _DropZone_. |
| repopath | String | The relative path of the file as located in the Repository (this path is relative to the base directory of the repository). |
| size | Integer | The size of the file in bytes. |
| ctime | Date | The creation time of the file. |
| mtime | Date | The modified time of the file. |

The following methods can be called on the _DropZone_File object:

| **Method** | **Return Type** | **Description** |
| --- | --- | --- |
| delete() | Integer | Removes the file represented by the _DropZone File Object_ from the _DropZone_. After this operation the file will no longer be transferred to the target server in any subsequent transfer operation. Returns 1 (true) if the file was successfully removed, 0 otherwise. |
| dir() | Array | If the _DropZone File Object_ refers to a zipfile (including web archive files such as WAR, JAR, EAR) then dir() will return an array of _DropZone File Objects_ which represent the content of the zipfile. The array is keyed by the filename and can be used as input to the zipget and zipdel statements. |

NOTE: See also the description for zipadd, zipget and zipdel.

# Environment Object

The _Environment Object_ represents a deployment target _Environment_. During a deployment, there is always an _Environment  Object_ on the stack representing the current deployment target _Environment_. This can be referenced by $_Environment_. An _Environment Object_ can also be retrieved using the _Get Environment Function_.

The following properties can be accessed for an _Environment_ object:

| **Property** | **Type** | **Description** |
| --- | --- | --- |
| id | Integer | _Environment_ id, as used in the database. |
| name | String | _Environment_ name. |
| fqdomain | String | Fully qualified domain name. |
| summary | String | Summary text. |
| domain | Object | Domain in which the _Environment_ is contained. |
| owner | Object | User or UserGroup that owns the _Environment._ |
| basedir | String | Base directory for deployments. |
| _Endpoints_ | Array | Array of _Endpoint_ objects keyed by name. |
| _Applications_ | Array | Array of _Application_ Objects (_Application_s present in this _Environment_). |
| creator | User | User Object representing the user who created this _Environment_. |
| modifier | User | User Object representing the user who last modified this _Environment_. |
| ctime | Date | Date Object representing the date/time the _Environment_ was created. |
| mtime | Date | Date Object representing the date/time the _Environment_ was last modified. |
| parent | Object | Parent domain. |

The following methods can be called on the _Environment_ object:

| **Method** | **Return Type** | **Description** |
| --- | --- | --- |
| getatt(attname) | String | Returns the value of the specified attribute held against the _Environment_. Parameter is the attribute name. |
| deptime(_Application_) | Date | Returns a Date object representing the last time the specified _Application_ was deployed to the _Environment_. Returns null if the specified _Application_ is not currently on the _Endpoint_. |

Note, that attributes such as _owner_ and _parent_ return other _Objects_. These objects have their own attributes. So, for example, one can get the owner name of an _Environment_ by writing:

```bash
set owner = ${_Environment_.owner};

echo ${owner.name};

or, more simply:

echo ${_Environment_.owner.name};
```

Here is an example of retrieving the _Endpoints_ in the _Environment_:

```bash
set servers = ${_Environment_.servers};

iterate(s: $servers) {

echo "server is ${s.name}";

echo "hostname is ${s.hostname}";

}
```

# Endpoint Object

The _Endpoint_ (_server, container, VM/Cloud Image_) object represents where a deployment will be sent. An _Endpoint_ object can be retrieved by accessing the servers array from an _Environment_ or more typically by running a psloop. This iterates through the current _Endpoint_ list, pushing an _Endpoint_ object onto the stack each time through the loop. This _Endpoint_ object can be referenced by $server.

The following properties can be accessed for an _Endpoint_ object:

| **Property** | **Type** | **Description** |
| --- | --- | --- |
| id | Integer | _Endpoint_ id, as used in the database. |
| name | String | _Endpoints_ name. |
| fqdomain | String | Fully qualified _Domain_ name. |
| summary | String | Summary text. |
| domain | Object |_Domain_ in which the _Endpoint_ is contained. |
| owner | Object | User or UserGroup that owns the _Endpoint._ |
| hostname | String | Hostname (if set) or name otherwise. |
| basedir | String | Base Directory for Deployments. |
| type | String | _Endpoint_ Type, ie: windows, unix, cluster, etc. |
| credential | Object | The Credential Object used to access this _Endpoint_. |
| _Components_ | Array | An Array of _Component_ Objects – the _Components currently installed on this_Endpoint_. |
| creator | User | User Object representing the user who created this _Endpoint_. |
| modifier | User | User Object representing the user who last modified this _Endpoint_. |
| ctime | Date | Date Object representing the date/time the _Endpoint_ was created. |
| mtime | Date | Date Object representing the date/time the _Endpoint_ was last modified. |
| attributes | Array | Array of Strings, keyed by Attribute Name. |

The following methods can be called on the _Endpoint_ object:

| **Method** | **Return Type** | **Description** |
| --- | --- | --- |
| append(path1,path2) | String | Appends path2 to path1, returning the combined path formatted according to the _Endpoint_ type. See append in the previous section for more information. |
| appendstd(path1,path2) | String | Appends path2 to path1, returning the combined path formatted according to the _Endpoint_ type. See appendstd in the previous section for more information. |
| basename(path) | String | Returns the filename _Component_ of the specified path. The structure of the path is based on the _Endpoint_ type. |
| dirname(path) | String | Returns the directory path _Component_ of the specified path. The structure of the path (and the returned String) is based on the _Endpoint_ type. |
| getatt(attname) | String | Returns the value of the specified attribute held against the _Endpoint_. Parameter is the attribute name. |
| deptime(_Component_) | Date | Returns a Date object representing the last time the specified _Component_ was deployed to the _Endpoint_. Returns null if the _Component_ is not currently on the _Endpoint_. |

Note, that the _owner_ attribute returns an _Object_. Such objects have their own attributes.

So, for example, one can get the owner name of an _Endpoint_ by writing:

```bash
set owner = ${server.owner};

echo ${owner.name};

or, more simply:

echo ${server.owner.name};
```

# User Object

The _User object_ represents a user in _DMScript_. _User objects_ can be retrieved as the owner from other objects (such as _Endpoints_, _Environments_, _Applications_ etc.). They can also be returned from a _getuser_ call.

The following properties can be accessed on the User object:

| **Property** | **Return Type** | **Description** |
| --- | --- | --- |
| id | Integer | User id, as used in the database. |
| name | String | User Name. |
| kind | String | Returns "user". Used to differentiate between users and groups where retrieving an owner object. |
| fqdomain | String | Fully qualified domain name. |
| realname | String | The User&#39;s full name. |
| email | String | The User&#39;s email address. |
| phone | String | The User&#39;s telephone number. |
| groups | Array | Array of UserGroup Objects – the UserGroups to which this user belongs. |
| lastlogin | Date | The date/time the user last logged into Ortelius. |
| creator | User | User Object representing the user who created this user. |
| modifier | User | User Object representing the user who last modified this user. |
| ctime | Date | Date Object representing the date/time the user was created. |
| mtime | Date | Date Object representing the date/time the user was last modified. |
| owner | Object | User or UserGroup that owns the User |

# UserGroup Object

The _UserGroup object_ represents a UserGroup in _DMScript_. UserGroup objects can be retrieved as the owner from other objects (such as _Endpoints_, _Environments_, _Applications_ etc.). They can also be returned from a getusergroup call or from a _User_ object (as a list of groups to which the user belongs).

The following properties can be accessed on the UserGroup object:

| **Property** | **Return Type** | **Description** |
| --- | --- | --- |
| id | Integer | _UserGroup_ id, as used in the database. |
| name | String | _UserGroup_ Name. |
| kind | String | Returns "group". Used to differentiate between users and groups where retrieving an owner object. |
| fqdomain | String | Fully qualified _Domain_ name. |
| email | String | The _UserGroup's_ email address. |
| creator | User | User Object representing the user who created this UserGroup. |
| modifier | User | User Object representing the user who last modified this UserGroup. |
| ctime | Date | Date Object representing the date/time the UserGroup was created. |
| mtime | Date | Date Object representing the date/time the UserGroup was last modified. |
| owner | Object | User or UserGroup that owns the UserGroup. |
