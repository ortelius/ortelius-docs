---
title: "SPDX, CycloneDX and Syft"
linkTitle: "SPDX, CycloneDX and Syft"
weight: 322
description: >
  Collecting SBOM data with SPDX, CycloneDX and Syft.
---

![SBOM Tools](/guides/userguide/images/SBOM-tools.png)

Ortelius can consume any SPDX and CycloneDX formatted SBOM. If you are already generating SBOMs, you will pass the name of the SBOM results to Ortelius as shown below. If you are not generating SBOMs as part of your pipeline process, you will need to add SBOM generation to collect the lower dependency data. Following is how to add Syft to your workflow to include the collection of SBOM data.

## Adding Syft to your Pipeline Automation

[Syft SBOM tool](https://github.com/anchore/syft) will generate Software Bill of Material Reports for popular coding languages and package managers, including Docker images.

The following code example scans a Docker Image to generate the SBOM.  See [Syft Options](https://github.com/anchore/syft#supported-sources) to scan other objects and coding languages.

```bash
# install Syft
curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b $PWD

# create the SBOM
./syft packages $DOCKERREPO:$IMAGE_TAG --scope all-layers -o cyclonedx-json > cyclonedx.json

# display the SBOM
cat cyclonedx.json
```

## Passing the Name of the SBOM Results

>Note: To complete the process you will need to install the Ortelius CLI where your CI/CD server is running. Refer to the [Ortelius GitHub CLI Documentation](https://github.com/ortelius/ortelius-cli/blob/main/doc/dh.md) for installation instructions.

Execute the following calls to the Ortelius CLI as part of your workflow. It should be called after the build and SBOM generation:

With CycloneDX SBOM

```bash
dh updatecomp --rsp component.toml --deppkg "cyclonedx@name of your SBOM file"

Example:
dh updatecomp --rsp component.toml --deppkg "cyclonedx@cyclonedx.json"
```

With SPDX SBOM

```bash
dh updatecomp --rsp component.toml --deppkg "spdx@name of your SBOM file. "

Example:
dh updatecomp --rsp component.toml --deppkg "spdx@spdx.json"
```

## Results

SBOM details are available at the _Component Version_ and _Application Version_ details pages.   Also, the SBOM with the associated CVE data can be exported to a PDF.  To export the SBOM and CVEs, go to the _Application_ list view, select an _Application Version_.  Then choose the
menu item `Reports -> Export SBOM`.  The PDF will be generated showing all of the _Component Versions_, SBOM Packages and any associated CVEs
aggregated up to the selected _Application Version_.

[Example _Application Version_ SBOM and CVEs](/sbom.pdf)
