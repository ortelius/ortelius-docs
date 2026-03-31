---
title: "Developer Resources"
linkTitle: "Developer Resources"
weight: 10
description: >
  Tools, Tips and Tricks for Developers.
---

## Developer Tools

The following tools are needed to contribute to Ortelius code or documentation.

### Editors

[Visual Studio Code](https://code.visualstudio.com/) is the recommended editor. Install the following extensions:

- **Go** — Go Team at Google (`golang.go`)
- **ESLint** — Microsoft (`dbaeumer.vscode-eslint`)
- **Prettier** — Prettier (`esbenp.prettier-vscode`)
- **Markdown Preview Enhanced** — Yiyi Wang
- **markdownlint** — David Anderson
- **Docker** — Microsoft
- **YAML** — Red Hat

### Backend Development (Go)

The backend lives at [ortelius/pdvd-backend](https://github.com/ortelius/pdvd-backend) and is written in Go.

- [Install Go](https://go.dev/dl/) (1.21 or later recommended)
- Install the [Go extension for VS Code](https://marketplace.visualstudio.com/items?itemName=golang.Go)
- Install dependencies: `go mod download`
- Run locally: `go run .`
- Run tests: `go test ./...`

### Frontend Development (Node.js / Next.js)

The frontend lives at [ortelius/pdvd-frontend](https://github.com/ortelius/pdvd-frontend) and is built with Node.js and Next.js.

- [Install Node.js](https://nodejs.org/) (LTS version recommended)
- Install dependencies: `npm install`
- Run dev server: `npm run dev` — available at `http://localhost:3000`
- Build for production: `npm run build`

### Testing Environment

To set up a local runtime test environment you will need:

- [Docker](https://docs.docker.com/get-docker/)
- [Helm](https://helm.sh/docs/intro/install/)

**Local ArangoDB database:**

1. Pull and run ArangoDB:

   ```
   
   docker run -it --rm -e ARANGO_NO_AUTH=1 -p 8529:8529 -v $HOME/arangodb:/var/lib/arangodb3 arangodb
   ```

The database will be accessible at `http://localhost:8529`:


- Database: `ortelius`

### Database Tools

- [ArangoDB](https://www.arangodb.com/download/) — graph and multi-model database used by Ortelius
- [ArangoDB Web UI](http://localhost:8529) — built-in browser UI, available once the container is running
- [arangosh](https://www.arangodb.com/docs/stable/programs-arangosh.html) — ArangoDB command-line shell

### Git

To submit issues and manage pull requests:
- [Git GUI clients](https://git-scm.com/downloads/guis/)

Getting started with a Pull Request can be tricky. Check out the [PR Cheat Sheet](https://docs.ortelius.io/guides/contributorguide/pull-request-cheat-sheet/) before starting any changes, since a proper setup will make the merge much easier.

### Communication

- [Discord Channel](https://discord.gg/ZtXU74x)
