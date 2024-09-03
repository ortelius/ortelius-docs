---
title: "Intro to APIs and Logging In"
linkTitle: "Intro to APIs and Logging In"
weight: 5
description: >
  Introduction and the Login API
---
APIs can be used to extract and update Ortelius [Objects](/guides/userguide/concepts/basic-concepts/).  The most common use for APIs is to integrate Ortelius into your continuous delivery engine for a continuous configuration management and deploy process.  APIs are generally used for executing deployments, but can also be used to automatically update _Component_ and _Application_ versions.

## Object Accessibility

APIs rely _User and Group_ access to determine if the call is allowed. The Objects that are accessible via the API are restricted based on the logged-in user. Only Objects that are contained within the user's home _Domain_ and any _Subdomains_ are accessible via the API.

If a requested object does not have "read" permission then it cannot be accessed via the API. Similarly, attempting to modify Objects which do not have the appropriate "change" permission is also prohibited. In such cases, the "success" flag returned is "false" and the error is "Permission Denied".

## Logging in to Establishing a Connection

  When issuing calls to the API, the client application must either first issue a "login" call, specifying the username and password or must specify the username and password in each individual call to the API.

## Qualify the Name of the Object

When specifying an Object by name you can always qualify the name by pre-pending it with the name of the _Domain_ in which it is contained. The name of the _Domain_ should be separated from the name of the object by a period.

### Example

~~~bash
    GLOBAL.USA.Development.demoenv

This specifies that the "demoenv" Environment required can be found in the "Development" Subdomain of Domain "USA" which is a Subdomain of "GLOBAL".
~~~

## Use the object's internal ID

Every Object has a unique ID. This is used internally in the database as a primary/foreign key. An Object is given an ID when it is first created and that ID never changes or is re-used, even if the object itself is deleted. Therefore, if you know the ID of the object you can specify that in the API and RE will know which to object you're referring to, even if the name is not unique.

The query tools in the API return the object's internal ID as well as its name. Once you know the ID you can use it in subsequent calls to the API.

To use the ID, just place it where you would normally place the object's name. The APIs will assume you're specifying an ID if the name given is fully-numeric.

_Do not create objects with fully numeric names - Ortelius will not be able to determine if this is an object id or the object name._

## Using cURL to access the API

  Here is an example of how to use cURL to access the API.

  First, we need to login. This operation will return a session ID. We use cURL's --cookie-jar option to store this session ID in the file C:\temp\session.txt

~~~bash
    curl --data "user=omadmin&pass=ompassword" --cookie-jar c:\temp\session.txt http://mac:8080/dmadminweb/API/login
~~~

  If the username/password combination is correct, the user is logged in and the success indication is returned. Now we can call any of the other API interfaces by specifying the same file in which we stored the session ID returned from the login call.

  For example, this will return a JSON array containing all the servers in our home and _Subdomains_ to which we have view access.

~~~bash
    curl --data "all=Y" --cookie c:\temp\session.txt http://mac:8080/dmadminweb/API/servers
~~~

## Login

When issuing calls to the API, the client application must either first issue a "login" call, specifying the username and password or must specify the username and password in each individual call to the API.

### REST Api Endpoint

| HTTP Verb | URL                   |
|-----------|-----------------------|
| GET       | /dmadminweb/API/login |

### Parameters

| Name | Located in | Value             | Required | Schema |
|------|------------|-------------------|----------|--------|
| user | query      | User Id           | Yes      | string |
| pass | query      | Password for User | Yes      | string |

### Responses

| Code | Description                                                                         | Schema                                               |
|------|-------------------------------------------------------------------------------------|------------------------------------------------------|
| 200  | The result will include a cookie. Include this cookie for subsequent calls to APIs. | [success](/guides/userguide/restapi/models/#success) |
