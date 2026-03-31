---
title: "Containerising the Go Backend"
linkTitle: "Containerising the Go Backend"
weight: 4
description: >
  Steps required to build and run the pdvd-backend in Docker
---

# Containerising the pdvd-backend

## Before Starting

- Docker installed and running
- WSL2 (Windows) or native Linux/macOS terminal
- The `pdvd-backend` repo cloned locally

## Dockerfile

The repo includes a `Dockerfile`. A typical multi-stage Go build looks like this:

```dockerfile
# Build stage
FROM golang:1.21-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o server .

# Run stage
FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/server .
EXPOSE 8080
ENTRYPOINT ["./server"]
```

> Check the repo's actual `Dockerfile` — use that file rather than overwriting it.

## Build the Image

```bash
docker build -t ortelius/pdvd-backend .
```

## Run the Container

Pass your environment variables directly or use a `.env` file:

```bash
docker run -p 8080:8080 \
  -e ARANGO_HOST=host.docker.internal \
  -e ARANGO_PORT=8529 \
  -e ARANGO_USER=root \
  -e ARANGO_NO_AUTH=1 \
  -e ARANGO_DB=ortelius \
  ortelius/pdvd-backend
```

(On Linux, replace `host.docker.internal` with your actual host IP.)

The API will be available at `http://localhost:8080`.

## Run with Docker Compose

If the repo includes a `docker-compose.yml`, use:

```bash
docker compose up --build
```

This brings up the backend alongside any required services (e.g., ArangoDB) defined in the compose file.

## Push to a Registry

```bash
docker tag ortelius/pdvd-backend quay.io/ortelius/pdvd-backend:latest
docker push quay.io/ortelius/pdvd-backend:latest
```

Ortelius container images live on [Red Hat Quay](https://quay.io/).
