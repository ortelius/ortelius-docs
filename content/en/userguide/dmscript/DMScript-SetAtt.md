---
title: "SetAtt"
linkTitle: "SetAtt"
weight: 95
description: >
  Assings or replaces attributes for a specified object. 
---

_Setatt_ assigns or replaces Key Value Pairs for a specified object. Key Value Pairs are held against _Applications_, _Components_, _Environments_, _Endpoints_, and _Repositories_. _setatt_ allows new values to be stored against such objects or for existing values to be replaced.

_setatt_ takes two mandatory named parameters:

| Parameter| Description |
| --- | ---|
| object | The object to update. This must be a Ortelius object that is either already on the stack or retrieved from another object or from one of the object retrieval _Functions_ (e.g.: get_Environment_ etc). |
| attributes | An array of Key Value Pairs to set as attributes for the specified object. In the Value Pair array, the key is the name of the Key Value Pair and the value is its value. |

**Example:**

```bash
Store the last deployment id, version name, target _Environment_ and date/time stamp against the parent (base) version of the deployed _Application_.

set atts = {

"DeployNumber": "$DEPLOY\_ID",

"Version": "${Application.name}",

"Target": "${Environment.name}",

"DeployTime": "$(now())"

};

setatt(object: ${Application.parent},attributes: $atts);
```

If this is attached to a post-deployment action then whenever an _Application Version_ is deployed, the details of the deployment are stored as Key Value Pairs against the base _Application_.
