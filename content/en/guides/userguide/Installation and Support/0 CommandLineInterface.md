---
title: "Command Line Interface Installation"
linkTitle: "Command Line Interface Installation"
weight: 4
description: >
 Command Line Interface Installation
---

## The Ortelius Command Line Interface (CLI)

DeployHub uses the Open-Source [Ortelius](https://ortelius.io) Command Line Interface to support pipeline automation. The Ortelius Command Line Interface supports integration with DevOps tools and CI/CD pipelines. The Ortelius Command Line Interface is under the governance of the [Linux Foundation's Continuous Delivery Foundation (CDF).](https://cd.foundation)

The Ortelius CLI Python script interacts with the Ortelius and DeployHub REST APIs to perform:

- Approve the application version
- Move the application version using the supplied task
- Create/replace the component version for the application version
- Assign a component version to an application version
- Assign the key/values pairs to the component version
- Create a bash file from the component .toml file
- Export a domain including all objects to stdout
- Imports the export file into the new domain
- Deploy the Application
- Persist SBOMs to the component version
- Persist SonarQube Project Status, Bugs, Code Smells, and Violations metrics to the component version
- Persist Veracode Score to the component version
- Persist License File to the component version
- Persist Readme File the component version
- Persist Swagger and OpenAPI files the component version
- Persist Git Branch, Branch Create Commit, Branch Create Timestamp, Branch Parent, Commit, Commit Authors, Committers Count, Commit Timestamp, Lines Added, Lines Deleted, Lines Total, Org, Repo, Repo Project, Signed Off By, Tag, Url, Verified Commit

## Up to Date Usage Info and Installation Instructions

 Refer to the [Ortelius GitHub CLI Documentation](https://github.com/ortelius/ortelius-cli/blob/main/doc/dh.md) for [installation instructions](https://github.com/ortelius/ortelius-cli) and the latest usage and parameters.

