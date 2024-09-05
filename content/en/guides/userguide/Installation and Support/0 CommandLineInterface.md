---
title: "Command Line Interface Installation"
linkTitle: "Command Line Interface Installation"
weight: 4
description: >
 Command Line Interface Installation
---

## The Ortelius Command Line Interface (CLI)

The Ortelius Command Line Interface is used for pipeline automation. The Ortelius Command Line Interface supports integration with DevOps tools and CI/CD pipelines. The Ortelius Command Line Interface is under the governance of the [Linux Foundation's Continuous Delivery Foundation (CDF).](https://cd.foundation)

The Ortelius CLI Python script interacts with the Ortelius REST APIs to perform various tasks including:
- Create/replace the _Component Version_ Version_ for the _Application Version_
- Assign a component version to an _Application Version_
- Assign the key/values pairs to the _Component Version_
- Create a bash file from the _Component_ .toml file
- Export a _Domain_ including all objects to stdout
- Imports the export file into the new _Domain_
- Deploy the _Application_
- Persist SBOMs to the  _Component Version_
- Persist SonarQube Project Status, Bugs, Code Smells, and Violations metrics to the  _Component Version_
- Persist Veracode Score to the  _Component Version_
- Persist License File to the  _Component Version_
- Persist Readme File the  _Component Version_
- Persist Swagger and OpenAPI files the  _Component Version_
- Persist Git Branch, Branch Create Commit, Branch Create Timestamp, Branch Parent, Commit, Commit Authors, Committers Count, Commit Timestamp, Lines Added, Lines Deleted, Lines Total, Org, Repo, Repo Project, Signed Off By, Tag, Url, Verified Commit

## Up to Date Usage Info and Installation Instructions

 Refer to the [Ortelius GitHub CLI Documentation](https://github.com/ortelius/ortelius-cli/blob/main/doc/dh.md) for [installation instructions](https://github.com/ortelius/ortelius-cli) and the latest usage and parameters.

