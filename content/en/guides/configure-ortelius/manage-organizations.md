---
title: "Manage Organizations"
linkTitle: "Manage Organizations"
weight: 10
type: guides
description: >
  Org settings, credentials, and tracked repositories.
---

Each org stores its own display name, description, and repo-tracking configuration:

```json
{
  "name": "acme",
  "display_name": "ACME Corporation",
  "description": "Main enterprise customer",
  "is_public": false,
  "metadata": { "tier": "enterprise" },
  "tracked_repos": [ /* ... */ ],
  "hidden_repos": []
}
```

## Credentials

An org owner can store a GitHub or GitLab personal access token directly on the org via `POST /api/v1/orgs/:org/credentials`, as an alternative or supplement to the GitHub App installation. Tokens are encrypted at rest and never returned by the API once stored — only connection-status booleans are exposed via `GET /api/v1/orgs/:org/status`.

## Tracked repositories

Add a repo at the org level (rather than relying on individual users' GitHub App access) via `POST /api/v1/orgs/:org/tracked-repos`. This covers both GitHub and GitLab, public or private (with credentials configured).

See [Orgs](../../developer-resources/core-concepts/orgs/) for the underlying data model and role hierarchy, and the [Organizations API](../../developer-resources/rest-api-reference/organizations-api/) for the full endpoint reference.
