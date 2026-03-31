---
title: "Containerising the Next.js Frontend"
linkTitle: "Containerising the Next.js Frontend"
weight: 4
description: >
  Steps required to build and run the pdvd-frontend in Docker
---

# Containerising the pdvd-frontend

## Before Starting

- Docker installed and running
- WSL2 (Windows) or native Linux/macOS terminal
- The `pdvd-frontend` repo cloned locally

## Dockerfile

The repo includes a `Dockerfile`. A typical Next.js multi-stage build:

```dockerfile
# Install dependencies
FROM node:20-alpine AS deps
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci

# Build
FROM node:20-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run build

# Run
FROM node:20-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json
EXPOSE 3000
CMD ["npm", "start"]
```

> Check the repo's actual `Dockerfile` — use that file rather than overwriting it.

## Build the Image

```bash
docker build -t ortelius/pdvd-frontend .
```

## Run the Container

```bash
docker run -p 3000:3000 \
  -e NEXT_PUBLIC_API_URL=http://localhost:8080 \
  ortelius/pdvd-frontend
```

Visit `http://localhost:3000` to confirm the frontend is running inside the container.

## Run with Docker Compose

If the repo includes a `docker-compose.yml`, bring up the full stack (frontend + backend + database) with:

```bash
docker compose up --build
```

## Push to a Registry

```bash
docker tag ortelius/pdvd-frontend quay.io/ortelius/pdvd-frontend:latest
docker push quay.io/ortelius/pdvd-frontend:latest
```
