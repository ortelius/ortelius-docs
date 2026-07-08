---
title: "Search for Packages"
linkTitle: "Search for Packages"
weight: 10
type: guides
description: >
  Find a specific package across your releases.
---

Use the **Name/Package** filter (text-based search) to find a specific package across all your tracked releases, or search by exact **CVE ID** if you already know which vulnerability you're chasing.

Package identity in Ortelius is based on a standardized **PURL** (Package URL) — see the [Glossary](../../../reference/glossary/) — so the same package is matched consistently whether it comes from a CVE record (OSV data) or an SBOM component (CycloneDX data).

From a package search result, you can jump to:

- Every release that includes that package
- [Review CVE Details](../review-cve-details/) for any vulnerabilities affecting it
- [Review Blast Radius / Impact](../review-blast-radius-impact/) to see every deployed endpoint it affects
