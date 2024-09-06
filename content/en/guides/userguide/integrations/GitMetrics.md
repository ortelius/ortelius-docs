---
title: "Git Metadata and Metrics"
linkTitle: "Git Metadata and Metrics"
weight: 310
description: >
  Gathering Git Metadata and Metrics.
---

![Git](/guides/userguide/images/git.png)

Ortelius stores the Git Metadata and Metrics for informational and computational purposes.  This is done for any Git Repository, such as [GitHub](https://github.com/) or [GitLab](https://about.gitlab.com/).

Ortelius integrates with Git using the [CI/CD Command Line Interface](/guides/userguide/integrations/ci-cd_integrations/) (CLI). For every _Component Version_, the CLI gathers and stores the following:

| Field in Git Details Section | Description                                                     |
|------------------------------|-----------------------------------------------------------------|
| Git Commit                   | Git commit that triggered the CI job (DERIVED IF NOT SPECIFIED) |
| Git Repo                     | Git repo that triggered the CI job (DERIVED IF NOT SPECIFIED)   |
| Git Tag                      | Git tag in the git repo (DERIVED IF NOT SPECIFIED)              |
| Git Url                      | Full url to the git repo (DERIVED IF NOT SPECIFIED)             |
| Purl                         | Purl for the _Component Version_ (DERIVED IF NOT SPECIFIED)     |


| Key in Key Value Configuration | Description                                                                    |
|--------------------------------|--------------------------------------------------------------------------------|
| Git Branch                     | Git branch in the git repo (DERIVED IF NOT SPECIFIED)                          |
| Git Branch Create Commit       | Git commit that the branch was created from (DERIVED IF NOT SPECIFIED)         |
| Git Branch Create Timestamp    | Timestamp of when the branch was created (DERIVED IF NOT SPECIFIED)            |
| Git Branch Parent              | The parent branch for the current branch (DERIVED IF NOT SPECIFIED)            |
| Git Commit Authors             | List of committers for the repo (DERIVED IF NOT SPECIFIED)                     |
| Git Committers Cnt             | Count of Git Commit Authors (DERIVED IF NOT SPECIFIED)                         |
| Git Commit Timestamp           | Timestamp of the current commit (DERIVED IF NOT SPECIFIED)                     |
| Git Contrib Percentage         | Git Committers Cnt / Git Total Committers Cnt * 100 (DERIVED IF NOT SPECIFIED) |
| Git Lines Added                | Lines added since the previous commit (DERIVED IF NOT SPECIFIED)               |
| Git Lines Deleted              | Lines deleted since the previous commit (DERIVED IF NOT SPECIFIED)             |
| Git Lines Total                | Total line count for the branch (DERIVED IF NOT SPECIFIED)                     |
| Git Org                        | Organization for the repo (DERIVED IF NOT SPECIFIED)                           |
| Git Repo Project               | Project name part of the repository url (DERIVED IF NOT SPECIFIED)             |
| Git Total Committers Cnt       | Total committers working on this repo                                          |

These values are displayed for every _Component Version_ and viewable from the _Component Detail_ dashboard.
