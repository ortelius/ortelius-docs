**_Calendar Event_ Object**

| Name        | Type                                   | Description                                                                              | Required |
|-------------|----------------------------------------|------------------------------------------------------------------------------------------|----------|
| allday      | boolean                                | Is a Boolean indicating whether the event is an "all day" event.                         | No       |
| application | _Application_ Object (see below)       | Application associated to the event.                                                     | No       |
| created     | _Event Timestamp_ Object (see below) ) | Creation time of the event.                                                              | No       |
| creator     | _Event Creator_                        | Creator of the event.                                                                    | No       |
| starttime   | _Event Timestamp_ Object (see below)   | Start time of the event.                                                                 | No       |
| endtime     | _Event Timestamp_ Object (see below)   | Ending time of the event.                                                                | No       |
| deployid    | integer                                | Is the ID of the deployment (if this is a deployment record), 0 otherwise.               | No       |
| desc        | string                                 | Is the Description of the event.                                                         | No       |
| environment | _Event Environment_ Object (see below) | Environment for the even.t                                                               | No       |
| id          | integer                                | Is the internal event id.                                                                | No       |
| pending     | boolean                                | Is a Boolean indicating whether the event is awaiting approval by the environment owner. | No       |
| title       | string                                 | Is the event title.                                                                      | No       |
| type        | string                                 | Is the event type.                                                                       | No       |
