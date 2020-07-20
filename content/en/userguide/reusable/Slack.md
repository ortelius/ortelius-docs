## Slack Details

Ortelius sends messages to Slack based on certain events using _Notifiers_. Below are the Slack details used when called by _Notifiers_.  To define your _Notifier_ see [Using Notifiers for Messaging](/userguide/customizations/2-define-notifiers/).  

| Field | Description |
| --- | --- |
|**Channel**|  A particular channel within a Workspace. These can be public, private, or shared.|
|**Channel Encrypted** | If checked, the Channel can be hidden in the Ortelius Database.|
|**Channel Override** | If checked, the Channel name can be changed.|
|**Logfile**| The location of the log results between Ortelius and Slack.|
|**Logfile Encrypted**| If checked, the Logfile can be hidden in the Ortelius database. |
|**Logfile Override**| If checked, the Logfile location can be changed. |
|**Webhook** |The url for the group chat, topic chat, or chat room.|
|**Webhook Encrypted**| If checked, the Webhook can be hidden in the Ortelius database. |
|**Webhook Override**| If checked, the Webhook can be changed. |

Assign your Slack _Notifier_ to an _Application_ or _Component_ from the Details section of the _Application_ or _Component_ Dashboard. For more information see:

[Define Your _Component_](/userguide/publishing-components/2-define-components/).
[Defining Your _Application_ Baseline ](/userguide/packaging-applications/2-defining-applications/).