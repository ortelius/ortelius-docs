---
title: "Connect GitHub"
linkTitle: "Connect GitHub"
weight: 10
type: guides
description: >
  How the Ortelius GitHub App installation flow works, and how to configure it for a self-hosted deployment.
---

Ortelius connects to GitHub via a **GitHub App** installation, which grants access to specific repositories without requiring a personal access token per user.

## User-facing flow

1. From the **Welcome** page or **Profile → Connect GitHub**, the user is redirected to GitHub to install the Ortelius GitHub App.
2. The user selects which repositories to grant access to.
3. GitHub redirects back to Ortelius with the installation connected, and the installation ID is stored against the user (and optionally the org).

## Self-hosted configuration

To offer this flow on a self-hosted deployment, create your own GitHub App:

1. Create a GitHub App at `https://github.com/settings/apps/new`.
2. Set the callback URL to `<BASE_URL>/api/v1/auth/github/callback`.
3. Required permissions: `Contents: Read`, `Actions: Read`.
4. Generate and download a private key (PEM format).
5. Configure environment variables:

```bash
GITHUB_APP_ID=123456
GITHUB_APP_NAME=my-ortelius-app
GITHUB_CLIENT_ID=Iv1.abc123
GITHUB_CLIENT_SECRET=abc123...
GITHUB_PRIVATE_KEY="-----BEGIN RSA PRIVATE KEY-----\n..."
```

## Org-level tokens as an alternative

An org owner can instead store a GitHub or GitLab personal access token directly on the org via `POST /api/v1/orgs/:org/credentials`, encrypted at rest with `TOKEN_ENCRYPTION_KEY`. See [Manage Organizations](../../../configure-ortelius/manage-organizations/).

## "Sign in with GitHub" is separate

This App-installation flow is independent of the "Sign in with GitHub" OAuth login button, which is purely for authentication and configured via `GITHUB_OAUTH_CLIENT_ID` / `GITHUB_OAUTH_CLIENT_SECRET` / `GITHUB_OAUTH_REDIRECT_URL`. See the [Architecture Guide](../../../developer-resources/core-concepts/architecture-guide/#optional-integrations) for the full environment variable reference.
