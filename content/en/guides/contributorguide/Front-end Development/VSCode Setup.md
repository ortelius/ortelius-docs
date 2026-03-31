---
title: "VS Code Setup for Frontend Development"
linkTitle: "VS Code Setup for Frontend Development"
weight: 20
description: >
  Setting up VS Code for pdvd-frontend (Next.js) development
---

## Getting Started

The Ortelius frontend ([ortelius/pdvd-frontend](https://github.com/ortelius/pdvd-frontend)) is a Next.js application. [Visual Studio Code](https://code.visualstudio.com/) is the recommended editor for all frontend work.

## Prerequisites

- [Node.js LTS](https://nodejs.org/)
- [VS Code](https://code.visualstudio.com/download)
- [Git](https://git-scm.com/)

## Recommended VS Code Extensions

Install these from the Extensions panel (`Ctrl+Shift+X`):

| Extension | Publisher | Purpose |
|---|---|---|
| ESLint | Microsoft | JavaScript/TypeScript linting |
| Prettier — Code formatter | Prettier | Auto-formatting |
| Markdown Preview Enhanced | Yiyi Wang | Docs preview |
| markdownlint | David Anderson | Docs linting |
| Docker | Microsoft | Container management |
| YAML | Red Hat | YAML file support |
| Change All End of Line Sequence | vs-publisher-1448185 | Fix CRLF/LF issues |
| Todo Tree | Gruntfuggly | Track TODOs |

## Setting Up the Workspace

1. Clone the repo:

   ```bash
   git clone https://github.com/ortelius/pdvd-frontend.git
   cd pdvd-frontend
   ```

2. Open in VS Code:

   ```bash
   code .
   ```

3. Install dependencies:

   ```bash
   npm install
   ```

4. Copy and configure the environment file:

   ```bash
   cp .env.example .env.local
   # Edit .env.local and set NEXT_PUBLIC_API_URL to your local backend URL
   ```

## Running and Debugging

### Start the Dev Server

Open the integrated terminal (`Ctrl+\``) and run:

```bash
npm run dev
```

The app hot-reloads at `http://localhost:3000` as you edit files.

### Debugging in VS Code

Create a `.vscode/launch.json` if one is not already in the repo:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Next.js: debug server-side",
      "type": "node-terminal",
      "request": "launch",
      "command": "npm run dev"
    },
    {
      "name": "Next.js: debug client-side",
      "type": "chrome",
      "request": "launch",
      "url": "http://localhost:3000"
    }
  ]
}
```

Set breakpoints in the editor gutter and press `F5` to launch the debugger.

## ArangoDB Database

The frontend consumes the pdvd-backend REST API, which in turn uses ArangoDB. Run the test database container:

```bash
docker run -it --rm -e ARANGO_NO_AUTH=1 -p 8529:8529 \
  -v $HOME/arangodb:/var/lib/arangodb3 \
  arangodb
```

Connect at `http://localhost:8529` — no authentication required (ARANGO_NO_AUTH=1), database `ortelius`.

## Accessing the UI

With the dev server running, open `http://localhost:3000` in your browser. Changes to source files appear immediately without a manual refresh.

## Line Ending Configuration

Set VS Code to use LF line endings project-wide by adding a `.editorconfig` or setting in `settings.json`:

```json
{
  "files.eol": "\n"
}
```

This avoids CRLF/LF conflicts, especially on Windows with WSL2.
