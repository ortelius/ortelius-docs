---
title: "Cloud Foundry"
linkTitle: "Cloud Foundry"
weight: 59
description: >
  Deploying to a Cloud Foundry Environment.
---

Ortelius interacts with Cloud Foundry by using the command line process (cf) to connect to the Cloud Foundry _Endpoint_. To deploy a new _Application_ (or to make changes to an existing _Application_) Ortelius uses the "cf push" command to upload the _Application_ to the Cloud Foundry _Endpoint_.

Ortelius _Environments_ are the same as Cloud Foundry "spaces". Since Ortelius is an agentless solution, it can deploy to Cloud Foundry by executing the cf command automatically as part of the deployment process. It can extract your Ortelius _Application_ code from any _Repository_ and push the changes up to the Cloud Foundry _Endpoint_. It can then track which version of the _Application_ is installed in which Cloud Foundry space.

To use the Ortelius integration with Cloud Foundry, you must install Cloud Foundry's Command Line Interface (cf CLI) in a location that can be accessed by Ortelius for execution cf the commands.

To call the cf processes, you define your _Component_ to use a _Custom Action_ that executes a _Procedure_ that calls the cf commands on that Clound Foundry _Endpoint_. For instance, a Cloud Foundry application named my_app could be started by writing a script named startMyApp.sh that looks like:

```bash
#!/bin/sh

cf api https://myexample.com
cf auth myname mypassword
cf target -o myorg -s myspace
cf push `my_app` -c null
```

Ortelius must be able to access your script in order for the _Custom Action_ to work.  Deploying the _Application_ that contains the _Component_ causes the _Action_ to be called, which runs the script and starts the Cloud Foundry _Application_ named my\_app.

Cloud Foundry is ideal for Blue-Green deployment strategies. In such a scenario, Production is mirrored across two distinct environments - "blue" and "green". End Users point to one of these _Environments_ whilst deployments are made to the other. Once testing is complete on the deployed _Environment_, users are switched over to this _Environment_ and the deployment is performed again to the other _Environment_. This maximizes uptime and minimizes the risks in performing a _Rollback_.

Ortelius supports such a Blue-Green deployment strategy. Both _Environments_ can be targeted individually as part of two separate deployments or you can deploy to both with Ortelius deploying to the second _Environment_ automatically following successful test and switch-over.

For more information see:

- [Customizing Actions](/guides/userguide/first-steps/2-define-your-actions/)
- [Procedures and Functions](/guides/userguide/customizations/2-define-your-functions-and-procedures/)
