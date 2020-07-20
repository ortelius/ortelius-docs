---
title: "DataPower"
linkTitle: "DataPower"
weight: 60
description: >
  Deploying and managing DataPower with Ortelius.
---
Ortelius can deploy DataPower the same as it deploys to any _Endpoint_ types, such as docker containers, physical servers, virtual servers, cloud servers, routers, and Gateways. A DataPower multi-channel Gateway provides access, security, and control to a range of mobile devices, web applications, and APIs.

Ortelius can be used to install, configure, and reconfigure DataPower gateways quickly and easily. Due to its agentless architecture, configuration changes to the Data Power gateway can be deployed as standard. Ortelius has built-in _Actions_ that allow zip files to be read, converted to base-64 and embedded into an out-going SOAP message which can then be posted to the Data Power Gateway.

The following example demonstrates how Ortelius' DMScript can be used to make changes to a DataPower installation.

Example: A Ortelius _Custom Action_ for a _Component_ to post a configuration change to a DataPower web appliance:

~~~ bash
using stream $config; // create streams
using stream $payload;
using dropzone "dp" {

// get the XML Soap Wrapper from the repository
checkout(repository: "sourcerep", pattern: "soma-config-import.xml");

// checkout the configuration (ZIP file)
checkout(repository: "sourcerep", pattern: "config.zip");

// Convert the config zip to base 64
read(file: "config.zip", stream: $config);

set b64 = ${config.base64encode()};

// place the base64 encoded zip file into the XML wrapper
modify(file: "soma-config-import.xml", modifier: "xml") {

set_text("/Envelope/Body/request/import/input-file", value: $b64);
}

// Now send the file to the soap interface
read(file: "soma-config-import.xml", stream: $payload);

set res = soap($DP\_TGTURL, $payload);
}
~~~

This above _Custom Action_ is for a _Component_ which represents a configuration change to be applied to the DataPower web appliance. Such changes are delivered over the appliance's SOAP API and do not involve conventional file transfers. In order to implement this, the _Custom Action_ first checks out the XML soap body (soma-config-import.xml) and places it into the Ortelius _Dropzone_ (a temporary area where files are placed just prior to deployment).

It then does the same for the config.zip file (taking the latest version from the specified _Repository_). It converts this config file into a base64 encoded stream and then uses an XML modifier to add this base64 encoded data into the XML SOAP message. Finally, the modified file is read into a stream and sent to the DataPower Web UI (DP_TGTURL is the URL of the DataPower WebUI and is set as an attribute for the target_Environment_).

Data Power configuration changes can be tracked by creating them as a _Component Versions_ and including them in the _Application_ version just like any other _Component_ (such as database changes, application code, and any Ansible infrastructure). Ortelius then knows which configuration is currently installed on each Data Power gateway and can apply and _Rollback_ such configurations as part of the associated _Application_ deployment.

For more information see:

- [Customizing Actions](/userguide/first-steps/2-define-your-actions/)
- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)
