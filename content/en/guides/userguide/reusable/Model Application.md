**_Application_ Object**

| Name          | Type    | Description                                                                                                                                                              | Required |
|---------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| completed     | string  | The date/time of the last deployment of this _Application_ into the _Environment_.                                                                                       | No       |
| deploymentid  | integer | The ID of the last deployment of this _Application into the Environment_. An ID of 0 indicates that the _Application_ has been manually associated with the environment. | No       |
| exitcode      | integer | The exit code of the last deployment of this _Application_ into the _Environment_.                                                                                       | No       |
| id            | integer | The internal object ID of the _Application Base Version_.                                                                                                                | No       |
| name          | string  | The name of the _Application Base Version_.                                                                                                                              | No       |
| predecessorid | integer | The ID of the previous _Application Version_.                                                                                                                            | No       |
| versionid     | integer | The ID of the _Application Version_.                                                                                                                                     | No       |
| versionname   | string  | The name of the _Application Version_                                                                                                                                    | No       |
