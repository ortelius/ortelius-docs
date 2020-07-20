---
title: "Get UserGroup"
linkTitle: "Get UserGroup"
weight: 72
description: >
  Gets a UserGroup object based on a UserGroup Name. 
---

getusergroup takes a UserGroup Name and returns the matching _UserGroup Object_.

**Usage:**

getusergroup(FQN)

Where:

FQN: Is the qualified name of the UserGroup to be retrieved.

**Returns:**

UserGroup Object

A qualified name can include as many Domain names as is necessary to uniquely identify the UserGroup. If the UserGroup name is unique within the Domains to which the invoking user has access then no qualification is necessary. Only if there is more than one UserGroup with the same name (in different accessible domains) will it be necessary to qualify the UserGroup name with the domain in which it is located.

**Examples:**

_1) Retrieve a User.Group_

set group = getusergroup("Developers");

_2) Retrieve a UserGroup specifying the enclosing domain:_

set group = getusergroup("Project1.Developers");

Further descriptions of Group Objects are found in the high level section named _DMScript_ Objects, in the section named Group.

**See Also:**

get_Application_(), get_Component_(), getcredential(), get_Environment_(), getserver(), getuser()
