---
title: "UserGroup"
linkTitle: "UserGroup"
weight: 114
description: >
  Retrieve a UserGroup Object.
---

The _UserGroup object_ represents a UserGroup in _DMScript_. UserGroup objects can be retrieved as the owner from other objects (such as _Endpoints_, _Environments_, _Applications_ etc.). They can also be returned from a getusergroup call or from a _User_ object (as a list of groups to which the user belongs).

The following properties can be accessed on the UserGroup object:

| **Property** | **Return Type** | **Description** |
| --- | --- | --- |
| id | Integer | UserGroup id, as used in the database. |
| --- | --- | --- |
| name | String | UserGroup Name. |
| kind | String | Returns "group". Used to differentiate between users and groups where retrieving an owner object. |
| fqdomain | String | Fully qualified domain name. |
| email | String | The UserGroup's email address. |
| creator | User | User Object representing the user who created this UserGroup. |
| modifier | User | User Object representing the user who last modified this UserGroup. |
| ctime | Date | Date Object representing the date/time the UserGroup was created. |
| mtime | Date | Date Object representing the date/time the UserGroup was last modified. |
| owner | Object | User or UserGroup that owns the UserGroup. |
