---
title: "OCI Attestations"
linkTitle: "OCI Attestations"
weight: 10
type: guides
description: >
  SBOMs attached directly to a container image in the registry.
---

An **OCI Attestation** is an SBOM or other artifact attached directly to a container image in the registry. This is the first source Ortelius' scanner components check for a container-image release:

1. **OCI Referrers API** — looks for an attached artifact with a media type containing `sbom` or `cyclonedx`.
2. **Cosign DSSE attestation** — looks for a DSSE envelope referrer and decodes the predicate.

If neither is present, the scanner falls back to a [GitHub Release Asset](../github-release-assets/), or generates one with [Syft](../syft/) or [cdxgen](../cdxgen/).

The backend's own REST/GitHub-onboarding endpoints don't discover OCI attestations directly — this discovery is performed by the optional [`relscanner-job`](../../deployment-tracking-github-gitlab/) scanner component and the [GKE deployment tracker](../../deployment-tracking-gke/), both of which read OCI image labels (`org.opencontainers.image.*`) to also extract Git source URL and commit SHA.
