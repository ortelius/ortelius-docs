---
title: "Component Item Object"
linkTitle: "Component Item Object"
weight: 29
description: >
  Get an array of Component Items for the Component. 
---


The _Component Item_ object represents a _Component_ item within a _Component_. Access to a _Component_ item is only possible by retrieving the array of _Component_ Item objects from the _Component_ Object.

The following properties can be accessed for a _Component_ item object:

| **Property** | **Type** | **Description** |
| --- | --- | --- |
| id | Integer | _Component_ Item id, as used in the database. |
| name | String | _Component_ Item name. |
| summary | String | Summary text. |
| parent | Object | The _Component_ to which this Item belongs. |
| repository | String | The Name of the Repository from which this _Component_ Item pulls files. |
| target | String | The target directory to which the files should be deployed. |
| rollup | Boolean | Whether this _Component_ Item should be deployed during a roll forward operation. |
| rollback | Boolean | Whether this _Component_ Item should be deployed during a roll back operation. |
| properties | Array | An array of Strings representing the values for the Repository Attributes |

**Example:**

```bash
Iterate through the _Component_ items for a _Component_:

iterate(ci: ${Component.items}) {

echo "name=${ci.name}"; // Component Item Name

echo "repository=${ci.repository}"; // Repository Name

echo "target=${ci.target}"; // Target Directory

echo "rollup=${ci.rollup}"; // rollup (true/false)

echo "rollback=${ci.rollback}"; // rollback (true/false)

set props = ${ci.properties}; // Other Properties

echo "properties:";

foreach(p: $props) { // Properties Specific

echo "$p = ${props[$p]}"; // to the Repository

} // for this Comp Item

}
```
