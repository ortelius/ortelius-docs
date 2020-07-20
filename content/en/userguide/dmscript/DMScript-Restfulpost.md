---
title: "RESTful Post"
linkTitle: "RESTful Post"
weight: 93
description: >
  Pass data to an external RESTFul API. 
---


_restful\_post_ is used to make POST calls to RESTful based APIs. It takes a single mandatory parameter: the URL to which the message should be sent. There are three optional parameters:

**Usage:**

restful\_post(url[,parameters[,cookiejar[,header |,credential]]])

Where:

url: Is the URL to be POSTed.
| Parameters | Description |
| --- | --- |
|String/Array | Optional: Either a String containing the parameters (e.g: "first=John&amp;surname=Doe" or an array of name/value pairs representing the parameters to be sent to the specified URL. If any value in the array is another array (in other words, the parameters array represents a nested JSON structure) then the Content-Type is set to _Application_/json automatically. By default, Content-Type is set to _Application_/x-www-form-urlencoded. If you want to force the content type to be a specific value, include it in the optional header array.|
|cookiejar | Optional. Either an array of name/value pairs representing the cookies to be set in the request or a String naming an array which will receive any cookies returned from the call.|
|header| Optional: An array of name/value pairs representing extra directives to be included in the header lines sent to the _Endpoint_.|
|credential| Optional: Either a credential object or the name of a credential. Used for basic authentication. This parameter is used instead of the header array. If you want to use both additional header directives and basic authentication you will need to include an Authorization directive in the header array. |

**Returns:**

Array: Associative array containing the JSON/XML returned from the RESTful post. If the returned data is encoded with XML then it is converted into the array structure using the rules outlined for xmlparse above.

restful\_post can be used to post requests to Ortelius' own API.

**Examples:**

```bash
1. Call the Jenkins API to start a build:

echo "Starting build";

set res = restful\_post("http://jenkins:8081/job/IT%20Guys/build");

2. Call the Jenkins API to start a build using a build token:

echo "Kicking off build";

set token={"token":"Ortelius"};

set res = restful\_post("http://mac:8081/job/IT%20Guys/build",$token);

// this is equivalent to:

set res = restful\_post("http://mac:8081/job/IT%20Guys/build","token=Ortelius");

3. Use basic authentication from a Credential:

set cred=getcredential("mycred");

set res = restful\_post("https://serverurl",null,null,$cred);

// which is equivalent to:

set res = restful\_post("https://serverurl",null,null,"mycred");

4. Pass additional header lines along with basic authentication:

set cred=getcredential("mycred");

set header={

"Authorization","Basic ${cred.b64auth}",

"Content-Type": "_Application_/json"

};

set res = restful\_post("https://serverurl",null,null,$header);

5. Connect to a web service and use the returned token in a subsequent call

set U="username";

set P="password";

set SID="serverid";

set login={"auth":{"passwordCredentials":{"username":"$U","password":"$P"}}};

set res = restful\_post("https://identity.api.rackspacecloud.com/v2.0/tokens",$login);

set token = ${res.access.token.id};

set auth={"X-Auth-Token": "$token"}; // Returned token will be included in the header

set res = restful\_get("https://dfw.servers.api.rackspacecloud.com/v2/1025100/servers/$SID",

null,null,$auth);

echo "res is $res";
```

A header directive passed in the array will automatically replace the value that would normally be used by Ortelius. You can use this to change values for Host, Content-Type and User-Agent.

**See Also:**

restful\_get(), soap()
