**_Component Version_ Full Detail**

A JSON  object represents the _Component_ being retrieved.

| Name               | Type                                    | Description                                                                                                            | Required |
|--------------------|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------|----------|
| branch             | string                                  | Is the name of the branch on which this _Component_ is located. If no branch is specified, this string is zero length. | No       |
| domain             | string                                  | The fully-qualified domain name of the _Domain_ in which the _Component_ is located.                                   | No       |
| id                 | integer                                 | The internal id of the _Component_ or _Component Version_.                                                             | No       |
| lastbuild          | integer                                 | Last Build number that created the _Component_ or _Component Version_.                                                 | No       |
| name               | string                                  | The name of the  _Component_ or _Component Version_.                                                                   | No       |
| owneruser          | string                                  | If the "owner" of the _Component_ is a _User_, then this is the name of the _User_.                                    | No       |
| ownergroup         | string                                  | If the "owner" of the _Component_ is a _Group_, then this is the name of that _Group_.                                 | No       |
| requests           | Request                                 | A change request Object.                                                                                               | No       |
| summary            | string                                  | Is the summary text associated with the _Component Version_.                                                           | No       |
| component_versions | _Component Version_                     | A specific_Component_ with a unique identifier.                                                                        | No       |
| applications       | _Application Version_ with full details | All details for the _Application Version_.                                                                             | No       |
| predecessor        | The parent of the _Component_           | An earlier _Component Version_.                                                                                        | No       |
