---
title: "Repositories"
linkTitle: "Repositories"
weight: 30
type: guides
description: >
  How a connected GitHub or GitLab repo maps onto Ortelius objects.
---

A **repository** itself isn't a first-class stored object in Ortelius — instead, an org's `tracked_repos` list records which GitHub or GitLab repositories are being watched, and each repository produces the objects that are stored: [Releases](../releases/), and — where CI runs succeed — [Endpoints](../endpoints/) and [Sync Records](../sync-records/).

```json
{
  "tracked_repos": [
    { "provider": "github", "owner": "acme", "name": "payment-service", "private": true, "added_by": "alice", "added_at": "2024-11-01T10:00:00Z" }
  ]
}
```

A repo gets tracked one of three ways, corresponding to the three onboarding passes described in [Select Repositories to Watch](../../../start-here/select-repositories-to-watch/) and [Deployment Tracking Using GitHub and GitLab](../../../integrations/deployment-tracking-github-gitlab/):

1. Connected via the GitHub App installation
2. Explicitly tracked at the org level (`org.tracked_repos`)
3. Publicly favorited by any user, system-wide

See [GitHub Integration](../../../integrations/github-integration/) and [GitLab Integration](../../../integrations/gitlab-integration/) for the full connection reference.
