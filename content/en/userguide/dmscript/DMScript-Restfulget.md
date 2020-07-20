---
title: "RESTful Get"
linkTitle: "RESTful Get"
weight: 92
description: >
  Retrieve data from an external RESTful API. 
---

_restful\_get_ is used to make GET calls to RESTful based APIs. It takes a single mandatory parameter: the URL to which the message should be sent. There are three optional parameters:

**Usage:**

restful\_get(url[,parameters[,cookiejar[,header |,credential]]])

Where:

url: Is the URL to GET.

| Parameters | Description |
| --- | --- |
| String/Array | Optional: Optional: Either a String containing the parameters e.g: "first=John&amp;surname=Doe" or an array of name/value pairs representing the parameters to be sent to the specified URL.|
| cookiejar | Optional. Either an array of name/value pairs representing the cookies to be set in the request or a String naming an array which will receive any cookies returned from the call. |
|header | Optional: An array of name/value pairs representing extra directives to be included in the header lines sent to the _Endpoint_.|
| credential | Optional: Either a credential object or the name of a credential. Used for basic authentication. This parameter is used instead of the header array. If you want to use both additional header directives and basic authentication you will need to include an Authorization directive in the header array. See below for examples. |

**Returns:**

Array: Associative array containing the JSON/XML returned from the RESTful get. If the returned data is encoded with XML then it is converted into the array structure using the rules outlined for xmlparse above.

restful\_get can be used to post requests to Ortelius' own API.

**Example:**

```bash
1. _Call the Jenkins API to retrieve details for the latest build._

set jenkinsresult = restful\_get("http://jenkins:8081/job/IT%20Guys/lastSuccessfulBuild/api/json");

set buildno = ${jenkinsresult.number};

echo "last successful build = $buildno";

set actions = ${jenkinsresult.actions[0]};

set causes = ${actions.causes[0]};

set shortdesc = ${causes.shortDescription};

echo "short description = $shortdesc";

Result:

last successful build = 184

short description = Started by user anonymous

_2) Retrieve a record from github using basic authentication:_

set cred=getcredential("githubcreds");

set token={"user":"${cred.username}","pass":"${cred.password}"};

set bugid=128

set res = restful\_get("https://api.github.com/repos/$repos/$prod/issues/$bugid",$token);

3) Login to Ortelius and capture the JSESSIONID into a cookie for reuse

set id={

"user": "admin",

"pass": "admin"

};

set res = restful\_get("http://mac:8080/dmadminweb/API/login",$id,"cookiejar");

if (${res.success}) {

// cookiejar now contains the returned cookies (JSESSIONID)

set res = restful\_get("http://mac:8080/dmadminweb/API/server/OM\_DevServer",null,$cookiejar);

if (${res.success}) {

echo "Summary: ${res.result.summary}";

}

}
```

**See Also:**

restful\_post(), soap()
