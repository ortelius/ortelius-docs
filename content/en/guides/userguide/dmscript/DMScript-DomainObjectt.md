---
title: "Domain Object"
linkTitle: "Domain Object"
weight: 45
description: >
  Get a Domain Object.
---

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
