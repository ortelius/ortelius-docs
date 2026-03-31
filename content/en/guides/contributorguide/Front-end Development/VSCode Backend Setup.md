---
title: "VS Code Setup for Backend Development"
linkTitle: "VS Code Setup for Backend Development"
weight: 19
description: >
  Setting up VS Code for pdvd-backend (Go) development
---

## Getting Started

The Ortelius backend ([ortelius/pdvd-backend](https://github.com/ortelius/pdvd-backend)) is written in Go. [Visual Studio Code](https://code.visualstudio.com/) is the recommended editor for all backend work.

## Prerequisites

- [Go](https://go.dev/dl/) (1.21 or later)
- [VS Code](https://code.visualstudio.com/download)
- [Git](https://git-scm.com/)
- [Docker](https://docs.docker.com/get-docker/) (to run ArangoDB locally)

## Recommended VS Code Extensions

Install these from the Extensions panel (`Ctrl+Shift+X`):

| Extension | Publisher | Purpose |
|---|---|---|
| Go | Go Team at Google (`golang.go`) | Language support, IntelliSense, debugging |
| REST Client | Huachao Mao (`humao.rest-client`) | Test API endpoints from inside VS Code |
| Docker | Microsoft | Container management |
| YAML | Red Hat | YAML file support |
| markdownlint | David Anderson | Docs linting |
| Change All End of Line Sequence | vs-publisher-1448185 | Fix CRLF/LF issues |
| Todo Tree | Gruntfuggly | Track TODOs |

## Setting Up the Workspace

1. Clone the repo:

   ```bash
   git clone https://github.com/ortelius/pdvd-backend.git
   cd pdvd-backend
   ```

2. Open in VS Code:

   ```bash
   code .
   ```

3. When prompted, install the recommended Go tools — accept all (gopls, dlv, staticcheck, etc.).

4. Install dependencies:

   ```bash
   go mod download
   ```

5. Copy and configure the environment file:

   ```bash
   cp .env.example .env
   # Edit .env and set ARANGO_HOST, ARANGO_PORT, ARANGO_DB as needed
   ```

   Minimum environment variables:

   ```bash
   export ARANGO_HOST=localhost
   export ARANGO_PORT=8529
   export ARANGO_USER=root
   export ARANGO_DB=ortelius
   ```

## Start ArangoDB

```bash
docker run -it --rm -e ARANGO_NO_AUTH=1 -p 8529:8529 -v $HOME/arangodb:/var/lib/arangodb3 arangodb
```

The ArangoDB Web UI is available at `http://localhost:8529`. No authentication is required.

## Running and Debugging

### Run the Server

Open the integrated terminal (`Ctrl+\``) and run:

```bash
go run .
```

### Debugging in VS Code

Create a `.vscode/launch.json` if one is not already in the repo:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Go: Launch Backend",
      "type": "go",
      "request": "launch",
      "mode": "auto",
      "program": "${workspaceFolder}",
      "envFile": "${workspaceFolder}/.env",
      "args": []
    }
  ]
}
```

Set breakpoints in the editor gutter and press `F5` to launch the debugger. The Go extension uses `dlv` (Delve) under the hood — it is installed automatically when you accept the Go tools prompt.

### Run Tests

```bash
go test ./...
```

To run tests with verbose output:

```bash
go test -v ./...
```

You can also run and debug individual tests directly from the editor — VS Code displays **run test** and **debug test** links above each test function.

## Useful Go Commands

```bash
go mod tidy        # clean up dependencies
go vet ./...       # static analysis
go build -o server # build the binary
```

## Line Ending Configuration

Set VS Code to use LF line endings to avoid issues in WSL2 on Windows:

```json
{
  "files.eol": "\n"
}
```

Add this to your workspace `.vscode/settings.json` or user settings.
