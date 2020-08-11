---
title: "GitHub"
linkTitle: "GitHub"
weight: 62
description: >
  Integrating GitHub repository and issues with DeployHub Pro.
---

Ortelius supports GitHub in the following ways.

1. A binary Repository for retrieving artifacts to deploy such as binaries or scripts.
2. GitHub Issue Tracking for **DeployHub Pro**. A bridge connects a GitHub issue with a Ortelius Change Request.

## GitHub as a Binary Repository

You can configure Ortelius to call out to a Git Repo to pull deployable artifacts (binaries, scripts, etc.) as part of your deployment.  The process will check out your deployable artifacts based on commit, branch or tag specified. You will need to configure Ortelius with a file system Ortelius _Repository_ that will pull the files need fro the deployment.  You will also need to create a "Git Checkout" _Procedure_ and _Action_.

### Step 1 - Create a Ortelius File System _Repository_

Ortelius can use GitHub as a binary repository for retrieving deployable objects as part of the deployment process.  To do this you will first need to define GitHub as a connected _Repository_ Object from within Ortelius. This connection will be used by as part of the deployment process using a _Procedure_ and a _Action_. For information on setting up File System as a binary repository see [Connect Your Repositories](/userguide/first-steps/2-define-repositories/).

Once you have completed this step, you are ready to create a new _Procedure_ that performs the check out from the GitHub repository.

### Step 2 - Create your GitHub Checkout _Procedure_ for your _Action_

_Procedures_ are called by _Actions_ to execute deployment logic. A pre-defined Ortelius _Procedure__ is available from the [Ortelius Git Repo](https://github.com/ortelius/ortelius/blob/master/procedures/). This where you will find the most current version of this _Procedure_. For more information on creating _Procedures see [Functions and Procedures](/userguide/customizations/2-define-your-functions-and-procedures/).

From the Ortelius Git Repo, pull the file named **GitCheckout.re**

Once downloaded, you will need to Import it into Ortelius from the Func/Procs List View. Navigate to the List View by selecting the Func/Procs menu option on the left hand side of the Ortelius main panel. From the Func/Procs List view select the **Import** option. The Import will bring you to your operating system "file open" dialog box for selecting the GitCheckout.re file.  Next, select your _Domain_ and upload the _Procedure_ into the Ortelius. You are now ready to create your _Action_.

### Step 3 - Create your _Action_ for the GitHub Checkout _Procedure_

Once you have imported your GitCheckout.re _Procedure_, you can define your _Action_. Navigate to the _Actions_ list view from the _Actions_ menu option on the left hand side of the Ortelius main panel. Use the +Add option to create a new _Action_ for you _Procedure_. Name the new _Action_ **GitCheckAction** (no spaces). See [Customize Your Actions](/userguide/customizations/2-define-your-actions/) for more information on creating _Actions_.

Now we are going to customize this _Action_. On the right hand side, you will see a list of _Functions_ and _Procedures_ you can choose from.  Navigate to your _Domain_ to find the GitCheckOut _Procedure_. Drag it onto the area under _Start._ A pop-up dialog box will open for you to complete the following parameters:

_GitCheckout_ Parameters

| **Field** | Value | Description |
| --- | --- | --- |
| **Title** | Not Required | Name of the step in your deployment workflow. Use "Git Checkout." |
| **Summary** | Not Required | Enter a summary of this step. |
| **Git Repo** | $GIT_URL| This Variable represents the Git Repo containing the deployable artifacts. The value will be defined at the Component Level. |
| **Git Commit** | $GIT_COMMIT | This Variable represents the Git the commit, tag or branch to checkout. The value will be defined at the Component Level.|
| **To Dir** | $GIT_DIR | This Variable represents the directory to checkout into.  The value will be defined at the Component Level. Use "." for the default directory when assigning this value at the Component level. |

At this point the _Action_ is ready to be used by anyone with access (based on _Domain_ and _Group_ options).
Note: Because this _Action_ is reusable, no _Component_ variables are defined. This is performed at the _Component_ level.

### Step 4 - Assign the GitCheckoutAction to your _Component_ to be deployed

For each _Component_ you will need to define the variable values for $GIT_URL, $GIT_COMMIT and $GIT_DIR that the GitCheckoutAction will use at the_Component_ level. The values will be passed to the GitCheckoutAction at deploy time. See [Defining _Components_](/userguide/publishing-components/2-define-components/) for more information.

### Step 5 - Set Your _Component_ Attributes_

The following variables must be added to the Attributes Section for all  _Components_ using the GitCheckoutAction _Pre Action_.  The Attributes section can be found on the _Component_ Dashboard.  Use the +Add option in this section to add a row for the variable. You must use Save to commit the row to the table:

| Variable Name | Value Description |
|--- | --- |
| **GIT_URL** | This Variable represents the Git Repo containing the deployable artifacts. The value will be defined at the Component Level. |
| **GIT_COMMIT** | This Variable represents the Git the commit, tag or branch to checkout. The value will be defined at the Component Level.|
| **GIT_DIR** | This Variable represents the directory to checkout into.  The value will be defined at the Component Level. Use "." for the default directory when assigning this value at the Component level. |

## GitHub Issues and DeployHub Pro Change Request

DeployHub Pro can reference the GitHub issues to track Change Request for _Components_ and _Applictions_. This enables the GitHub issues to be viewed from a _Component_ or _Application_ using the DeployHub Pro _Change Request_ section from the _Component_ or _Application_. If you have a _Release_ defined, these GitHub issues will be rolled up from the _Component_ and _Application_ to the _Release_.

For more information see [Tracking Jira, Bugzilla and GitHub Issue](/userguide/integrations/jira-bugzilla-and-git-issues/).

Additional information:

- [Managing _Data Sources_](userguide/customizations/2-data-sources/)
- [Connect Your _Repositories_](userguide/first-steps/2-define-repositories/)
- [Defining _Components_](/userguide/publishing-components/2-define-components/)
