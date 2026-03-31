---
title: "How To Tips"
linkTitle: "How To Tips"
weight: 10
description: >
  Tips on opening an issue, making documentation changes, submitting coding changes, creating videos, and helping with project management.
---

## Opening an Issue

GitHub Issues are used to track all bugs, enhancement requests, and "todos." Ortelius is spread across many repositories so the [ortelius/ortelius](https://github.com/ortelius/ortelius) repo is used for all issues. Issues should have a link, using markdown `[]()` link format, to the true repository in which the bug, enhancement, or "todo" needs to be made.

Please be detailed in your description of the issue. Not everything needs to go in the summary line. Feel free to use the description area to provide additional details.

## Making Documentation Changes

Documentation is stored in [ortelius/ortelius-docs](https://github.com/ortelius/ortelius-docs). The documentation is served up by a [hugo/docsy](https://www.docsy.dev/docs/getting-started/) server. You can run this server locally to view your changes before committing to GitHub.

The documentation is managed in two Guides — a [User Guide and a Contributor Guide](http://docs.ortelius.io/guides/).

### Setup for Documentation Updates

1. [Install hugo](https://www.docsy.dev/docs/getting-started/) locally. If you are on Windows make sure to install the extended packages as well.
2. Fork [ortelius/ortelius-docs](https://github.com/ortelius/ortelius-docs) to your GitHub account.
3. Clone the new repo to your computer.
4. Launch [Visual Studio Code](https://code.visualstudio.com/). Install the *Markdown Preview Enhanced by Yiyi Wang* extension for a live split-screen preview.
5. Markdown files are under `content/en/guides/contributorguide` (this guide) and `content/en/guides/userguide` (the end-user guide).
6. Start your hugo server. Open a terminal and `cd` to your local repo root, then run `hugo server`. View pages at `http://localhost:1313/guides`.
7. Make a documentation change — it will automatically appear in the Markdown Preview and be re-rendered by hugo.

Note: VS Code Markdown Preview is only an approximation and will not render all markdown (e.g., embedded HTML). Always verify in the browser for accurate rendering.

A [Markdown Cheat Sheet](https://www.markdownguide.org/cheat-sheet/) covers the basic page layout.

8. Create a Pull Request to merge in your changes. See [PR Cheat Sheet](/guides/contributorguide/pull-request-cheat-sheet/).

## Making Coding Changes

Ortelius uses a microservice architecture with two primary repositories for active development:

| Repository | Language / Stack | Purpose |
|---|---|---|
| [ortelius/pdvd-backend](https://github.com/ortelius/pdvd-backend) | Go | REST API / server — SBOM to release to CVE tracking |
| [ortelius/pdvd-frontend](https://github.com/ortelius/pdvd-frontend) | Node.js + Next.js | Web UI |

Additional supporting repositories exist for plugins, integrations, and tooling — written in Python, Go, or Groovy.

### Steps

1. Fork the relevant repo (`pdvd-backend` or `pdvd-frontend`) to your GitHub account.
2. Clone the new repo to your computer.
3. Open the repo in [Visual Studio Code](https://code.visualstudio.com/).
4. **Backend (Go):** Install the [Go extension for VS Code](https://marketplace.visualstudio.com/items?itemName=golang.Go). Run and debug the server locally; it connects to a Postgres database over a standard connection string set in your environment.
5. **Frontend (Node.js/Next.js):** Install dependencies with `npm install`, then run `npm run dev` to start the Next.js dev server at `http://localhost:3000`.
6. A Postgres database is required for the backend. See [Developer Resources](/guides/contributorguide/developer-resources/) for setup instructions.
7. Create a Pull Request to merge in your changes. See [PR Cheat Sheet](/guides/contributorguide/pull-request-cheat-sheet/).

## Creating Videos

Videos are hosted on the [Ortelius YouTube Channel](https://www.youtube.com/channel/UCw2LfF0mqkaXdvqfVnIPWmw). Contact one of the [chairs](https://docs.ortelius.io/guides/contributorguide/community-membership/#chair) to get upload access.

Camtasia (Windows) or HitFilm Express (macOS) can be used for editing. Training videos should be edited to remove stumbles or long pauses.

Video requirements:
- Must include the Ortelius [Opening](https://github.com/ortelius/outreach/blob/master/OrteliusOpening.mp4) and [Closing](https://github.com/ortelius/outreach/blob/maintenance/OrteliusClosing.mp4) clips.
- Resolution of 1080p (1920 × 1080) when possible.
- Added to the appropriate YouTube playlist.

## Project Management

### Trello

[Kanban Board for Ortelius](https://trello.com/b/EzTxe83X/kanban-board-for-ortelius) is used to track tasks spanning multiple SIGs and development efforts. Trello cards will contain links to the GitHub issues where appropriate.

### GitHub Labels and Tags

GitHub issues are labeled to help filter and navigate issues.

## Release Numbering

Releases ending in ".0" are major releases and this is where all new features land. Releases ending in another integer (e.g., "0.X.1", "0.X.2") are dot releases containing only bugfixes.
