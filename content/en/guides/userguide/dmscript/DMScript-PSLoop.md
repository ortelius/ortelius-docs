---
title: "PSLoop"
linkTitle: "PSLoop"
weight: 86
description: >
   Create an Endpoint Loop.
---

_PSloop_ creates an _Endpoint_ loop. Provided that there is currently no _Endpoint_ on the stack, it pushes each _Endpoint_ from the current one, set onto the stack in turn and executes the body.

// List all the Endpoints in the current Endpoint set

psloop {
echo ${server.name};
 }

Note, the _Endpoint_-set is initially set to each _Endpoint_ in the target _Environment_. When a _Component_ is pushed onto the stack (when a _Component_ is being deployed) the _Endpoint_-set is "filtered" to only include the _Endpoint_ to which the _Component_ is to be deployed. Thus, if you run psloop in a pre or post action to a _Component_ then it will only iterate around the _Endpoints_ to which the _Component_ will be deployed. You can also use "if" statements to filter the _Endpoint_ list.

**Example:**

```bash
if ($myservice = "Y") {

// The Endpoint list here is filtered to only contain end // points with myservice attribute set to Y.

psloop {

echo ${server.name};

}

}

This will echo the name of each _Endpoint_ with the attribute myservice set to Y.
```
