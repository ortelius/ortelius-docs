---
title: "Tomcat"
linkTitle: "Tomcat"
weight: 74
description: >
  Executing deployments requiring a Tomcat Server.
---

## Integrating Tomcat into Your Deployment Logic

Ortelius integrates with Tomcat for managing deployments where you need to stop and start the Tomcat server as part of your deployment logic. _Actions_ for Tomcat Windows servers are pre-defined within Ortelius. At the _Application_ level, you define _Pre_ and _Post_ _Actions_ that perform the calls to stop and then start Tomcat. You will be creating new _Procedures_ and _Actions_ to complete this setup.  For more information see:

- [Customizing Actions](/userguide/first-steps/2-define-your-actions/)
- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)

The following steps will take you through the process.

## Creating Pre and Post _Actions_ for Starting/Stopping Tomcat

**Step 1 - Download and Import the Tomcat Stop and Start scripts as _Procedures_**

Download the the most current Ortelius Tomcat Procedures from the [Ortelius Git Repo](https://github.com/ortelius/ortelius/blob/master/procedures/). There will be two:

- **TomcatPreDeploy.re**:  This _Procedure_ stops your Tomcat Server.

- **TomcatPostDeploy.re** – This _Procedure_ starts your Tomcat Server.

**Step 2 - Create your Tomcat _Procedures_**

Once downloaded, you will need to Import the scripts into Ortelius as _Procedures_. To import these _Procedures_ navigate to the _Func/Procs_ Menu option on the left hand side of the Ortelius Main Menu panel. This will take you to the _Functions and Procedures_ List View. From the _Functions and Procedures_ List View select the **Import** option. The Import will bring you to your operating system "file open" dialog box for selecting the TomcatPreDeploy.re and TomcatPostDeploy.re files.

Next, select your "Global," or highest level, _Domain_ and upload the _Procedure_ into Ortelius. If you select a lower level _Subdomain_ you will restrict access.  By defining it to your highest level _Domain_, all _Users_ will be able to see the _Procedures_. Once you have both imported, you are now ready to create your _Action_.

**Step 3 - Create your _Action_ for the Tomcat _Procedures_**

Once you have imported your TomcatPreDeploy.re and TomcatPostDeploy.re files as _Procedures_, you can define your _Actions_. Navigate to the _Actions_ list view from the _Actions_ menu option on the left hand side of the Ortelius Main Menu panel. You will be creating two _Actions_, one for your Tomcat stop step, and the other for the Tomcat start step. One will be called in the _Pre Action_ the other in the _PostAction_.

- Create the TomcatStopAction
Use the +Add option to create your first new _Action_.  In the "Full Domain" field select your "Global" _Domain_. If you select a lower level _Subdomain_ you will restrict access to this _Custom Action_.  By defining it to your highest level _Domain_, all _Users_ will be able to execute the process regardless of their _SubDomain_.

Name the new Action "TomcatStopAction" (no spaces).

Now we are going to customize this _Action_. On the right hand side, you will see a list of _Functions_ and _Procedures_ you can choose from.  Navigate to your _Domain_ to find the TomcatPreDeploy.re imported _Procedure_.  Drag it onto the area under "Start". When you drag the TomcatPreDeploy.re _Procedure_ onto the area under "Start" a pop-up dialog box will open for you to complete the following parameters:

| **Field** | Value | Description |
| --- | --- | --- |
| **Title** | Not Required | Name of the step in your deployment workflow.  |
| **Summary** | Not Required | Enter a summary of this step. | |
| **Tomcat Service Name** | $TOMCAT_SERVICE_NAME| The service running Tomcat |
| **Tomcat Root** | $TOMCAT_ROOT | Tomcat web root |
| **Application Name** | $APPLICATION_NAME | Application name (based on the .war or .ear) |

- Create the TomcatStartAction

Follow the directions above, except name the new Action "TomcatStopAction" (no spaces). Again on the right hand side of the _Action_ Dashboard, you will see a list of _Functions_ and _Procedures_ you can choose from.  Navigate to your _Domain_ to find the TomcatPostDeploy.re imported _Procedure_.  Drag it onto the area under "Start". When you drag the TomcatPostDeploy.re _Procedure_ onto the area under "Start" a pop-up dialog box will open for you to complete the following parameters:

| **Field** | Value | Description |
| --- | --- | --- |
| **Title** | Not Required | Name of the step in your deployment workflow.  |
| **Summary** | Not Required | Enter a summary of this step. | |
| **Tomcat Service Name** | $TOMCAT_SERVICE_NAME| The service running Tomcat |
| **Tomcat Root** | $TOMCAT_ROOT | Tomcat web root |
| **Application Name** | $APPLICATION_NAME | Application name (based on the .war or .ear) |

At this point your new _Actions_ are ready to be used by anyone with access (based on Domain and security options). Each _Component_ that uses the these _Actions_ as Pre and Post steps to the deployment will need to define specific values.

**Step 4 - Assign the TomcatStop and TomcatStart Action to an _Application_**

Create your _Application_ and define your Pre and Post Tomcat _Actions_ using the _Application_ Dashboard. The _Applications_ _Pre-Action_ should be assigned the TomcatStopAction.  This will cause your Tomcat server to be stopped prior to the _Application_ files being deployed.  The _Application's_ _Post-Action_ should be assigned the TomcatStartAction which will start Tomcat after the deployment of your .ear/.war has been completed.  For more information see [Defining Your Application](/userguide/packaging-applications/2-defining-applications/).

**Step 5 - Set Your _Application_ Attributes_**

The following variables must be added to the Attributes Section for your Application using the TomcatStopAction _Pre Action_ and TomcatStartAction _Post Action_.  The Attributes section can be found on the _Application_ Dashboard.  Use the +Add option in this section to add a row for the variable. You must use Save to commit the row to the table:

| Variable Name | Value Description |
|--- | --- |
| **TOMCAT_SERVICE_NAME** | The service running Tomcat |
| **TOMCAT_ROOT** | Tomcat web root |
| **APPLICATION_NAME** | Application name (based on the .war or .ear) |
