---
title: "Me"
linkTitle: "Me"
weight: 80
description: >
  Get the User Object based on the logged in User.
---

me returns a _User Object_ representing the current logged in user.

**Usage:**

me()

**Returns:**

User Object

**Examples:**

~~~bash
set me = me();

echo "Hello ${me.name}";
~~~

**See Also:**

User()
UserGroup()
UserObject()
