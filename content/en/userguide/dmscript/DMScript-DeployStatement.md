---
title: "Deploy Statement"
linkTitle: "Deploy Statement"
weight: 43
description: >
  Check out and transfer files to and Endpoint.
---

_Deploy_ checkouts and transfers files to the target _Endpoint_(s). The operation of deploy differs depending on what is currently on the stack.

With no parameters, deploy simply deploys the _Component_ currently on the stack to the _Component_'s associated _Endpoint_(s). This requires both a _Component_ and a target _Environment_ to be on the stack. This will be the case during a pre, post, or custom action for a _Component_. You can push a _Component_ onto the stack using the using _Component_ statement. You can push an _Environment_ onto the stack using the using _Environment_ statement.

_deploy_ takes the following parameter:

| Parameter | Description |
| --- | --- |
| repository | Mandatory. The name of the repository to use as a source of files. The repository name can be prepended with as many domain names as necessary to uniquely identify the repository. |

Additional parameters will depend on the chosen repository. The parameters specified will either override the properties defined for the repository (if the property is defined as _overridable_) or will be appended to them (if the property is defined as _appendable_). If a parameter attempts to override a property which is not defined as _overridable_ then a runtime error is thrown.

_deploy_ is generally only required when writing custom actions. During a conventional deployment, checkout is called for a _Component_ before any pre action is executed and transfer is called implicitly to transfer the files to the target _Endpoint_(s) after any pre action has completed. _Pre Action_ on _Components_ can be used to modify the drop zone before the _Component_ is deployed.

## Example

```bash
Deploys all the matching .exe files to every _Endpoint_ in the current _Endpoint_ set:

deploy(repository: "myrep", pattern: "\*.exe");

Example: Deploy all the matching .exe files to every _Endpoint_ with a "GETEXE" attribute set to "Y".

if ($GETEXE = "Y") {

deploy(repository: "myrep", pattern: "\*.exe");

}
```
