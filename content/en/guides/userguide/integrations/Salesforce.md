---
title: "SalesForce"
linkTitle: "SalesForce"
weight: 70
description: >
  Deploying SalesForce objects with Ortelius.
---

## Using a _Custom Action_ for SalesForce Deployments

If you are developing your _Applications_ using SaleForce, this integration will allow you to support SalesForce deployments. By creating this _Custom Action_ you can replace the Ortelius standard deployment processing engine and instead use a process designed specific to Salesforce including the mapping of Ortelius _Environments_ to different SalesForce regions such as testing, pre-production, production, where the class and package files can be deployed.

The following directions allows you to create a _Custom Action_ using the pre-written Ortelius _Procedures_ to support a SaleForce deployment model.  Once you create your SalesForce _Custom Action_ you assign it to your SalesForce _Component_ which will override the Ortelius standard deployment engine.

## Steps for Creating Your SalesForce _Custom Action_

You will need to create a SalesForce _Custom Action_ that will support your SalesForce deployment . This is done by adding the Ortelius pre-defined _Procedures_ and then defining them to a _Custom Action_ that your _Component_ will use for deployment.  For more details on creating _Procedures_ and _Actions_ see:

- [Customizing Actions](/guides/userguide/customizations/2-define-your-actions/)
- [Procedures and Functions](/guides/userguide/customizations/2-define-your-functions-and-procedures/)

The following steps will take you through the process:

### Step 1 - Create a SalesForce _Repository_

A _Repository_ of the type "File System" is used to reference files pulled from Git.  For this reason, you will need to create a Ortelius "File System" _Repository_.  To create this _Repository_ see [Connect Your Repositories](/guides/userguide/first-steps/2-define-repositories/).

### Step 2 - Create a SalesForce _Credential_

You will need a Ortelius _Credential_ to login to Salesforce for the deployment step. To create this _Credential_ see [Create Your Credentials](/guides/userguide/first-steps/2-define-your-credentials/).

### Step 3 - Create a SalesForce _Environment_ and _EndPoint_

You will need to create an _Endpoint_ and then an _Environment_ for your SalesForce deployment. You can create as many _Environments_ as needed based on your SalesForce Regions. See the [Define Your Endpoints](/guides/userguide/first-steps/2-define-endpoints/) and [Build Your Environments](/guides/userguide/first-steps/2-define-environments/) sections for more information.  The following parameters should be used when defining your _Endpoint_ and _Environment_.

- **_Endpoint_ Detail Settings**

Create a new _Endpoint_ using the following Detail values:

| Detail Field | Value |
| --- | ---|
|**Endpoint Operating System**| Linux|
|**Endpoint Type**| Application Server|
|**Hostname**| localhost|
|**Protocol**| ssh |
|**Base Directory**| /tmp |
|**Credentials** | not required |

- **_Environment_ Attributes**

Using the Attributes section of the _Environment_ Dashboard, add the following Attributes. Use the +Add in the Attributes section to add a row to the Attributes table.  You must use Save to commit the row to the table.

| Variables | Value |
|--- | --- |
| **SalesforceCredential**| Enter the name of the _Credential_ that contains the Salesforce Userid and Password created in step 2.|
|**ServerURL** |Enter the Salesforce URL for the target deployment.|
 **SalesforceRepo** | Enter the name of the File System _Repository_ created in Step 1.|
| **TestLevel** | Salesforce Test Case Level.|

### Step 4 - Create Your SaleForce _Procedures_

