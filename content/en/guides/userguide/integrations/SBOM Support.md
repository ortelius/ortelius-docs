---
title: "SBOMs and Ortelius"
linkTitle: "SBOMs and Ortelius"
weight: 307
description: >
  Passing Your SBOMs to Ortelius
---

## Ortelius' Pipeline Automation and SBOMs

Ortelius can store your Software Bill of Material scan results for each image 'build.'

You will need to set up Ortelius to be called by your DevOps Pipeline using the Ortelius CI/CD Command Line Interface. For more information refer to the [CI/CD Integration.](/guides/userguide/integrations/ci-cd_integrations/)

>Note: To complete the process you will need to install the Ortelius CLI where your CI/CD server is running. Refer to the [Command Line Interface Installation](/guides/userguide/installation-and-support/0-commandlineinterface/) for installation instructions.

### SPDX or CycloneDX

Ortelius can consume any SPDX and CycloneDX formatted SBOM. If you are already generating SBOMs, you will pass the name of the SBOM results to Ortelius. If you are not generating SBOMs as part of your pipeline process, you will need to add SBOM generation to collect the lower dependency data. Following is how to add Syft to your workflow to include the collection of SBOM data.

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


## Run the Ortelius CLI

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
Without SBOM

```bash
dh updatecomp --rsp component.toml