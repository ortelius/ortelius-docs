---
title: "Running the Next.js Frontend Locally"
linkTitle: "Running the Next.js Frontend Locally"
weight: 3
description: >
  Steps required to run the pdvd-frontend Next.js application on your local machine
---

# Running the pdvd-frontend Locally

The Ortelius frontend ([ortelius/pdvd-frontend](https://github.com/ortelius/pdvd-frontend)) is a Next.js application that provides the web UI for the Package, Dependency, Vulnerability Dashboard.

## Tools Needed

- [Node.js LTS](https://nodejs.org/) (includes npm)
- [VS Code](https://code.visualstudio.com/)
- [Git](https://git-scm.com/)
- Linux, macOS, or Windows with WSL2

## Clone the Repository

```bash
cd /path/to/working_directory
git clone https://github.com/ortelius/pdvd-frontend.git
cd pdvd-frontend
```

## Install Dependencies

```bash
npm install
```

## Configure Environment

Copy the example env file and update values as needed:

```bash
cp .env.example .env.local
```

Set `NEXT_PUBLIC_API_URL` (or the equivalent variable in the repo) to point at your local backend:

```
NEXT_PUBLIC_API_URL=http://localhost:8080
```

Check the repo's `README` for the full list of environment variables.

## Run the Development Server

```bash
npm run dev
```

Open `http://localhost:3000` in your browser. The page hot-reloads as you edit files.

## Build for Production

```bash
npm run build
npm start
```

## Run Tests

```bash
npm test
```

## Containerise the Frontend

```bash
docker build -t pdvd-frontend .
docker run -p 3000:3000 pdvd-frontend
```

Visit `http://localhost:3000` to confirm the containerised app is running.

## VS Code Setup

1. Open the `pdvd-frontend` folder in VS Code.
2. Install the recommended extensions: ESLint, Prettier, and the VS Code Next.js snippets.
3. The integrated terminal (`Ctrl+\``) is the easiest way to run `npm` commands.
4. Use the **Run and Debug** panel to attach the Node.js debugger.

## Common Errors

### `npm install` fails or `ENOENT` errors
Make sure you are using the Node.js LTS version. Use [nvm](https://github.com/nvm-sh/nvm) to manage Node versions:
```bash
nvm install --lts
nvm use --lts
```

### API calls return CORS or connection errors
Ensure the backend (`pdvd-backend`) is running and the `NEXT_PUBLIC_API_URL` in `.env.local` is correct.

### Line ending issues (WSL2 on Windows)
If npm scripts fail, convert line endings:
```bash
sudo apt install dos2unix
dos2unix your_script.sh
```
