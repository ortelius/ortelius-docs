---
title: "User"
linkTitle: "User"
weight: 116
description: >
  Retrieve a User Object.
---

The _User object_ represents a user in _DMScript_. User objects can be retrieved as the owner from other objects (such as _Endpoints_, _Environments_, _Applications_ etc.). They can also be returned from a getuser call. A call to the Function _me_ returns a _User_ object representing the current logged in user.

The following properties can be accessed on the User object:

| **Property** | **Return Type** | **Description** |
| --- | --- | --- |
| id | Integer | User id, as used in the database. |
| name | String | User Name. |
| kind | String | Returns "user". Used to differentiate between users and groups where retrieving an owner object. |
| fqdomain | String | Fully qualified domain name. |
| realname | String | The User's full name. |
| email | String | The User's email address. |
| phone | String | The User's telephone number. |
| groups | Array | Array of UserGroup Objects – the UserGroups to which this user belongs. |
| lastlogin | Date | The date/time the user last logged into Ortelius. |
| creator | User | User Object representing the user who created this user. |
| modifier | User | User Object representing the user who last modified this user. |
| ctime | Date | Date Object representing the date/time the user was created. |
| mtime | Date | Date Object representing the date/time the user was last modified. |
| owner | Object | User or UserGroup that owns the User |
