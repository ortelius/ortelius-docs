**_Endpoint_ Object**

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| automd5 | string | Is a Boolean representing if "Auto MD5 Scanning" is set for the _Endpoint_. | No |
| autoping | string | Is a Boolean representing if "Auto Ping" is set for the _Endpoint_. | No |
| basedir | string | Is the base directory for the _Endpoint_. | No |
| comptypes | [ [comptype](/restapi/models/#comptype) ] |  | No |
| credential | string | Is the name of the _Credential_ used to connect to the _Endpoint_. | No |
| domain | string | Is the _Endpoint's_ fully qualified _Domain_. | No |
| environments | [ [environment](/restapi/models/#environment) ] |  | No |
| hostname | string | Is the hostname of the _Endpoint_. | No |
| id | string | Is the _Endpoint's_ internal object ID. | No |
| md5template | string | Is the name of the template to be used for notification should the _Endpoint_ fail an automated mD5 scan. | No |
| name | string | Is the server's name. | No |
| owneruser | string | If the "owner" of the _Endpoint_ is a _User_, then this is the name of the _User_. | No |
| ownergroup | string | If the "owner" of the _Endpoint_ is a user _Group_, then this is the name of that _Group_. | No |
| pingend | string | The time after which auto ping will stop (in format HH:MM) | No |
| pingstart | string | The time at which auto ping will start (in format HH:MM) | No |
| pingtemplate | string | Is the name of the template to be used for notification should the _Endpoint_ failed an automated ping. | No |
| protocol | string | The protocol used to connect to the _Endpoint_. | No |
| summary | string | Any summary text associated with the _Endpoint_. | No |
