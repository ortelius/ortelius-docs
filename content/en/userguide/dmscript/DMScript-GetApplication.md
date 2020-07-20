---
title: "Get Application"
linkTitle: "Get Application"
weight: 65
description: >
  Get the Application object based on Application Name. 
---

get_Application_ takes an _Application_ Name and returns the matching _Application Object_.

**Usage:**

get_Application_(FQN)

Where:

FQN: Is the qualified name of the _Application_ to be retrieved.

**Returns:**

_Application_ Object

A qualified name can include as many Domain names as is necessary to uniquely identify the _Application_. If the _Application_ name is unique within the Domains to which the invoking user has access then no qualification is necessary. Only if there is more than one _Application_ with the same name (in different accessible domains) will it be necessary to qualify the _Application_ name with the domain in which it is located.

**Examples:**

_1) Retrieve an Application._

set appobject = get_Application_("ITGuys");

_2) Retrieve an Application specifying the enclosing domain:_

set appobject = get_Application_("Project1.ITGuys");

Further descriptions of _Application_ Objects are found in the high level section named _DMScript_ Objects, in the section named _Application_.

**See Also:**

get_Component_(), getcredential(), get_Environment_(), getserver(), getuser(), getusergroup()
