---
title: "Architecture"
linkTitle: "Architecture"
weight: 4
description: >
  Understanding Ortelius Architecture and Processing.
---

## Architecture

Ortelius includes a central engine that can be installed locally or from the SaaS offering via a reverse proxy. The central engine connects to external repositories, Continuous Delivery (CD) engines, DevOps tools, data sources, transfer protocols and notification tools. With our open architecture, you plug-in the tool-set you use to define your release configurations.

For releasing _Components_, an agentless architecture supports both a modern architecture of containers as well as legacy systems. If you use solutions like Helm or Ansible to update your cluster, great, we can call those external solutions to perform the updates and provide all the microservice configuration mapping and version information. Ortelius also has plug-ins to continuous delivery pipelines that supports continuous configuration management as part of your release process.

![Architecture](/userguide/images/Architecture.png)

## Reverse Proxy and SaaS

As a SaaS customer, a 'one-way' reverse proxy is used on your side of the firewall. The proxy send requests for deployments every 60 seconds. 

![SaaS Architecture](/userguide/images/ReverseProxy.png)

## Deployments with Custom Actions for Cloud Native Releases

Ortelius integrates with external deployment solutions such as Helm to perform the actual movement of containers to a cluster. When a _Custom Action_ is used, the internal deployment engine is bypassed. This is the easiest way to perform an update to your cluster.

## The Ortelius Engine for Monolithic Releases and Database Updates

Our deployment engine manages monolithic deployments and database updates. It moves files and scripts from source _Repositories_ to a target _Environment_ which contains one or more _Endpoints_. This is performed via _Releases_ or _Applications_, which contain _Components_. _Components_ reference a _Repository_, whose files and scripts are placed into the _Dropzone_. Customized _Actions_  manipulate the files (edit, delete, etc.) within the _Dropzone_. This happens before being deployed in a predetermined order to every _Endpoint_ within the _Environment_. 

Ortelius performs all deployments in an Agentless mode. No remote agents need be installed on the target _Endpoint_ to execute deployments.

A _DropZone_ is created for each _Component_ during a deployment. Files from the _Component_ are placed into the _DropZone_. After the _Component_ has been processed, the files within the _DropZone_ are deployed to the _Endpoints_ within the selected _Environment_. The _DropZone_ is then deleted. Another _DropZone_ is created for the next _Component_, until all _Components_ have been deployed for the _Application_. The next _Application_ version is deployed, and the process starts all over again.

Ortelius uses ftp, ftps, sftp, or Windows protocol to transfer files. When a deployment is executed, Ortelius performs the following steps:

The first _Application_ is moved onto the stack. Any Pre-Action for the _Application_ will be executed at this point.

|Step|Description|
|---|---|
|1| The first _Component_ is moved onto the stack.|
|2| A _DropZone_ is created for the _Component_.|
|3| The first _Component_ is processed. It references specific files from the _Repository_ and these are placed into the _DropZone_. |
|4| If needed, A Pre _Action_ for the _Component_ is performed within the _DropZone_ before deployment. |
|5| The _DropZone_ files are placed into every _Endpoint_ within the _Environment_ where the _Endpoint_ type is the same as the _Component_ type. Keep in mind that a _Component_ can have only one type and an _Endpoint_ can have many types.|
|6|A Post-Action for the _Component_ is performed for cleanup or additional manipulation of files. It is run against every _Endpoint_ with the same _Component Type_ as the _Component_.|
|7|If there are more _Components_, steps 2 through 7 are performed again after a new _DropZone_ is created.
|8|Pre and Post processing _Actions_ defined in the _Application_ or _Release_ are performed on each of the target _Endpoints_ in the _Environments_. Any errors found at the delivery level are logged and may fail the deployment. All logs are reported back to Ortelius and recorded in the Logs section for each _Application_ or _Release_.

The following diagram shows how the deployment process works:

![Deployment Process](/userguide/images/ProcessFlow.jpg)
