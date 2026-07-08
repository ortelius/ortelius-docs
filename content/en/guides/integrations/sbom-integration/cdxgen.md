---
title: "cdxgen"
linkTitle: "cdxgen"
weight: 40
type: guides
description: >
  SBOM generation for ecosystems Syft doesn't characterize well, especially C/C++.
---

[cdxgen](https://github.com/CycloneDX/cdxgen) is used as a further fallback SBOM generator, particularly for **C/C++ repositories** that Syft can't characterize well.

`relscanner-job` detects build markers (`CMakeLists.txt`, `Makefile`, etc.) in a clone of the repository and runs cdxgen against it when:

- No [OCI attestation](../oci-attestations/) or [GitHub Release asset](../github-release-assets/) SBOM is found, and
- [Syft](../syft/) is not well-suited to the project's build system

This is the last tier in the SBOM acquisition priority order for both the container-image and GitHub-Release acquisition paths.
