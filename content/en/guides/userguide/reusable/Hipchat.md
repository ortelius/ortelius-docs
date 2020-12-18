## Hipchat Details

Ortelius allows you to send notifications using _Notifiers_ via HipChat Groups, Topics, or Room features. Notifications are defined to _Components_ and _Applications_ and inform the recipient(s) of the _Component_ or _Applications_ deployment's success or failure. To define your _Notifier_ see [Using Notifiers for Messaging](/guides/userguide/customizations/2-define-notifiers/).

| Field | Description |
| --- | --- |
|**HTML**| If checked, will send email in HTML format.|
|**HTML Override** |If checked will indicate the value can be overridden. This is used for 'scripted' notifications where the action editor includes a 'notify' action. |
|**Logfile**| The location of the log results between Ortelius and Hipchat.|
|**Logfile Encrypted**| The Logfile can be hidden in the Ortelius database. |
|**Logfile Override**| The Logfile location can be changed. |
|**Webhook** |The url for the group chat, topic chat, or chat room.|
|**Webhook Encrypted**| The Webhook can be hidden in the Ortelius database. |
|**Webhook Override**| The Webhook can be changed. |

Assign your Hipchat _Notifier_ to an _Application_ or _Component_ from the Details section of the _Application_ or _Component_ Dashboard. For more information see:

[Define Your _Component_](/guides/userguide/publishing-components/2-define-components/).
[Defining Your Application Baseline](/guides/userguide/packaging-applications/2-defining-applications/).
