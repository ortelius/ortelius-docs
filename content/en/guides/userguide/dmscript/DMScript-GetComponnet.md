---
title: "Get Components"
linkTitle: "Get Components"
weight: 66
description: >
  Get a Component object based on the Component Name.
---


get_Component_ takes an _Component_ Name and returns the matching _Component Object_.

**Usage:**

get_Component_(FQN)

Where:

FQN: Is the qualified name of the _Component_ to be retrieved.

**Returns:**

_Component_ Object

A qualified name can include as many Domain names as is necessary to uniquely identify the _Component_. If the _Component_ name is unique within the Domains to which the invoking user has access then no qualification is necessary. Only if there is more than one _Component_ with the same name (in different accessible domains) will it be necessary to qualify the _Component_ name with the domain in which it is located.

**Examples:**

_1) Retrieve a Component._

set compobject = get_Component_("WarFile1");

_2) Retrieve a Component specifying the enclosing domain:_

set compobject = get_Component_("Project1.WarFile1");

 |
Further descriptions of _Component_ Objects are found in the high level section named _DMScript_ Objects, in the section named _Component_.

**See Also:**

get_Application_(), getcredential(), get_Environment_(), getserver(), getuser(), getusergroup()
