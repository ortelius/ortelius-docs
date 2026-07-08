---
title: "GitHub Release Assets"
linkTitle: "GitHub Release Assets"
weight: 20
type: guides
description: >
  Acquiring an SBOM from a published GitHub Release's assets.
---

For repositories that publish GitHub Releases directly (rather than, or in addition to, container images), [`relscanner-job`](../../deployment-tracking-github-gitlab/) looks for a release asset whose name matches an SBOM/CycloneDX pattern and downloads it.

If the matched asset isn't itself a valid SBOM (for example, a Java build artifact), the scanner generates one from it using [Syft](../syft/) or [cdxgen](../cdxgen/) instead. There is special handling for Java build artifacts specifically, since these are a common case where the "SBOM-shaped" release asset needs further processing.

This is one of two acquisition paths (the other being the container-image path via [OCI Attestations](../oci-attestations/)) that `relscanner-job` uses, depending on whether it's working from a container image or a GitHub Release.
