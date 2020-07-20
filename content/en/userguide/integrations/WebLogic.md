---
title: "Weblogic"
linkTitle: "Weblogic"
weight: 76
description: >
  Executing deployments requiring a Weblogic Server.
---

## Introduction to the WebLogic Ortelius Integration

The Ortelius WebLogic integration supports a WebLogic deployment using a _Post Action_ at the _Component_ level. This _Post Action_  installs your WebLogic solution binaries (.ear, .jar, and .war files) by loading them into the correct WebLogic target.  The process will first send your solution binaries to the the WebLogic Server. The _Post Action_ performs the load into the target.

## Creating the Weblogic Action

This process involves the creation of custom _Procedures_ and a _Post Action_.  For more information on creating _Procedures_ and _Actions_ see:

- [Customizing Actions](/userguide/first-steps/2-define-your-actions/)
- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)

Once downloaded, you will need to Import them into Ortelius as the Procedures. To import these Procedures login to Ortelius and select the _Func/Procs_.  From the list view select  **Import** menu. Select your Domain, such as '_Global_ Domain' and upload the _Procedure_ into the Ortelius.

**Step 1 - Download and Import the WebLogic scripts as _Procedures_**

Download the the most current Ortelius WebLogic Procedures from the [Ortelius Git Repo](https://github.com/ortelius/ortelius/blob/master/procedures/). There will be two:

- **WeblogicCredential.re** - This _Procedure_ exposes the credential for the Weblogic Deploy _Procedure_.

- **WeblogicDeploy.re** - This Procedure executes Ant against a dynamically created build.xml file to upload the classes to Weblogic.

**Step 2 - Create your WebLogic _Procedures_**

Once downloaded, you will need to Import the scripts into Ortelius as _Procedures_. To import these _Procedures_ navigate to the _Func/Procs_ Menu option on the left hand side of the Ortelius Main Menu panel. This will take you to the _Functions and Procedures_ List View. From the _Functions and Procedures_ List View select the **Import** option. The Import will bring you to your operating system "file open" dialog box for selecting the WeblogicCredential.re and WeblogicDeploy.re files.

Next, select your "Global," or highest level, _Domain_ and upload the _Procedure_ into Ortelius. If you select a lower level _Subdomain_ you will restrict access.  By defining it to your highest level _Domain_, all _Users_ will be able to see the _Procedures_. Once you have both imported, you are now ready to create your _Action_.

**Step 3 - Create your _Action_ for the WebLogic _Procedure_**

Once you have imported your WeblogicCredential.re and WeblogicDeploy.re files as _Procedures_, you can define your WebLogic _Action_. Navigate to the _Actions_ list view from the _Actions_ menu option on the left hand side of the Ortelius Main Menu panel.  

Use the +Add option to create your new _Action_.  In the "Full Domain" field select your "Global" _Domain_. If you select a lower level _Subdomain_ you will restrict access to this _Custom Action_.  By defining it to your highest level _Domain_, all _Users_ will be able to execute the process regardless of their _SubDomain_.

Name the new Action "WeblogicDeployAction" (no spaces).

Now we are going to customize this _Action_. On the right hand side, you will see a list of _Functions_ and _Procedures_ you can choose from.  Navigate to your _Domain_ to find the WeblogicCredential.re and WeblogicDeploy.re imported _Procedures_.  Drag them onto the area under "Start". When you drag the WeblogicCredential.re and WeblogicDeploy.re  _Procedures_ onto the area under "Start" a pop-up dialog box will open for you to complete the following parameters.

The order should be _WeblogicCredential_, and then _WeblogicDeploy_.

At this point the Action is ready to be used by anyone with access (based on Domain and security options). Each Component that uses the Action will need to define specific values.
The _Action_ can now be placed into the _Post Action field_ of a _Component_ as part of an _Application_ deployed to a Weblogic region.

### _WeblogicCredential_ Parameters

| **Field** | Value | Description |
| --- | --- | --- |
| **Credential Name** | ${WeblogicCredName} | Name of the Credential to use for the Weblogic Deployment |

### _WeblogicDeploy_ Parameters

| **Field** | Value | Description |
| --- | --- | --- |
| **AdminUrl** | ${AdminUrl} | Admin url for performing deployment on|
| **WeblogicHome** | ${WeblogicHome} | Home directory for Weblogic |
| **UserName** | ${$WLUserName} | Weblogic user name.  This is passed to this _Procedure_ from the WeblogicCredential _Procedure_. |
| **Password** | ${$WLPassword} | Weblogic password. This is passed to this _Procedure_ from the WeblogicCredential _Procedure_. |
| **Id** | ${WeblogicTaskId} | Task identifier of a running deployment task |
| **UserConfigFile** | ${WeblogicConfig} | Config file to use |
| **Action** | ${WeblogicAction} | Action to perform |
| **Name** | ${WeblogicAppName} | Name of the application |
| **Targets** | ${WeblogicTargets} | Targets to perform deployment on |
| **Plan** | ${WeblogicPlan} | Deployment plan to use |
| **Library** | ${WeblogicLibrary} | identifies the deployment as a shared J2EE library or optional package |
| **Source** | ${dep.files} | Archive to deploy |

**Step 4 - Set Your _Action_ to your _Component_**

Place the _Action_ within the _Component's Post Action_ field. When _Application_ deploys its artifacts to the Weblogic server, and the  _Post Action_ at the _Component_ level performs the installation into Weblogic Target.

For more information see:

- [Customizing Actions](/userguide/first-steps/2-define-your-actions/)
- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)

**Step 5 - Set Your _Component_ Attributes_**

The following variables must be added to the Attributes Section for all  _Components_ using the WeblogicDeployAction _Post Action_.  The Attributes section can be found on the _Component_ Dashboard.  Use the +Add option in this section to add a row for the variable. You must use Save to commit the row to the table:

| Variable Name | Value Description |
|--- | --- |
| **WeblogicCredName** | Name of the Credential to use for the Weblogic Deployment |
| **AdminUrl** | Admin url for performing deployment on|
| **WeblogicHome** | Home directory for Weblogic |
| **WeblogicTaskId** | Task identifier of a running deployment task |
| **WeblogicConfig** | Config file to use |
| **WeblogicAction** | Action to perform |
| **WeblogicAppName** | Name of the application |
| **WeblogicTargets** | Targets to perform deployment on |
| **WeblogicPlan** | Deployment plan to use |
| **WeblogicLibrary** | identifies the deployment as a shared J2EE library or optional package |
