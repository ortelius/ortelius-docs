---
title: "Check Out"
linkTitle: "Check Out"
weight: 27
description: >
  Get files from a specified repository. 
---

_checkout_ takes files from the specified repository and places them into the current _DropZone_. _checkout_ only places the files into the _DropZone_. This allows the files to be processed, manipulated, renamed, or removed before the files in the _DropZone_ are transferred to the target _Endpoint_.

If checkout is called from a _Pre-Action_ on a _Component_ then the files are added into the existing _DropZone_ for the _Component_. You can create a dedicated _DropZone_ for the checkout by placing the checkout into a using _DropZone_ block.

_checkout_ can place files in the _DropZone_ that are not associated with any _Component_ Item.

checkout takes a number of named parameters.

| **Parameter** | **Description** |
| --- | --- |
| repository| Mandatory. The name of the repository to use as a source of files. The repository name can be prepended with as many domain names as necessary to uniquely identify the repository.

The remaining parameters will depend on the chosen repository. The parameters specified will either override the defined properties (if the property is defined as _overridable_) or will be appended to them (if the property is defined as _appendable_). If a parameter attempts to override a property which is not defined as _overridable_ then a runtime error is thrown.

**Example:**

```bash
A custom action for a _Component_ to post a configuration change to a DataPower web appliance:

using stream $config; // create streams

using stream $payload;

using _DropZone_ "dp" {

// get the XML Soap Wrapper from the repository

checkout(repository: "sourcerep", pattern: "soma-config-import.xml");

// checkout the configuration (ZIP file)

checkout(repository: "sourcerep", pattern: "config.zip");

// Convert the config zip to base 64

read(file: "config.zip", stream: $config);

set b64 = ${config.base64encode()};

// place the base64 encoded zip file into the XML wrapper

modify(file: "soma-config-import.xml", modifier: "xml") {

set\_text("/Envelope/Body/request/import/input-file", value: $b64);

}

// Now send the file to the soap interface

read(file: "soma-config-import.xml", stream: $payload);

set res = soap($DP\_TGTURL, $payload);

}
```

The above example is a custom action for a _Component_ which represents a configuration change to be applied to the DataPower web appliance. Such changes are delivered over the appliance's SOAP API and do not involve conventional file transfers. In order to implement this, the custom action first checks out the XML soap body (soma-config-import.xml) and places it into the _DropZone_. It then does the same for the config.zip file (taking the latest version from the specified repository). It converts this config file into a base64 encoded stream and then uses an XML modifier to add this base64 encoded data into the XML SOAP message. Finally, the modified file is read into a stream and sent to the DataPower Web UI (DP\_TGTURL is the URL of the DataPower WebUI and is set as an attribute for the target _Environment_).
