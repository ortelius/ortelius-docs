## Key Value Configurations

Key Value pairs are stored for any configuration setting that needs to be persisted with the version of the _Object_. For example, pairs can be used to store issue numbers from Jira or GitHub issues with the _Component Version_ and/or _Applications Version_. 

Key Value pairs can be assigned at multiple levels, from the Global _Domain_ down to an individual _Component_ and have a "scope." Lower level Objects can override a higher level Object.  Below is the order in which Key Value Pairs can be overridden:

| Object          | Description                                                                                                     |
|-----------------|-----------------------------------------------------------------------------------------------------------------|
| **Global**      | Contains all Environment variables and any "additional Key Value Pairs" set by the user when running that task. |
| **Environment** | Overrides any Global Key Value Pairs during a deployment.                                                       |
| **Application** | Overrides the _Environment_ Key Value Pairs during a deployment.                                                 |
| **Endpoint**    | Overrides the _Application_ Key Value Pairs during a deployment.                                                |
| **Component** | Overrides the  _Application_ Key Value Pairs during a deployed.

Key Value Pairs can be given any Name and a Value. Use +Add to add Key Value Pairs to the table. Use Save to confirm.  Use the checkbox to Delete or Edit a Key Value Pair.

