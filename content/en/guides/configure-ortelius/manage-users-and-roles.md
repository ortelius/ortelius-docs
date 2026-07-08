---
title: "Manage Users and Roles"
linkTitle: "Manage Users and Roles"
weight: 20
type: guides
description: >
  Ongoing user administration beyond the initial invite.
---

For inviting your first colleagues, see [Invite Your Team](../../using-ortelius/invite-your-team/). This page covers ongoing administration.

## Roles

| Role       | Can do                                                                                    |
|------------|-----------------------------------------------------------------------------------------|
| **Owner**  | Everything, including managing billing and deleting the org                             |
| **Admin**  | Everything except billing — invite users, manage roles, access all resources            |
| **Editor** | Upload releases, upload SBOMs, sync endpoints — the right role for CI/CD service accounts |
| **Viewer** | Read-only — dashboards, CVE details, endpoint status                                    |

A user's stored role is the **highest** role they hold across any org membership. See [Orgs](../../developer-resources/core-concepts/orgs/) for the full role hierarchy model.

## Self-hosted: GitOps RBAC

If you're self-hosting, users and roles can instead be managed declaratively in a Git-backed `rbac.yaml` file rather than through the UI. See [Orgs → GitOps RBAC](../../developer-resources/core-concepts/orgs/#gitops-rbac-peribolos-style) for the format and how it's applied.

## User Management API

For programmatic user administration (admin-only), see the [Users API](../../developer-resources/rest-api-reference/users-api/).
