---
title: "Ansible"
linkTitle: "Ansible"
weight: 50
description: >
  Integrating Ansible to perform deployments.
---

## Using Ansible to Perform Deployments

Ortelius supports the ability to run any Ansible Playbook you create.  It does this using pre-defined Ortelius _Procedures_ that you can use to create a Ortelius _Action_ of your choosing.  Once created, you the _Action_ can call any Ansible Playbook. The most common use is for performing deployments, but you can also use the _Action_ to execute _Pre Actions_ or _Post Actions_ to the deployment.

### Ansible as Your Deployment Engine

Ortelius allows you to override the default deployment engine with external deployment solutions such as Ansible. This is supported so you can use your own previously developed Ansbile deployment process instead of re-defining the process to the Ortelius deployment engine.  Or it may be the case that you are experienced with Ansible and choose to continue using it for new deployments. Ortelius uses an Ansible _Action_ that allows you to make a call to your Ansible process and turn over the deployment processing to Ansible.

### How the Ansible _Actions_ Works

The Ansible _Action_ will clone your Playbook Git repository into the working directory of the Ortelius engine (_DropZone_). It will then create a "values" file based on the _Component_ you are deploying, and then it will run your Playbook. The results of your Playbook are included in the deployment log.

### Creating Your Ansible Action

You will need to create an Ansible _Action_ that will use your Ansible Playbook. This is done by adding the Ortelius pre-defined _Procedures_ and then defining them to an _Action_ that your _Component_ will use for deployment.  For more details on creating _Procedures_ and _Actions_ see:

- [Customizing Actions](/userguide/first-steps/2-define-your-actions/)
- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)

The following steps will take you through the process:

**Step 1 - Download and Import the Ansible Playbooks as _Procedures_**

Download the following 3 Ortelius _Procedures_ from the [Ortelius Git Repo](https://github.com/ortelius/ortelius/blob/master/procedures/). These _Procedures_ will support the steps you need to run your own Ansbile Playbook.

- **GitCheckout.re** - This _Procedure_ pulls the repo into the Ortelius _Dropzone_ and then checks out the commit, branch or tag specified.

- **WriteEnv2File.re** - This _Procedure_ writes the _Attributes_ to a file that will be used by the Playbook.

- **RunAnsiblePlayBook.re** - This Procedure executes the Playbook using variables file created by _WriteEnv2File_.

**Step 2 - Create your _Procedures_**

Once downloaded, you will need to Import the scripts into Ortelius as _Procedures_. To import these _Procedures_ navigate to the _Func/Procs_ Menu option on the left hand side of the Ortelius Main Menu panel. This will take you to the _Functions and Procedures_ List View. From the _Functions and Procedures_ List View select the **Import** option. The Import will bring you to your operating system "file open" dialog box for selecting the GitCheckout.re, WriteEnv2File.re and RunAnsiblePlayBook.re files.

Next, select your "Global," or highest level, _Domain_ and upload the _Procedure_ into Ortelius. If you select a lower level _Subdomain_ you will restrict access.  By defining it to your highest level _Domain_, all _Users_ will be able to see the _Procedures_. Once you have both imported, you are now ready to create your _Action_.

**Step 3 - Create your Ansible _Action_ using your _Procedures_**

Once you have imported the Ansible files as _Procedures_, you ready to define your _Action_. Navigate to the _Actions_ list view from the _Actions_ menu option on the left hand side of the Ortelius Main Menu panel.

Use the +Add option to create a new _Action_ for you _Procedure_. In the "Full Domain" field select your "Global" _Domain_. If you select a lower level _Subdomain_ you will restrict access to this _Custom Action_.  By defining it to your highest level _Domain_, all _Users_ will be able to execute the process regardless of their _SubDomain_.

Name the new _Action_ **AnsiblePlaybook** (no spaces).

Now we are going to customize this _Action_. On the right hand side, you will see a list of _Functions_ and _Procedures_ you can choose from.  Navigate to your _Domain_ to find the GitCheckout.re, WriteEnv2File.re and RunAnsiblePlayBook.re imported _Procedures_.  Drag them onto the area under "Start". The order should be _GitCheckout_, _WriteEnv2File_, _RunAnsiblePlaybook_.  

When you drag your Ansible _Procedures_ onto the area under "Start" a pop-up dialog box will open for you to complete the following parameters:

**GitCheckout Parameters**

| **Field** | Value | Description |
| --- | --- | --- |
| **Title** | Not Required | Name of the step in your deployment workflow.  |
| **Summary** | Not Required | Enter a summary of this step. | |
| **Git Repo** | $GIT_URL| Repo containing the Playbook |
| **Git Commit** | $GIT_COMMIT | The commit, tag or branch to checkout |
| **To Dir** | $GIT_DIR | The directory to checkout into.  Use "." for the default directory |

**RunAnsiblePlaybook Parameters**

| **Field** | Value | Description |
| --- | --- | --- |
| **Title** | Not Required | Name of the step in your deployment workflow.  |
| **Summary** | Not Required | Enter a summary of this step. | |
| **RspFile** | $RspFile | The results from the WriteEnv2Toml.re Procedure |

**WriteEnv2File Parameters**

No Parameter fields are required for _WriteEnv2File_.

At this point the Action is ready to be used by anyone with access (based on Domain and security options). Each _Component_ that uses the _Action_ will need to define specific values. Because this new _Action_ is reusable, no _Component_ variables are defined at the _Action_ level.

**Step 4 - Assign the AnsiblePlaybook Action to a _Component_**

Now that you have defined your Ansible _Action_ you are ready to assign it to the _Components_. For using your Ansible Playbook to perform the deployment of the _Component_ you define it to the _Custom Action_ field at the _Component_ level.  If a _Custom Action_ is defined, Ortelius will call the _Custom Action_ instead of using its internal deployment engine. When you define your _Custom Action_ you will select "AnsiblePlaybook." You will be given a dialog box to input the needed variable values. Values are specific to the _Component._ Values will override those defined at the _Application_ or _Environment_ level. The values from Ortelius will be passed along to the Playbook at execution time. See [Defining Components](/userguide/publishing-components/2-define-components/) for more information.

You can also use the AnsiblePlaybook Action to execute Pre and Post _Actions_. Using it in these fields will not override the standard deployment processing.

**Step 5 - Set Your _Component_ Attributes_**

The following variables must be added to the Attributes Section for all  _Components_ using the AnsiblePlaybook _Action_.  The Attributes section can be found on the _Component_ Dashboard.  Use the +Add option in this section to add a row for the variable. You must use Save to commit the row to the table:

| Variable Name | Value Description |
|--- | --- |
| GIT_URL| Repo containing the Playbook |
| GIT_COMMIT | The commit, tag or branch to checkout |
| GIT_DIR | The directory to checkout into.  Use "." for the default directory |
| taskfile | The name of the Playbook to run |
