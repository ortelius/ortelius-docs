---
title: "Connect GitHub"
linkTitle: "Connect GitHub"
weight: 70
type: guides
description: >
  Authorize the Ortelius GitHub App so it can see your repositories.
aliases:
  - /guides/userguide/connect-your-github-repositories/
---

Connecting your GitHub account is the fastest way to get repository and release metadata into Ortelius, though — see the note at the end of this page — it does **not** by itself give you vulnerability data.

## Step 1 — Connect GitHub

1. On the **Welcome** page, click **Connect GitHub Account** (or, from the top-right menu, go to **Profile → Connect GitHub**).
2. You'll be redirected to GitHub to install the Ortelius GitHub App on your account or organization.
3. Select which repositories to give Ortelius access to — you can start with one and add more later.
4. After approving, you'll be redirected back to Ortelius with GitHub connected.

> The Profile page also has a **GitHub Integration** panel for checking connection status and viewing which repos the App can currently see, but repo import/selection itself happens on the Welcome page, not Profile.

## Granting access to more repos later

To grant the GitHub App access to more repos after the fact, visit [GitHub Settings → Applications → Installed GitHub Apps](https://github.com/settings/installations), click **Configure** next to the Ortelius app, and adjust repository access.

## What this step does — and doesn't — do

Connecting GitHub authorizes Ortelius to see your repositories. It does not, by itself, import them — that's the next step, [Select Repositories to Watch](../select-repositories-to-watch/).

For the full technical reference on the GitHub App integration (including onboarding APIs and Actions-based deployment tracking), see [GitHub Integration](../../integrations/github-integration/) in Integrations.
