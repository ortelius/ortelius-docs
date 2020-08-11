---
title: "Credentials"
linkTitle: "Credentials"
weight: 33
description: >
  Get Credentials.
---


The _credential_ object can be accessed with the built-in getcredential_Function_but only if the user executing the _DMScript_ has read access to it.

If the credential can be read, then its attributes can be accessed:

The following properties can be accessed for a credential object:

| Property | Type | Description |
| --- | --- | --- |
| id | Integer | _Endpoint_ id, as used in the database. |
| --- | --- | --- |
| name | String | _Endpoint_ name. |
| fqdomain | String | Fully qualified domain name. |
| summary | String | Summary text. |
| domain | Object | Domain in which the Credential is contained. |
| owner | Object | User or UserGroup that owns the _Endpoint._ |
| username | String | Decrypted username. |
| password | String | Decrypted password. |
| b64auth | String | A string representing the decrypted username and password together, with a : separator and then base64 encoded. Used for Basic Authorization for web-based APIs. See the description of restful\_post, restful\_get and soap in the high level section named Built-In _Functions_ for more information.
 |
| creator | User | User Object representing the user who created this credential. |
| modifier | User | User Object representing the user who last modified this credential. |
| ctime | Date | Date Object representing the date/time the credential was created. |
| mtime | Date | Date Object representing the date/time the credential was last modified. |
| kind | String | Credential Kind. |

You can use the credential object to access external systems in a secure and controlled manner. The user executing the _DMScript_ must have read access to the Credential. However, having read access does not allow the username/password to be viewed or modified using the Web UI. (The username is only displayed for the Credential owner, the username and password can only be changed if the User has update access to the Credential).

**Example**

```bash
set db2creds = getcredential("db2cred");

set username = ${db2creds.username};

set password = ${db2creds.password};

// username and password can now be used to access external system

b64authcan be used to generate an authorization string for Basic authentication for web- based APIs. For example:

set webcreds = getcredential("mydomain.webcred");

set auth = ${webcreds.b64auth};

set header = {

"Authorization": "Basic $auth"

};

set res = restful\_get("https://myurl",null,null,$header);
```

NOTE: See the description of restful\_get for more information.

NOTE: If you wish to prevent the credential from being decrypted, then you ensure that the right to create _DMScript_ is only granted to power users. Otherwise, a user could create a _DMScript_ to decrypt a credential to which they only have read access.
