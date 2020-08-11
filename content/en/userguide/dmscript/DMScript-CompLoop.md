---
title: "CompLoop"
linkTitle: "CompLoop"
weight: 28
description: >
  Creats a Component Loop through all Components of an Application.
---


_Comploop_ creates a _Component_ loop through all the _Component_s that make up the _Application_ currently on the stack.

For each iteration through the loop, Ortelius pushes the _Component_ onto the stack. It also filters the current _Endpoint_ list to only include those targeted _Endpoints_. It then executes the code in the body of the loop. When the body has finished executing, the _Component_ is popped off the stack and the _Endpoint_ list is restored. On the subsequent iteration, the next _Component_ is pushed onto the stack and the _Endpoint_ list is re-filtered before the body of the loop is executed again.

**Example:**

```bash

// Print out the _Component_s that make up the current _Application_

comploop {

echo "_Component_ ${_Component_.name}";

// When a _Component_ is pushed onto the stack, the serverlist

// is automatically filtered – print out the _Endpoint_s to which

// this _Component_ will be deployed. (Note, there needs to be

// an _Environment_ on the stack first)

psloop {

echo "Target Server: ${server.name}";

}

}
```

NOTE: The order of the _Components_ is based on the order that the _Components_ are connected in the _Application_ on the stack. Any _Components_ linked in parallel will be presented consecutively during a _comploop_.
