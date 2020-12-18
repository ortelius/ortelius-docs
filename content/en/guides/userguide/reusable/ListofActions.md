## Built-In _Actions_

The integration work may already be done with our Built-in _Actions_. Some Built-in _Actions_ are _Functions_ or _Procedures_ that can  delete files in a DropZone, or run a PostGres script. Other Built-in _Actions_ integrate with specific DevOps tools such as Ansible, Helm, Slack or GitHub.

### Built-In Database Actions

| Name | Description |
|---|---|
|**Run SQL Script (Postgres)** | Runs one or more SQL scripts against a Postgres Database. |

### Built-In Deploy Actions

 Name | Description |
|---|---|
| **Checkout** | Extracts items from the specified _Repository_ and places them in the _Dropzone_. |
| **Deploy** | Extracts items from the specified _Repository_ and deploys then to the _Endpoints_ within the targeted _Environment_. Use IF conditions to filter the _Endpoint_ list to those matching the specified criteria. |
 | **Deploy Component** | Deploys the specified _Component_ to the appropriate _Endpoints_ within the targeted _Environment_. |
 | **Execute** | Runs a script on the appropriate _Endpoints_ within the targeted _Environment_. Use IF conditions to filter the _Endpoint_ list to those matching the specified criteria. |
| **Transfer** | Deploys the _Component_ on the stack to the _Endpoint_ on the stack. |

### Built-In Dropzone Actions

 Name | Description |
|---|---|
|**Add File to ZIP** | Puts a _Dropzone_ file into a ZIP/WAR/JAR/EAR file. |
|**Amend File Content** | Modifies a flat file in the _Dropzone_. Set ""Server Specific"" to make a copy specific for each _Endpoint_. |
|**Delete File** | Removes a file from the _Dropzone_. |
|**Extract File from ZIP** | Extracts a named file from a ZIP/WAR/JAR/EAR file. |
|**Iterate through Dropzone** | Loops through each file in the _Dropzone_. |
|**Remove File from ZIP** | Deletes a file from a ZIP/WAR/JAR/EAR archive. |
|**Rename File** | Renames a file in the _Dropzone_. Set ""Server Specific"" to make a copy specific to the current _Endpoint_. |
|**Using Dropzone** | Use a named _Dropzone_. |
|**XML - Add Element** | Adds a New XML element. |
|**XML - Remove Element** | Removes an XML element. |
|**XML - Set Attribute** | Sets an attribute name in an XML element. |
|**XML - Set Text** | Sets the text in an XML element. |

### Built-In Flow Logic Actions

 Name | Description |
|---|---|
|**Calculate MD5** | Calculates the MD5 of a file. |
|**Get Directory** | Returns the contents of a directory into an array. |
|**Abort** | Terminates a deployment with error condition. |
|**Add Two Values** | Add two values and stores the result in a variable. |
|**Add Value to  Variable** | Add a value to a variable. |
|**Echo** | Echoes a message. |
|**If** | General Condition Expression evaluation. Also use this to filter the list of servers based on those matching the specified criteria. |
|**Increment Variable** | Increments a variable. |
|**Parallel** | Execute blocks in parallel. |
|**Run Task** | Execute a Specific Task. |
|**Set Variable** | Creates and sets a variable. |
|**Sleep** | Pauses for n seconds. |
|**Using Stream** | Use a named stream. |
|**Wait for Task** | Wait for a Specific Ortelius Task to be Run. |

### Built-In Loop Actions

 Name | Description |
|---|---|
|**Component Loop** | Loops through each _Component_ that makes up the _Application_. |
|**Loop Through Array Keys** | Loops through each element of an array, setting a variable to each key. |
|**Server Loop** | Iterates through the current set of _Endpoints_. |
|**Version Loop** | Loops through each version between version on target _Endpoint_ and version being deployed. |

### Built-In Tomcat Actions

 Name | Description |
|---|---|
|**TomcatPostDeploy** | Cleans work directory and starts Tomcat. |
|**TomcatPreDeploy** | Shuts down Tomcat before deployment. |

### Built-In WebSphere Actions

 Name | Description |
|---|---|
|**Deploy App** | Deploys an _Application_ to Websphere. |

### Built-In Windows Actions

 Name | Description |
|---|---|
|**Extract Zip** | Extracts the contents of a zip file. |
|**List Services** | Returns a list of installed services into an array. |
|**Start Service** | Starts a Windows Service on the appropriate _Endpoints_ within the targeted _Environment_. Use IF conditions to filter the _Endpoint_ list to those matching the specified criteria. |
|**Stop Service** | Stops a Windows Service on the appropriate _Endpoints_ within the targeted _Environment_. Use IF conditions to filter the _Endpoint_ list to those matching the specified criteria. |

## Built-in _Actions_ that Support DevOps Interoperability

|Action|Description|
|---|---|
| [Ansible](/guides/userguide/integrations/ansible/) | Uses Ansible to perform Deployments. |
| [Cloud Foundry](/guides/userguide/integrations/cloud-foundry/) | Uses Cloud Foundry to perform Deployments. |
| [Helm](/guides/userguide/integrations/helm/) | Uses Helm to deploy Containers. |
| [SalesForce](/guides/userguide/integrations/salesforce/) | Deploys _Applications_ to SalesForce.   |
| [Tomcat](/guides/userguide/integrations/tomcat/) | Deploys to a Tomcat environment.   |
| [WebLogic](guides/userguide/integrations/weblogic/) | Deploys to a WebLogic Environment. |
| [WebSphere](/guides/userguide/integrations/websphere/) | Deploys to a WebSphere Environment.  |
