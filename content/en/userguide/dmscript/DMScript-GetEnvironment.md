---
title: "Get Environment"
linkTitle: "Get Environment"
weight: 68
description: >
  Get an Environment object based on the Environment Name. 
---

get_Environment_ takes an _Environment_ Name and returns the matching _Environment Object_.

**Usage:**

get_Environment_(FQN)

Where:

FQN: Is the qualified name of the _Environment_ to be retrieved.

**Returns:**

Environment Object

A qualified name can include as many Domain names as is necessary to uniquely identify the Environment. If the Environment name is unique within the Domains to which the invoking user has access then no qualification is necessary. Only if there is more than one Environment with the same name (in different accessible domains) will it be necessary to qualify the Environment name with the domain in which it is located.

**Examples:**

_1) Retrieve an Environment._

set uatenv = get_Environment_("UAT\_Env1");

_2) Retrieve an Environment specifying the enclosing domain:_

set uatenv = get_Environment_("Project1.UAT\_Env1");

Further descriptions of _Environment_ Objects are found in the high level section named _DMScript_ Objects, in the section named _Environment_.

**See Also:**

get_Application_(), get_Component_(), getcredential(), getserver(), getuser(), getusergroup()
