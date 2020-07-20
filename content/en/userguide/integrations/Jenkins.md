---
title: "Jenkins Build Engine"
linkTitle: "Jenkins Build Engine"
weight: 68
description: >
  Calling Ortelius from Jenkins for microservice tracking.
---

You can setup Jenkins to call a Ortelius step inside the Jenkins Pipeline. The step will execute continuous configuration management of the _Components_ and _Applications_ creating new versions as changes progress, and continuous deployments of independent objects like microservices.

## Using the Groovy Library for Jenkins Integration

The Jenkins integration uses the a Ortelius Jenkins Groovy Library to peform the following steps :

- **Continuous Configuration Management**: The process of automatically versioning _Components_, like microservices, with their consuming _Applications_.
- **Moves**:  Allows Jenkins to tell Ortelius to push a new update from one state to the next.
- **Deploy**: Allows Jenkins to tell Ortelius when the deployment needs to be executed.
- **Approvals**: Tracks an Approval, with audit, between Jenkins and DeployHub Pro (not supported in Ortelius).

## Installation

Update your Jenkins Configure System - Global Pipeline Libraries to load the Ortelius Groovy Library from Git as follows:

![Jenkins Setup](/userguide/images/jenkins-setup.png)

### Resources

- [Git Repo - jenkinsci/Ortelius-plugin](https://github.com/jenkinsci/Ortelius-plugin)
- [Groovy Doc](/groovydoc/DefaultPackage/Ortelius.html)

#### Example Pipeline

This example will create a new _Component Version_ for the _Application Version_ listed in the pipeline.  Then it will update the _Attributes_ of the _Component Version_ with information from Jenkins.

``` groovy
@Library('Ortelius') _


 def app="ChiliUptimeApp"
 def environment=""
 def cmd=""
 def url="http://192.168.3.116:8181"
 def user="admin"
 def pw="admin"
 def dh = new Ortelius();

 node {
    stage('Clone sources') {
        git url: 'https://github.com/OrteliusProject/Uptime-Jenkins-Pipeline.git'
    }

    stage ('Build') {
      def url="https://console.deployhub.com"
      def user="DHUSER"
      def pw="DHPASSWORD"
      def comp="GLOBAL.CSC589.chili.Development.bowl"
      def application="GLOBAL.CSC589.chili.Development.ChiliUptimeApp"  
      def appver = "1"
      def version = "0.1.0-109"
      def imagename = "chili-bowl"
      def String[] envs = ["GLOBAL.CSC589.chili.Development.Dev"]
      def endpoint = "GLOBAL.CSC589.chili.k8s"

      echo "${url}";
      echo "${comp}";
      echo "${version}";

      // create component version
      compid = dh.newComponentVersion(url, user, pw, comp, "", version);
      echo "Creation Done " + compid.toString();

      // update attrs
      def attrs = [
      buildnumber: env.BUILD_ID,
      ComponentType: "Helm Chart",
      Category: "Deploy",
      AlwaysDeploy: "Y",
      DeploySequentially: "Y",
      'creds["helmrepo"]': "ec2user",
      Chart: "stable/heartbeat",
      ChartVersion: "1.0.0",
      ChartNamespace: "dev1",
      'image.tag': "1.0.0"
     ];

      echo "${attrs}";
      data = dh.updateComponentAttrs(url, user, pw, comp, "", version , attrs);
      echo "Update Done " + data.toString();

      data = dh.newApplication(url, user, pw,application,appver, envs);
      echo "New Application " + data.toString();
      appid = data[0];

      data = dh.addCompVer2AppVer(url, user, pw, appid, compid);

      attrs = [
      appvar: "1234"
     ];
      echo "${attrs}";
      data = dh.updateApplicationAttrs(url, user, pw, application, appver , attrs);
      echo "App Attr Update Done " + data.toString();

      attrs = [
      envvar: "XXYY"
     ];
      echo "${attrs}";
      data = dh.updateEnvironmentAttrs(url, user, pw, envs[0], attrs);
      echo "Env Attr Update Done " + data.toString();

      attrs = [
      epvar: "WWW"
     ];
      echo "${attrs}";
      data = dh.updateEndpointAttrs(url, user, pw, endpoint, attrs);
      echo "Endpoint Attr Update Done " + data.toString();
  }

```

For more information see:

- [Building Your Domain Catalog - Tasks in this Domain](/userguide/first-steps/2-defining-domains/)
- [Customizing Actions](/userguide/first-steps/2-define-your-actions/)
- [Procedures and Functions](/userguide/customizations/2-define-your-functions-and-procedures/)
