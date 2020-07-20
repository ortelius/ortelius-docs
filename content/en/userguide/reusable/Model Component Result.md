**_Component_ Result Object**

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| success | boolean | Is true or false depending on the success or failure of the query. If success is false, then result is not returned and a text field named "error" is returned instead. | No |
| result |  An array of _Component_ Objects. | JSON  array of _Component_ Object one for each environment returned by the query (if success is true). | No |
