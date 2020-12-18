---
title: "Create Your Credentials"
linkTitle: "Create Your Credentials"
weight: 3
description: >
  How to Add _Credentials_ to Access _Repositories_ and Deployment _Endpoints_.
---

## Intro to Credentials

_Credentials_ are objects within Ortelius that contain username and password pairs. _Credentials_ access the various objects used to retrieve files, interact with git, execute actions, and deploy files. Each _Credential_ can be assigned to various objects within Ortelius, so that a single _Credential_ could be assigned to many _Endpoints_ with the same username/password pair. _Credentials_ are primarily used for accessing _Endpoints_ and _Repositories_ but can be applied to any object in Ortelius that requires a User Name and Password. _Credentials_ are assigned to _Domains._ Anyone with access to the _Domain_ can view the _Credentials_. Further restrictions can be applied at the _Credential_ access level .

Note:  In order to define a _Repository_ or _Endpoint_ you will need to first define the _Credential_ used to access them.

## Containers and Credentials

You may not need _Credentials_ if you only deploy containers. Ortelius uses Helm to perform container deployments.  Helm interacts with the Kubernetes cluster, Helm Chart Museum and the container registry to pull charts and images for the deployment. _Credentials_ are only needed to access private container registries and private Chart Museums and are assigned at the _Endpoint_ or _Environment_ level.

## Use the Credential List View for Adding or Deleting

_Credentials_ are found under the **Setup** menu on the left of the Ortelius main panel. By selecting the _Credentials_ menu, you see a list of all _Credentials_ to which you have access. You can also use the Search bar, represented by a funnel icon, to filter _Credentials_ based on Name or _Domain_.

The _Credentials_ List View has the following Tabs:

| Tab | Description |
| --- | --- |
|Refresh | Refreshes the browser. |
| Add | Allows you to Add a new _Credential_. You will select from: <ul><li>Encrypted in database</li><li>Private Key</li></ul>|
| Delete | Deletes the selected item. |

By double clicking on an item in the list, you will be taken to the _Dashboard_ view.

## Use the Credential Dashboard for Viewing and Editing

The Dashboard view displays all information related to a specific _Credential_.

### Common _Credential_ Details

| Field | Description |
| --- | --- |
| **Full Domain** | The fully qualified path of the _Domain_ to which the _Credential_ belongs. |
| **Name** | The name of the _Credential._ |
| **Summary** | A general description of the _Credential._ |
| **Type** | The kind of _Credential_. There are two different Types of _Credentials_:<ul style="list-style-type: none;"><li>**Encrypted in Database:** This _Credential_ Type is used to access external _Data Sources_ such as Git or SalesForce. The username/password pair resides in Ortelius' database using 3DES encryption.</li><li>**SSH Private Key:** An operating system level SSH key used to access _Endpoints_ for deployments. </li></ul> |
|**Owner Type**|  _User_ or _Group_.|
|**Owner**| The _User_ name or _Group_ name who created the _Credential_.|
| **Created** | The date and time the _Credential_ was created. |
| **Modified** | The date and time the _Credential_ was last modified. |

### SSH Private Keys for Connecting to _Endpoints_

SSH Private Keys are used to access the _Endpoints_ for deployments over ssh protocol.  These keys are generated at the operating system level and need to be made available to Ortelius in order to connect to the _Endpoints_.
If you are using SSH Private keys, you will find these files in your Home directory under the .ssh directory.  These files need to be created by you using ssh-keygen. ssh-keygen is a Linux or UNIX command line program.  It will generate a id_rsa file or id_dsa file depending on your parameters used.  See [SSH Keygen](https://www.ssh.com/ssh/keygen/) more information on generating and using SSH Private keys. Following are additional detail paramters needed for SSH Private Key.

| Field | Description |
| --- | --- |
| **Username**| The _User_ name who owns the key and will be used for logging in to the _Endpoint_.|
| **Filename** | The fully qualified path to your SSH id_rsa or id_dsa file.|

### Encrypted in Database User and Password Pairs for Accessing External _Data Sources_

This _Credential_ can be used for accessing any external repository or tool such as Git, SalesForce, or any kind of _Data Source_ external to Ortelius.  The data entered into the Username and Password fields is encrypted in the Ortelius database.

| Field | Description |
| --- | --- |
| **Username** | The _User_ name that will be used to access the object. |
| **Password** | The password that will be used to access the object. |

## _Credential_ Access Controls

The Access Section allows _Users_ within designated _Groups_ to update the _Credential_ in various ways. To add a _Group_ to one of the access lists, drag and drop the _Group_ from the Available Groups list onto desired access list. All _Users_ who belong to a _Group_ that appear in one of the Access lists will be granted access to the _Credential_ in the following ways:

| Access | Description |
| --- | --- |
| **View** | Allows the _User_ to see the _Credential_. If the _User_ does not belong to a _Group_ in the View Access list, the _Credential_ will not appear in the List View. |
| **Change** | Allows the _User_ to change the _Credential’s_ characteristics i.e. Name, Summary, etc. |
| **Read** | Allows the _User_ to use the _Credential_ by assigning it to an object such as an _EndPoint_ or _Repository_. |
