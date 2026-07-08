---
title: "OpenSSF Scorecard"
linkTitle: "OpenSSF Scorecard"
weight: 60
type: guides
description: >
  Automated security health scoring for tracked repositories.
---

[OpenSSF Scorecard](https://securityscorecards.dev) is an automated security health score (0–10) for open source repositories, covering things like branch protection, code review practices, and dependency update automation.

[`relscanner-job`](deployment-tracking-github-gitlab/) fetches a Scorecard result automatically for repositories it scans, via the [securityscorecards.dev](https://securityscorecards.dev) API. Results are parameterized by platform, so coverage depends on that project's own GitLab support when scanning GitLab repos.

The backend's own onboarding endpoints don't fetch this automatically — if you're not running `relscanner-job`, you can populate `scorecard_result` on a release yourself via the API. See the [Releases API](../developer-resources/rest-api-reference/releases-api/).

Scorecard scores can be used for filtering on the dashboard: High (8.0+), Medium (6.0–7.9), Low (<6.0). See [Read Your Dashboard](../using-ortelius/read-your-dashboard/).
