---
title: "Verify Your Data"
linkTitle: "Verify Your Data"
weight: 90
type: guides
description: >
  Confirm your onboarded repositories are showing up correctly.
aliases:
  - /guides/userguide/data-validation/
---

After onboarding, go to your dashboard. You should see:

- Your repositories listed under **Releases**, with a version per GitHub release.
- `github-actions/<owner>/<repo>` listed as an endpoint under **Endpoints**, if any workflow runs succeeded.

If both of those are present, your release and deployment metadata is flowing correctly. That's expected at this stage even if you don't see any CVEs yet — see [Attach or Discover SBOMs](../attach-or-discover-sboms/) and [Sync Vulnerability Data](../sync-vulnerability-data/) for the next layer of data.

Next: [Attach or Discover SBOMs](../attach-or-discover-sboms/).
