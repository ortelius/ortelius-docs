---
title: "CircleCI Deployment Orb"
linkTitle: "CircleCI Deployment Orb"
weight: 301
description: >
  Using the CircleCI Orb with Ortelius.
---

Ortelius integrates with CircleCI to support continuous configuration management and continuous deployments built into your CircleCI pipeline. In particular, Ortelius integrates with CircleCI to enrich the CI/CD pipeline around microservices.

Critical to the process is the ability to perform configuration management, versioning and tracking of microservices across clusters and teams.  Ortelius' CircleCI Orb includes the ability to perform automated version and dependency management of microservices tracking application and microservice relationships, their versions and their deployment meta data.

## Ortelius Tasks and the CircleCI Deployment Orb

The Ortelius CircleCI Orb calls Ortelius to perform:

| Task                                | Description                                                                                                                                                                                               |
|-------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **move_job**                        | Executes the Ortelius 'Move' task which promotes or demotes an application version to a different pipeline state.                                                                                         |
| **microservice_version_update_job** | Automatically increments the version number of a microservice and the application prior to deployment.  Tracks dependency relationships between microservices and applications to create dependency maps. |
| **deploy_job**                      | Deploys an application version to a specified environment. CircleCI will pass the application version name and environment to Ortelius.                                                                   |
| **envscript_job**                   | Generates a script that captures additional information from CircleCI, Git and Environment TOML file.  This script is used in subsequent steps for adding additional information to Ortelius.             |


You do not need to use the 'approve_job 'or 'move_job' functions. The use of these jobs is determined by how you define your CircleCI pipeline.  If you are using Approvals in CircleC, the approve_job records the approval information as part of the microservice deployment meta.  A 'Move' process tracks where the microservice and application versions are in the pipeline.  You would generally perform a 'Move' and then a 'Deploy.'  Using the microservice_version_update_job is recommended before the deploy_job.  This allows Ortelius to perform your versioning, configuration management, dependency mapping and comparisons.  The deploy_job calls on Ortelius' back in release engine to move the objects to endpoints (clusters for example.)

## Installing the CircleCI Deployment Orb

To start using the Ortelius CircleCI Deployment Orb, you will need to create a .circleci/config.yml to define your workflow to CircleCI for that project. That workflow will define calls to the Ortelius jobs and define the variables such as Application Version, Environment, UserID and Password that will be passed to the Ortelius  CircleCI Orb.

For a full description, go to the [CircleCI Orb Registry](https://circleci.com/orbs/registry/orb/Ortelius/Ortelius-orb)

### Two-way communication and shared logging

Ortelius and CircleCI have a two-way logging communication.  The Ortelius CircleCI Deployment orb includes the ability for all logs about software deployments to be reported in both solutions.  CircleCI can report to Ortelius when deployments are ready to be executed, with Ortelius reporting back the status of the deployment. For most users, CircleCI remains their primary location to find results and logs.

For more information see:

- [Building Your Domain Catalog - Tasks in this Domain](/guides/userguide/first-steps/2-defining-domains/)
- [Customizing Actions](/guides/userguide/first-steps/2-define-your-actions/)
- [Procedures and Functions](/guides/userguide/customizations/2-define-your-functions-and-procedures/)
