---
title: "SBOM Integration"
linkTitle: "SBOM Integration"
weight: 50
type: guides
description: >
  The sources Ortelius can pull or generate an SBOM from, in priority order.
---

Ortelius (via [`relscanner-job`](../deployment-tracking-github-gitlab/) and the [GKE tracker](../deployment-tracking-gke/)) looks for an SBOM in this general priority order, falling back through each tier before giving up:

1. [OCI Attestations](oci-attestations/)
2. Cosign DSSE attestation (see [OCI Attestations](oci-attestations/))
3. [GitHub Release Assets](github-release-assets/)
4. [Syft](syft/) (generated on the fly)
5. [cdxgen](cdxgen/) (fallback, especially for C/C++)

See [Attach or Discover SBOMs](../../start-here/attach-or-discover-sboms/) for the beginner-facing setup explanation.
