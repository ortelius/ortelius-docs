**_Component_ Object**

| Name           | Type                | Description                                                                                              | Required |
|----------------|---------------------|----------------------------------------------------------------------------------------------------------|----------|
| ID             | integer             | Is the _Component's_ internal ID.                                                                        | No       |
| lastbuild      | integer             | Is the last build number associated with this _Component_ (0 if never built or no associated build job). | No       |
| name           | string              | Is the name of the _Component_.                                                                          | No       |
| summary        | string              | Is the summary text associated with the _Component_.                                                     | No       |
| domain         | string              | The fully-qualified domain name of the _Domain_ in which the _Component_ is located.                     | No       |
| Component_id   | string              | Is the internal ID of the_Component_.                                                                    | No       |
| Component_name | string              | Is the name of the_Component_.                                                                           | No       |
| owneruser      | string              | If the "owner" of the _Component_ is a _User_, then this is the name of that _User_.                     | No       |
| ownergroup     | string              | If the "owner" of the _Component_ is a _Group_, then this is the name of that _Group_.                   | No       |
| predecessor    | _Component Version_ | Parent _Component_ or Predecessor.                                                                       | No       |
