---
title: "Helm for Container Deployments"
linkTitle: "Helm for Container Deployments"
weight: 64
description: >
  Using Helm to execute deployments as an _Action_.
---

Helm is called to replace the Ortelius default processing engine for performing container deployments. When Ortelius executes the release process, it will call the Helm Chart you have defined as your _Custom Action_ at the _Component_ level.  Ortelius includes the version of the Helm chart as part of its overall configuration data.

## Connecting a Ortelius _Endpoint_ to your Kubernetes Cluster through Helm

Ortelius' deployment engine comes pre-installed with Helm.  For this reason you should use the deployment engine as the "localhost" _Endpoint_ for your deployments.  This Helm install on the "localhost" _Endpoint_ needs to know how to connect to your Kubernetes Cluster.  Mount your ".kube/config" file to the Ortelius deployment engine Docker container to provide the connection.  The additional parameter to the docker run command for the Ortelius container exposes the Kubernetes config file to the Helm install in Ortelius.  The following is an example of the additional parameter:

```bash
-v ~/.kube:/home/omreleng/.kube:Z
```

For more information on starting the Ortelius Container see:

- [SaaS Sign-up and Reverse Proxy](/userguide/installation-and-support/0-saas-and-reverse-proxy/)
- [Ortelius On-Premise Installation](/userguide/installation-and-support/0-on-premise-installation-for-team/)
- [DeployHub Pro On-Prem Installation](/userguide/installation-and-support/0-on-premise-installation-for-pro/)

## Helm and _Custom Actions_

Helm is called as a Ortelius [_Custom Action_](/userguide/customizations/2-define-your-actions/). To use Helm, you will need to import two Helm files as Ortelius _Procedures_ and define them to your _Custom Action_. This Helm _Custom Action_ can then be assigned to your Container _Components_. See [_Procedures and Functions_](/userguide/customizations/2-define-your-functions-and-procedures/) and  [Customize Actions](/userguide/customizations/2-define-your-actions/) to learn more. The following steps will create your Helm _Custom Action_.

**Step 1 - Download and Import the Helm scripts as _Procedures_**

Download the the most current Ortelius Helm Procedures from the [Ortelius Git Repo](https://github.com/ortelius/ortelius/blob/master/procedures/). There will be two:

- **WriteEnv2Toml.re**:  This _Procedure_ takes all the attributes from Ortelius _Environments_, _Applications_, _Endpoints_ and _Components_ and writes them to a file readable by the Helm _Procedure._

- **HelmUpgrade.re** – This _Procedure_ performs a Helm upgrade/install of the Helm Chart.

**Step 2 - Create your _Procedures_**

Once downloaded, you will need to Import the scripts into Ortelius as _Procedures_. To import these _Procedures_ navigate to the _Func/Procs_ Menu option on the left hand side of the Ortelius Main Menu panel. This will take you to the _Functions and Procedures_ List View. From the _Functions and Procedures_ List View select the **Import** option. The Import will bring you to your operating system "file open" dialog box for selecting the WriteEnv2Toml.re and HelmUpgrade.re files.

Next, select your "Global," or highest level, _Domain_ and upload the _Procedure_ into Ortelius. If you select a lower level _Subdomain_ you will restrict access.  By defining it to your highest level _Domain_, all _Users_ will be able to see the _Procedures_. Once you have both imported, you are now ready to create your _Action_.

**Step 3 - Create your _Action_ for Your Helm _Procedures_**

Once you have imported your WriteEnv2Toml.re and HelmUpgrade.re files as _Procedures_, you can define your _Action_. Navigate to the _Actions_ list view from the _Actions_ menu option on the left hand side of the Ortelius Main Menu panel.

Use the +Add option to create a new _Action_ for you _Procedure_. In the "Full Domain" field select your "Global" _Domain_. If you select a lower level _Subdomain_ you will restrict access to this _Custom Action_.  By defining it to your highest level _Domain_, all _Users_ will be able to execute the process regardless of their _SubDomain_.

Name the new _Action_ **HelmChart** (no spaces).

Now we are going to customize this _Action_. On the right hand side, you will see a list of _Functions_ and _Procedures_ you can choose from.  Navigate to your _Domain_ to find the WriteEnv2Toml.re and HelmUpgrade.re imported _Procedures_.  Drag them onto the area under "Start". The order should be _WriteEnv2Toml_, _HelmUpgrade_.

No Parameter fields are required for _WriteEnv2File_.

When you drag the HelmUpgrade _Procedure_ onto the area under "Start" a pop-up dialog box will open for you to complete the following parameters:

| Field | Value | Description |
| --- | --- | --- |
| **Title** | Not Required | Name of the step in your deployment workflow.  |
| **Summary** | Not Required | Enter a summary of this step. | |
| **RspFile** | $RspFile | The results from the WriteEnv2Toml.re Procedure |
| **Chart** | $(Chart) | The Helm Chart to be used during the deployment |
| **Release Name** | $(component.name) | The name of the release |

At this point the Action is ready to be used by anyone with access (based on Domain and security options). Each _Component_ that uses the _Action_ will need to define specific values. Because this new _Action_ is reusable, no _Component_ variables are defined at the _Action_ level.

## Assign the HelmChart Action to a Component

Create your new _Component_ from the _Component_ Dashboard. See [Defining _Components_](/userguide/publishing-components/2-define-components/).  For each container _Component_ you will need to define the variable values. Values are specified when you create a new container _Component._ Values will override those defined at the _Application_ or _Environment_ level. The values from Ortelius will be passed along to Helm's values.yml file at execution time. For more information on defining your container _Component_ see [Container Specific Data Definition](/userguide/publishing-components/2-define-components/#container-specific-data-definition).
