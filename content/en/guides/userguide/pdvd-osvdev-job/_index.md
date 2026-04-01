---
title: "Vulnerability Database Sync"
linkTitle: "Vulnerability Database Sync"
weight: 7
---

The OSV Loader (`pdvd-osvdev-job`) is a Kubernetes CronJob that continuously synchronizes vulnerability intelligence from [osv.dev](https://osv.dev) into the Ortelius evidence store. It is the foundation of Ortelius' post-deployment security model — without it, no CVE matching occurs against your deployed components.

## What It Does

On each run the loader fetches the full list of ecosystems published by osv.dev, then for each ecosystem downloads and processes the vulnerability feed. For every new or updated entry it:

1. Normalizes the vulnerability record — package names, version ranges, CVE/GHSA alias mappings, and CVSS scores
2. Upserts the record into ArangoDB, skipping entries whose modification timestamp has not changed since the last run
3. Builds `cve2purl` hub edges linking each CVE to the package PURLs it affects, with parsed version range metadata for fast query-time matching
4. Rebuilds `release2cve` materialized edges — connecting any existing release records whose SBOM packages fall within the affected version ranges
5. Updates lifecycle tracking records for all active endpoints, recording whether each CVE was disclosed before or after the software was deployed

## How It Fits Into Ortelius

Ortelius correlates the packages listed in your release SBOMs against the vulnerability intelligence ingested by this job. When a new CVE is disclosed against a package you have deployed, Ortelius detects it within the next sync cycle and surfaces it on your dashboard with MTTR tracking, SLA status, and blast-radius analysis across all affected endpoints.

CVE data is refreshed from OSV.dev every 15 minutes by default. The loader uses a high-water-mark per ecosystem so only genuinely new or updated vulnerability records are processed on each run, keeping execution fast even as the OSV dataset grows.

## Supported Ecosystems

All ecosystems published in the OSV ecosystem index are processed automatically, including npm, PyPI, Maven, Go, NuGet, RubyGems, cargo (crates.io), Composer, apk (Alpine/Wolfi), and deb (Debian/Ubuntu). No configuration is required to add a new ecosystem — if OSV publishes it, the loader will pick it up.

## Schedule

The CronJob runs every 15 minutes by default (`*/15 * * * *`) with `concurrencyPolicy: Forbid` to prevent overlapping runs. For regulated or mission-critical environments a tighter interval such as every 6 hours is recommended to minimise exposure window between OSV disclosure and detection in Ortelius.

## State Persistence

The loader tracks the last processed modification timestamp per ecosystem in ArangoDB. This prevents redundant reprocessing and ensures that lifecycle and edge updates are triggered only for genuinely new vulnerability disclosures.
