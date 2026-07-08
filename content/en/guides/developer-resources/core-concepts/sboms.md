---
title: "SBOMs"
linkTitle: "SBOMs"
weight: 50
type: guides
description: >
  The Software Bill of Materials attached to each release.
---

An **SBOM** (Software Bill of Materials) is a machine-readable inventory of every library a release depends on, stored as CycloneDX JSON.

```json
{
  "_key": "...",
  "contentsha": "sha256:...",
  "objtype": "SBOM",
  "content": { "...": "CycloneDX JSON" }
}
```

SBOMs are deduplicated by SHA256 content hash and linked to a release via the `release2sbom` edge. Each package inside an SBOM is linked to a version-free [PURL hub node](../how-ortelius-objects-relate/) via `sbom2purl`, which is how CVE matching finds candidates.

## How SBOM data reaches a release

See [Attach or Discover SBOMs](../../../start-here/attach-or-discover-sboms/) for the setup-flow explanation, and [SBOM Integration](../../../integrations/sbom-integration/) for the full list of sources Ortelius can pull an SBOM from (OCI attestations, GitHub Release assets, Syft, cdxgen).
