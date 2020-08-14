---
title: "Get Server"
linkTitle: "Get Server"
weight: 70
description: >
  Gets an Endpoint object based on an Endpoint Name.
---

### Getserver

getserver takes an _Endpoint_ Name and returns the matching _Endpoint Object_.

**Usage:**

getserver(FQN)

Where:

FQN: Is the qualified name of the _Endpoint_ to be retrieved.

**Returns:**

Endpoint Object

A qualified name can include as many Domain names as is necessary to uniquely identify the Endpoint. If the Endpoint name is unique within the Domains to which the invoking user has access then no qualification is necessary. Only if there is more than one Endpoint with the same name (in different accessible domains) will it be necessary to qualify the Endpoint name with the domain in which it is located.

**Examples:**

_1) Retrieve an Endpoint._

set server1 = getserver("Server1");

_2) Retrieve an Endpoint specifying the enclosing domain:_

set server1 = getserver("Project1.Server1");

Further descriptions of _Endpoint_ Objects are found in the high level section named _DMScript_ Objects, in the section named _Endpoint_s.

**See Also:**
