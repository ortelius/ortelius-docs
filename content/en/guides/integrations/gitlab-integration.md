---
title: "GitLab Integration"
linkTitle: "GitLab Integration"
weight: 20
type: guides
description: >
  Connect GitLab repositories using a personal access token.
---

Unlike GitHub, Ortelius does not currently offer a GitLab App installation flow — GitLab repositories are connected using a personal access token (PAT) instead.

## Org-level token

An org owner stores a GitLab PAT directly on the org via `POST /api/v1/orgs/:org/credentials`, encrypted at rest with `TOKEN_ENCRYPTION_KEY`. Once configured, GitLab repos can be added the same way as GitHub repos — see [Manage Organizations](../../configure-ortelius/manage-organizations/).

## System-wide public tracked repos

Public GitLab repositories can be favorited by name by any authenticated user via `POST /api/v1/tracked-repos`, using a system-wide `GITLAB_TOKEN` fallback — no org credential required.

## What gets tracked

Once connected, GitLab repos go through the same scanning passes as GitHub repos in [Deployment Tracking Using GitHub and GitLab](../deployment-tracking-github-gitlab/) — release discovery, SBOM acquisition, and OpenSSF Scorecard lookup (scorecard coverage depends on that project's own GitLab support).
