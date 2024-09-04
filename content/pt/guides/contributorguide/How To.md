---
title: "How To Tips"
linkTitle: "How To Tips"
weight: 10
description: >
  Tips on opening an issue, making documentation changes, submit coding changes, create videos, and help in project management.
---

## Opening an Issue

GitHub Issues are used to track all bugs, enhancement requests, and "todos."  Ortelius is spread across many repositories so the [ortelius/ortelius](https://github.com/ortelius/ortelius) repo is used for all issues.  Issues should have a link, using markdown `[]()` link format, to the true repository in which the bug, enhancement, or "todos" needs to be made.  

Please be detailed in your description of the issue.  Not everything needs to go in the summary line.  Feel free to use the description area to provide additional details.

## Making documentation changes

Documentation is stored in [ortelius/ortelius-docs](https://github.com/ortelius/ortelius-docs).  The documentation is served up by a [hugo/docsy](https://www.docsy.dev/docs/getting-started/) server.  You can run this server locally to view your changes before committing to Github.

The documentation is managed in two Guides - a [User Guide and a Contributor Guide.](http://docs.ortelius.io/guides/)

### Setup for Documentation updates

1. [Install hugo](https://www.docsy.dev/docs/getting-started/) locally.  If you are on Windows make sure to install the extended packages as well.
2. Fork the [ortelius/ortelius-docs](https://github.com/ortelius/ortelius-docs) to your GitHub account.
3. Clone the new repo to your computer.
4. Launch an editor such as [Visual Studio Code](https://code.visualstudio.com/).  Make sure the *Markdown Preview Enhanced by Yiyi Wang* is installed.  This will give you a split screen of the markdown and the rendered version.
5. The markdown files can be found under the `content/en/guides/contributorguide` (this guide) and the `content/en/guides/userguide` (the end user guide).
6. Start your hugo server.  Open a command prompt and cd to your local git repo directory.  From the root of the repo run `hugo server`.  This will start the local hugo server running.  The pages can be viewed in your browser using the `http://localhost:1313/guides` url.
7. Next make a documentation change.  This change will automatically be seen in the Visual Studio Code - Markdown Preview Enhanced window.  Also, the hugo server will automatically render the changed markdown page.  

Note: Visual Studio is only a preview and will not render all markdown updates such as embedded html.  You will need to view the pages being hosted by the hugo server in your browser for an accurate rendering.

[Markdown Cheat Sheet](https://www.markdownguide.org/cheat-sheet/) can be used for the basic page layout.  CSS has been applied to the Docsy theme template in order to tweak the final page rendering.  

8. Create a Pull Request to merge in your changes. See [PR Cheat Sheet](/guides/contributorguide/pull-request-cheat-sheet/)

## Making coding changes

The Ortelius code base is stored across multiple repositories.  Ortelius was originally written as a Java Servlet application running under Tomcat.  The front end code is in Java Script using JQuery and JQuery Plugins.  The backend code is Java that accesses the Postgres database via JDBC driver.  The Ortelius Deployment Engine is written in C++.  Plugins to CI tools are written in Python and Groovy.

New enhancements are being architected to follow the microservice implementation practices.  These new microservices are written in Python or Golang and have their own separate repositories.

The goal is to move from the monolithic implementation, to hybrid and then to a pure microservice based implementation.

The Java backend code is easiest worked on using the Eclipse IDE, where as the other code can be handled with any editor such as Visual Studio Code.

A Postgres database needs to be installed for Ortelius to persist its data.  Ortelius will create the necessary database tables on startup.

### Steps

1. Fork the [ortelius/ortelius](https://github.com/ortelius/ortelius) to your GitHub account if you are working on the monolithic backend or frontend JS code, otherwise, for the Ortelius microservice repo.
2. Clone the new repo to your computer.
3. Make the coding changes with your favorite editor.
5. The monolithic code can be run and debug natively in Eclipse since a Tomcat Server using a connection to your local Postgres database.

   The microservice code can be run and debugged natively in your editor. It will need to connect to the database over OBDC.
6. Create a Pull Request to merge in your changes. See [PR Cheat Sheet](/guides/contributorguide/pull-request-cheat-sheet/)

## Creating Videos

Videos are hosted on the [Ortelius Youtube Channel](https://www.youtube.com/channel/UCw2LfF0mqkaXdvqfVnIPWmw).  Please contact one of the [chairs](https://docs.ortelius.io/guides/contributorguide/community-membership/#chair) to get access to upload to the channel.

Camtasia for Windows or HitFilm Express for OS/X can be used to edit the videos.  Training videos should be edited to remove any stumbles or pauses.  

Videos Requirements:

- Must include the Ortelius [Opening](https://github.com/ortelius/outreach/blob/master/OrteliusOpening.mp4) and [Closing](https://github.com/ortelius/outreach/blob/maintenance/OrteliusClosing.mp4) Clips.
- Resolution of 1040p (1920 x 1080) when possible.
- Added to appropriate YouTube playlist.

## Project Management

### Trello

[Kanban Board for Ortelius](https://trello.com/b/EzTxe83X/kanban-board-for-ortelius) is used to track tasks spanning multiple SIGs and development efforts.  Trello cards will contain links to the GitHub issues where appropriate.

### GitHub Triage Dashboard

Triage Dashboard [#181](https://github.com/ortelius/ortelius/issues/181) will be added in Q1 2021 to help with issue management.

### GitHub Labels and Tags

GitHub issues will be label to help filter and navigate issues.

## Release Numbering

Releases ending in ”.0” are major releases and this is where all new features land. Releases ending in another integer, like “0.X.1” and “0.X.2” are dot releases, and these are only going to contain bugfixes. Typically we don’t do dot releases for minor bugfixes (reserving these for larger items), but may occasionally decide to cut dot releases containing a large number of smaller fixes if it’s still a fairly long time before the next release comes out.