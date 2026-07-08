---
title: "Orgs"
linkTitle: "Orgs"
weight: 20
type: guides
description: >
  Multi-tenancy, org isolation, and the role hierarchy.
---

An **Org** is the top-level tenant boundary in Ortelius. Every release, endpoint, and sync record carries an `org` field, and access is scoped accordingly.

## Org Isolation

Queries filter by the requesting user's `orgs[]` array. Users with an empty `orgs: []` array have **global access** — the pattern used for system administrators.

Org names are normalized to **lowercase** throughout the system. `display_name` preserves original casing for display purposes.

## Role Hierarchy

User role is stored on the user document and is the **highest role** the user holds across all org memberships.

```text
owner → admin → editor → viewer
```

| Role       | Key Permissions                               |
|------------|-------------------------------------------------|
| **owner**  | Full access + org deletion                    |
| **admin**  | Full access + user management                 |
| **editor** | Upload releases, upload SBOMs, sync endpoints |
| **viewer** | Read-only                                     |

To invite people into your org day-to-day, see [Invite Your Team](../../../using-ortelius/invite-your-team/). To manage orgs and roles as an ongoing admin task, see [Manage Organizations](../../../configure-ortelius/manage-organizations/) and [Manage Users and Roles](../../../configure-ortelius/manage-users-and-roles/).

## GitOps RBAC (Peribolos-style)

For self-hosted deployments, RBAC can be defined in a YAML file (`rbac.yaml`) stored in a Git repository. The format separates identity (users block) from permissions (orgs block):

```yaml
orgs:
  - name: acme-corp
    display_name: ACME Corporation
    members:
      - username: alice
        role: owner
      - username: bob
        role: editor

users:
  - username: alice
    email: alice@acme.com
    auth_provider: local
  - username: bob
    email: bob@acme.com
    auth_provider: local
```

RBAC is applied at three points:

1. **Startup** — clones `RBAC_REPO` (or reads `RBAC_CONFIG_PATH`) and applies
2. **Webhook** — `POST /api/v1/rbac/webhook` triggers a fresh clone + apply
3. **Direct API** — `POST /api/v1/rbac/apply/content` (YAML body) or `POST /api/v1/rbac/apply/upload` (file upload)

Users not present in the YAML are set to `is_active: false, status: removed` on the next sync — they are not deleted.

> **Deployment prerequisite:** Signup requires `RBAC_REPO` and `RBAC_REPO_TOKEN` to be configured. If neither is set, the system falls back to `RBAC_CONFIG_PATH` (a local file path). If no RBAC source is configured, the signup endpoint returns a 500. Bootstrap the first admin user via `ADMIN_USERNAME` / `ADMIN_PASSWORD` environment variables instead — see [Self-Hosted Installation](../../../start-here/choose-your-path/self-hosted/).

This GitOps RBAC model is specific to self-hosted deployments; the hosted SaaS manages orgs and roles entirely through the UI and API described in [Configure Ortelius](../../../configure-ortelius/).