You will import and use pre-defined _Procedures_ to create your _Custom Action_.  Import the most current GitCheckout, RunAnt, SalesforceCredential and SalesforceDeploy _Procedures_/_Functions_ from [Ortelius Git Repo](https://github.com/ortelius/ortelius/blob/master/procedures/).

The following files need to be retrieved:

- **GitCheckout.re** - This _Procedure_ checks-out the files from your git repository to the Ortelius eninge and then checks out the commit, branch or tag specified.

- **RunAnt.re** - This _Procedure_ runs Ant

- **SalesforceCredential.re** - This _Procedure_ exposes the credential for the Salesforce Deploy _Procedure_

- **SalesforceDeploy.re** - This Procedure executes Ant against a dynamically created build.xml file to upload the classes to Salesforce.

Once downloaded, you will need to Import the scripts into Ortelius as _Procedures_. To import these _Procedures_ navigate to the _Func/Procs_ Menu option on the left hand side of the Ortelius Main Menu panel. This will take you to the _Functions and Procedures_ List View. From the _Functions and Procedures_ List View select the **Import** option. The Import will bring you to your operating system "file open" dialog box for selecting the GitCheckout.re, RunAnt.re and SalesforceCredential.re and SalesforceDeploy.re files.

Next, select your "Global," or highest level, _Domain_ and upload the _Procedure_ into Ortelius. If you select a lower level _Subdomain_ you will restrict access.  By defining it to your highest level _Domain_, all _Users_ will be able to see the _Procedures_. Once you have both imported, you are now ready to create your _Action_.

### Step 5 - Create your SalesForce _Action_ using your _Procedures_

Once you have imported the SalesForce files as _Procedures_, you ready to define your _Custom Action_. Navigate to the _Actions_ list view from the _Actions_ menu option on the left hand side of the Ortelius Main Menu panel.

Use the +Add option to create a new _Action_ for you _Procedure_. In the "Full Domain" field select your "Global" _Domain_. If you select a lower level _Subdomain_ you will restrict access to this _Custom Action_.  By defining it to your highest level _Domain_, all _Users_ will be able to execute the process regardless of their _SubDomain_.

Name the new Action "SalesForceAction" (no spaces).

Now we are going to customize this _Action_. On the right hand side, you will see a list of _Functions_ and _Procedures_ you can choose from.  Navigate to your _Domain_ to find the files imported as _Procedures_.  Drag them onto the area under "Start". The order should be:

-GitCheckout
-SalesforceCredential
-SalesforceDeploy

Note: RunAnt is reference by the SalesforceDeploy _Procedure_ and does not need to be included in the _Action_.

When you drag your Ansible _Procedures_ onto the area under "Start" a pop-up dialog box will open for you to complete the following parameters:

#### GitCheckout Parameters

| **Field** | Value | Description |
| --- | --- | --- |
| **Title** | Not Required | Name of the step in your deployment workflow.  |
| **Summary** | Not Required | Enter a summary of this step. |
| **Git Repo** | $GIT_URL| Git Repo containing your SalesForce Source Code.|
| **Git Commit** | $GIT_COMMIT | The commit, tag or branch to checkout. |
| **To Dir** | $GIT_DIR | The directory to checkout into.  Use "." for the default directory. |

#### SalesforceCredential Parameters

| Argument | Description |
|--- | --- |
| **Credential Name** | Name of the Credential your created in step 2 above. |

#### SalesforceDeploy Parameters

| Argument | Description |
|--- | --- |
| User | Taken from the SalesForceCredential _Procedure_.|
| Password | Taken from the SalesForceCredential _Procedure_|
| ServerUrl | The Salesforce region to be deployed to. |
| Repo | The _Repository_ where the class and packages exist, typically a filesystem type _Repository_.|
| TestLevel | When test cases are run, which level (All, Some, etc.). |

At this point the _Custom Action_ is ready to be used by anyone with access (based on Domain and security options). Each _Component_ that uses the _Custom Action_ will need to define specific values. Because this new _Custom Action_ is reusable, no _Component_ variables are defined at the _Action_ level.

### Step 6 - Create Your SalesForce _Component_

Now that you have defined your SalesForce _Custom Action_ you are ready to create your SalesForce _Component_. Define your _Component_ to use a _Custom Action_ from the _Component_ Dashboard. See [Defining Components](/guides/userguide/publishing-components/2-define-components/) for more details on creating your new _Component_.

Update the _Custom Action_ Detail field by choosing the SalesForceAction provided in the _Custom Action_ dropdown list. You will have a single parameter to update:

| **Parameter**|**Description**|
| ---| --- |
|**Repository**| Select your SalesForce Repository.|

### Step 7 - Set Your _Component_ Attributes_

The following variables must be added to the Attributes Section for all  _Components_ using the SalesForceAction _Custom Action_.  The Attributes section can be found on the _Component_ Dashboard.  Use the +Add option in this section to add a row for the variable. You must use Save to commit the row to the table:

| Variables | Description |
|--- | --- |
| **GIT_URL** | git url for the git repository. This is used in the git check out step executed by the SalesForce _Action_.|
|**GIT_COMMIT** |The commit hash for the version to be checked out from the git repository.|
|**GIT_DIR**| The temporary directory is used by git to clone and checkout. This parameter should be a directory defined in a Ortelius _Repository_ for the_Component_ to find the files.|

You are now ready to assign your SalesForce _Component_ to an _Application_ and perform a deployment to one of the SalesForce _Environments_.
