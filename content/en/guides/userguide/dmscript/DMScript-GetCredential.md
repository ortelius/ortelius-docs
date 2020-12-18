---
title: "Get Credentials"
linkTitle: "Get Credentials"
weight: 67
description: >
  Get a Credential object based on the Credential Name.
---


getcredential takes an Credential Name and returns the matching _Credential Object_.

**Usage:**

getcredential(FQN)

Where:

FQN: Is the qualified name of the credential to be retrieved.

**Returns:**

Credential Object

A qualified name can include as many Domain names as is necessary to uniquely identify the credential. If the credential name is unique within the Domains to which the invoking user has access then no qualification is necessary. Only if there is more than one credential with the same name (in different accessible domains) will it be necessary to qualify the credential name with the domain in which it is located.

**Examples:**

_1) Retrieve a Credential._

set db2creds = getcredential("DB2LoginCredentials");

set username = ${db2creds.username};

set password = ${db2creds.password};

// username and password can now be used to access external system

_2) Retrieve a Credential specifying the enclosing domain:_

set db2creds = getcredential("Project1.DB2LoginCredentials");

set username = ${db2creds.username};

set password = ${db2creds.password};

// username and password can now be used to access external system

Further descriptions of Credential Objects are found in the high level section named _DMScript_ Objects, in the section named Credential.

**See Also:**

get_Application_(), get_Component_(), get_Environment_(), getserver(), getuser(), getusergroup()
