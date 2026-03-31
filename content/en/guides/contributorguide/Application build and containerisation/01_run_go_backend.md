---
title: "Running the Go Backend Locally"
linkTitle: "Running the Go Backend Locally"
weight: 3
description: >
  Steps required to run the pdvd-backend Go service on your local machine
---

# Running the pdvd-backend Locally

The Ortelius backend ([ortelius/pdvd-backend](https://github.com/ortelius/pdvd-backend)) is a Go REST API that tracks SBOMs through the release lifecycle and maps them to CVEs.

## Tools Needed

- [Go](https://go.dev/dl/) (1.21 or later)
- [VS Code](https://code.visualstudio.com/) with the [Go extension](https://marketplace.visualstudio.com/items?itemName=golang.Go)
- [Docker](https://docs.docker.com/get-docker/) (for the ArangoDB test database)
- [Git](https://git-scm.com/)
- Linux, macOS, or Windows with WSL2

## Clone the Repository

```bash
cd /path/to/working_directory
git clone https://github.com/ortelius/pdvd-backend.git
cd pdvd-backend
```

## Install Dependencies

```bash
go mod download
```

## Start the Test Database

Pull and run ArangoDB locally:

```bash
docker run -it --rm -e ARANGO_NO_AUTH=1 -p 8529:8529 -v $HOME/arangodb:/var/lib/arangodb3 arangodb
```

Connection details:
- Web UI: `http://localhost:8529`
- Database: `ortelius`

## Configure Environment

Copy the example environment file (if present) or set the required variables:

```bash
export ARANGO_HOST=localhost
export ARANGO_PORT=8529
export ARANGO_USER=root
# No auth required with ARANGO_NO_AUTH=1
export ARANGO_DB=ortelius
```

Check the repo's `README` for the full list of required environment variables.

## Run the Server

```bash
go run .
```

The API will start on the port specified in the repo's configuration (check `README` or the config files).

## Run Tests

```bash
go test ./...
```

## Build a Docker Image

```bash
docker build -t pdvd-backend .
docker run -p 8080:8080 pdvd-backend
```

## VS Code Setup

1. Open the `pdvd-backend` folder in VS Code (`File → Open Folder`).
2. When prompted, install the recommended Go tools (gopls, dlv, staticcheck).
3. Use the **Run and Debug** panel (`Ctrl+Shift+D`) to launch and debug the server.
4. Set breakpoints directly in the editor.

## Common Errors

### `go: module not found`
Run `go mod tidy` to clean up and verify dependencies:
```bash
go mod tidy
```

### Database connection refused
Make sure the Docker ArangoDB container is running and the port mapping matches your environment variables.

### Line ending issues (WSL2 on Windows)
If scripts fail with `bad interpreter` errors, convert line endings:
```bash
sudo apt install dos2unix
dos2unix your_script.sh
```
