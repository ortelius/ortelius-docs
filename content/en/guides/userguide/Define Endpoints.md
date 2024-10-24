---
title: "Define Your Endpoints"
linkTitle: "Define Your Endpoints"
weight: 9
description: >
  How to Define Endpoints for Environments
---
## Introduction to _Endpoints_

An _Endpoint_ is an object representing a container deployment host, virtual image, or physical server in an enterprise's data center.  _Endpoints_ are where your _Components_ are deployed and used to map where a package vulnerability is running without the need for an _EndPoint_ agent installed into production _Environments_.

A Ortelius _Environment_ is a collection of _Endpoints_. Therefore, there is a many-to-many relationship between _Environments_ and _Endpoints_, so that an _Endpoint_ can be assigned to more than one _Environment_, and an _Environment_ can contain many _Endpoints_.

This data establishes relationships that allow for mapping a vulnerability found at the _Component_ level to the specific _Endpoints_ where it is running.

## Adding _Endpoints_ Via Your CI/CD Workflow

The Ortelius open-source project Command Line Integration (CLI) automates the creation of _Endpoints_. When a deployment is logged, the CLI is passed the _Application Version_, _Environment_, and _Endpoints_. The CLI will automatically create _Endpoints_ and _Environments_ if they do not already exist. If no _Endpoint_ is provided to the CLI, the name of the _Endpoint_ will default to the _Environment_ name. At least one _Environment_ name must be passed to the CLI. For more information, read the [CI/CD and Ortelius](/guides/userguide/integrations/ci-cd_integrations/).

## Use the List View to Add or Delete _Endpoints_

The _Endpoint_ menu is on the left of the main panel. Select the _Endpoint_ menu to view a list of all _Endpoints_ to which you have access. Or use the Search bar, represented by a funnel icon, to reorder _Endpoints_ based on Name or _Domain_.

The _Endpoints_ List View has the following Tabs.

| Tab         | Description                         |
|-------------|-------------------------------------|
| **Refresh** | Refreshes the browser.              |
| **Add**     | Allows you to Add a new _Endpoint_. |
| **Delete**  | Deletes the selected item.          |

Double click on an item in the list to see the _Dashboard_.

## Use the _Endpoint_ Dashboard to View and Edit

The Dashboard view displays all information related to a specific _Endpoint_.

### _Endpoint_ Details

| Field                              | Description                                                                                                                                                                                                                                                              |
|------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Full Domain**                    | The fully qualified name of the _Domain_ to which the _Endpoint_ is defined.  This is a required field.                                                                                                                                                                  |
| **Name**                           | The name of the _Endpoint_ object. For managing Kubernetes clusters, you should name your _Endpoint_ to match the cluster name that the _Endpoint_ is deploying to.  This will allow Ortelius to track what has been deployed to each cluster. This is a required field. |
| **Owner Type**                     | Group or User                                                                                                                                                                                                                                                            |
| **Owner**                          | The owner defaults to the _User_ or _Group_ who created it.                                                                                                                                                                                                              |
| **Summary**                        | A short text description of the _Endpoint_.                                                                                                                                                                                                                              |
| **Created**                        | The date and time the _Endpoint_ was created.                                                                                                                                                                                                                            |
| **Modified**                       | The date and time the _Endpoint_ was last modified.                                                                                                                                                                                                                      |
| **Endpoint Operating System Type** | The platform type of the physical or virtual server that the _Endpoints_ resides on, the list currently includes Unix, Windows, Tandem, Stratus, and OpenVMS. For containers you should select Unix.                                                                     |
| **Hostname**                       | The unique name of a server that is used to identify it on the network.                                                                                                                                                                                                  |
| **Protocol**                       | The protocol used to communicate with the _Endpoint_. Options are ssh and winrm.                                                                                                                                                                                         |
| **ssh Port Number**                | The ssh Port used to connect to the _Endpoint_ if the selected Protocol is ssh.                                                                                                                                                                                          |
| **Base Directory**                 | The directory where the artifacts were deployed.                                                                                                                                                                                                                         |

## Deployed _Components_

This section provides a list of all current versions of _Components_ that have been installed on the _Endpoint_ with the Deployment Number. The Deployment Number is generated by Ortelius for each unique deployment.

{{% include "/guides/userguide/reusable/Attributes.md" %}}

## _Endpoint_ Access Control

The Access Section allows _Users_ within the 3 default _Groups_ to update the _Endpoint_. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ within one of the Access lists will be granted access to the _Endpoint_ in the following ways:

| Access     | Description                                                                |
|------------|----------------------------------------------------------------------------|
| **View**   | Any _User_ in any _Group_ in this list can see the selected _EndPoint_.    |
| **Change** | Any _User_ in any _Group_ in this list can make changes to the _Endpoint_. |
|**Available Groups**|This list contains all the Groups within the Ortelius installation. Dragging and dropping back and forth between this list and the other two lists allows or prevents access to viewing and changing the selected _EndPoint_.

{{% include "/guides/userguide/reusable/OrteliusAuditTrail.md" %}}

### Auditing Deployments

When a deployment is logged via the CI/CD workflow, the output from the deployment can be passed to the CLI to be persisted with the _Application Version_ and _Component Versions_. Learn more about the [CI/CD CLI Integration](/guides/userguide/integrations/ci-cd_integrations/)

