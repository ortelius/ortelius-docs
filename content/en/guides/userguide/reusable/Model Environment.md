**_Environment_ Object**

| Name         | Type                    | Description                                                                              | Required |
|--------------|-------------------------|------------------------------------------------------------------------------------------|----------|
| domain       | string                  | The fully-qualified _Domain_ Name of the _Domain_ in which the _Environment_ is located. | No       |
| ID           | integer                 | Is the internal ID of the _Environment_.                                                 | No       |
| name         | string                  | Is the name of the _Environment_.                                                        | No       |
| owneruser    | string                  | If the "owner" of the _Environment_ is a _User_, then this is the name of the _User_.    | No       |
| ownergroup   | string                  | If the "owner" of the _Environment_ is a _Group_, then this is the name of that _Group_. | No       |
| summary      | string                  | The summary string associated with the environment.                                      | No       |
| applications | An _Application_ Object | The _Application_.                                                                       | No       |
