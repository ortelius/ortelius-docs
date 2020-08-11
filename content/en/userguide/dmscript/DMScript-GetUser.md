---
title: "Get User"
linkTitle: "Get User"
weight: 71
description: >
  Gets a User object based on a User Name.
---

Note: A call to the Function _me_ returns a _User_ object representing the current logged in user.

_getuser_ takes a User Name and returns the matching _User Object_.

**Usage:**

getuser(FQN)

Where:

FQN: Is the qualified name of the user to be retrieved.

**Returns:**

User Object

A qualified name can include as many Domain names as is necessary to uniquely identify the user. If the user name is unique within the Domains to which the invoking user has access then no qualification is necessary. Only if there is more than one user with the same name (in different accessible domains) will it be necessary to qualify the user name with the domain in which it is located.

**Examples:**

_1) Retrieve a User._

set user1 = getuser("admin");

echo "Name: ${user1.name}";

echo "Telephone: ${user1.phone}";

_2) Retrieve a User specifying the enclosing domain:_

set user1 = getuser("Project1.User1");

Further descriptions of User Objects are found in the high level section named _DMScript_ Objects, in the section named User.

**See Also:**

get_Application_(), get_Component_(), getcredential(), get_Environment_(), getserver(),getusergroup()
