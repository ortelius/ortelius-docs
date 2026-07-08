---
title: "Syft"
linkTitle: "Syft"
weight: 30
type: guides
description: >
  On-the-fly SBOM generation when no attestation or release asset is available.
---

[Syft](https://github.com/anchore/syft) is used as an on-the-fly SBOM generator whenever no [OCI attestation](../oci-attestations/) or usable [GitHub Release asset](../github-release-assets/) is found.

- **Container image path**: the scanner pulls the container image and generates a CycloneDX JSON SBOM locally.
- **GitHub Release path**: Syft (or [cdxgen](../cdxgen/)) runs against the downloaded release asset, or as a final fallback against a full clone of the repo's source tree.

Syft is also used by the [GKE deployment tracker](../../deployment-tracking-gke/) as its fallback when no Cosign attestation is attached to a deployed image.
