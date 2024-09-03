## Ortelius' Pipeline Automation POC

In order to continuously gather pipeline intelligence, Ortelius must become part of your pipeline. Ortelius integrates into your CI/CD process using the Ortelius Command Line (CLI). The Ortelius CLI gathers supply chain data based on a single pipeline workflow at the build and deploy steps. The build step gathers Swagger, SBOM, Readme, licenses, Git data, Docker image, and other build output. The deploy step records when a release occurs, what was sent and where the objects were sent to.

For the most up to date information on the Ortelius CLI visit the [Ortelius GitHub Repository](https://github.com/Ortelius/cli/blob/main/doc/dh.md). You will find a complete list of parameters for collecting Swagger, SBOM and other tool reports and results.

You can complete a POC setup using Ortelius integrated into your Pipeline. [Download the complete Ortelius POC Document](/Ortelius-General-Poc.pdf) to get started.

### Install the Ortelius CLI
Install the Ortelius CLI to complete your POC. Install the Ortelius CLI where your CI/CD server is running. Refer to the [Ortelius GitHub CLI Documentation](https://github.com/Ortelius/cli/blob/main/doc/dh.md) for installation instructions.  

### Ortelius Data Gathering using .toml

The Ortelius CLI reads from a .toml file. The .toml file contains non-derived information for each artifact that you create at your build step. In Ortelius, an artifact is referred to as a _Component_.  A _Component_ is a Container, DB Object, or file object (.jar, Lamda Function, Apex file, etc.). The .toml file will provide the 'non-derived' data for the _Component_ your are tracking in Ortelius which includes the _Component_ name, owner, _Component type_, and owner contact details.  The Ortelius CLI will read the .toml file from the Git Repository associated to your pipeline. If you are using a Mono Repository for your entire codebase, you will need a separate Component.toml file for each _Component_, managed in sub-directories.

In a cloud-native, microservice architecture there are many, if not hundreds, of _Components_. Organizing your _Components_ within Ortelius is done in two ways. They are grouped based on a subject _Domain_ and assigned to a logical _Application_. Not all _Components_ need to be assigned to an _Application_, but they should be stored in a subject matter _Domain_ so they can be easily found and reused.

 A logical _Application_ is a collection of _Components_ that make up a complete software systems consumed by an end user. Applications are composed of shared _Components_ and _Application_ specific _Components_, and are a logical representation of what _Components_ need to be deployed in order for the software system to run.

>Note: Once created, your .toml file does not need to be updated unless the non-derived information changes, or you want to reorganize to which Applications or _Domains_ the Component has been assigned. For example, a Component has been reassigned to a new owner and new team represented by a _Domain_ or _Application_.

Perform the following steps to add your _Components_ using the .toml file:

#### Step 1 - Define Your DeployHub Pipeline Variables

The following variables should be set at the beginning of your Pipeline.

| Variable | Value | Description |
| ------- | ----- | ----------- |
| DHURL | URL to DeployHub Login | The URL used to access DeployHub. |
| DHUSER  | UserID | The ID used to log into DeployHub |  
| DHPASS | password | The password used to log into DeployHub. This can encrypted based on the CI/CD solution. |
| DOCKERREPO | Name of your Docker Repository | For Components that are Docker Images. Not needed for non-docker objects. |
| IMAGE_TAG | Tag for the Docker Image if used | For Components that are Docker Images. Not needed for non-docker objects. |

Example

```bash
export DHURL=https://console.ortelius.com
export DHUSER=Stella99
export DHPASS=chasinghorses
export DOCKERREPO=quay.io/ortelius/hello-world
export IMAGE_TAG=1.0.0
```

#### Step 2 - Create your Component.toml file

Cut and paste the following into a component.toml file, update 'your' information, and commit/push it to your Git Repository.

```toml
# Application Name and Version - not required. If not used the Component will not be associated to an Application
Application = "GLOBAL."your Application Name"
Application_Version = "your Application Version" 

# Define Component Name, Variant and Version - required
Name = "GLOBAL.your Component Name"
Variant = "${GIT_BRANCH}"
Version = "vyour Component Version.${BUILD_NUM}-g${SHORT_SHA}"

# Key/Values to associate to the Component Version
[Attributes]
    DockerBuildDate = "${BLDDATE}"
    DockerRepo = "${DOCKERREPO}"
    DockerSha = "${DIGEST}"
    DockerTag = "${IMAGE_TAG}"
    DiscordChannel = "your Discord channel" or SlackChannel = "your Slack Channel" 
    ServiceOwner = "${DHUSER}"
    ServiceOwnerEmail = "your Component Owner Email"
```

For example:

```toml
# Application Name and Version
Application = "GLOBAL.Santa Fe Software.Online Store Company.Hipster Store.Prod.helloworld app"
Application_Version = "1" 

# Define Component Name, Variant and Version
Name = "GLOBAL.Santa Fe Software.Online Store Company"
Variant = "${GIT_BRANCH}"
Version = "v1.0.0.${BUILD_NUM}-g${SHORT_SHA}"


# Key/Values to associate to the Component Version
[Attributes]
    DockerBuildDate = "${BLDDATE}"
    DockerRepo = "${DOCKERREPO}"
    DockerSha = "${DIGEST}"
    DockerTag = "${IMAGE_TAG}"
    DiscordChannel = "https://discord.gg/wM4b5yEFzS"
    ServiceOwner= "${DHUSER}"
    ServiceOwnerEmail = "stella@DeployHub.io"

```

#### Step 3 - Add a step in your pipeline to run Syft if you are not generating SBOMS (Optional)
DeployHub can consume any SPDX and CycloneDX formatted SBOM. If you are already generating SBOMs, you will pass the name of the SBOM results to DeployHub is step 4 below. If you are not generating SBOMs as part of your pipeline process, you will need to add SBOM generation to collect the lower dependency data. Following is how to add Syft to your workflow to include the collection of SBOM data.

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

#### Step 4 - Run the Ortelius CLI to add Your Component and Create an Application

>Note: To complete the process you will need to install the Ortelius CLI where your CI/CD server is running. Refer to the [Ortelius GitHub CLI Documentation](https://github.com/Ortelius/cli/blob/main/doc/dh.md) for installation instructions.

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
```

## Expected Results
Bring up your Ortelius URL and login using the DHUSER and DHPASS from Step 1 above.

### Application to Component Dependencies
Select Your Application from the ‘Application View.’ It should show you one Component as a dependency.

<img src='/ApplicationComponentDepVersions.png'  />
<div style="margin-left:20%"></div>

### Application Level SBOM and CVE
Review the Application SBOM and vulnerabilities. Note: CVE Results may vary depending on the time of the scan.

<img src='/ApplicationSBOMandCVE.png'  />
<div style="margin-left:20%"><br></div>

### Component Ownership
Go to the ‘Component View’. You should see your Component Ownership and Detail, including its SBOM and vulnerabilities.

<img src='/Componetownership.png'  />
<div style="margin-left:20%"></div>

### Supply Chain “Package” Search
Go to the ‘Application View.’ Select ‘Package Search’ from the high-level menu. Enter a package name such as ‘spring’ to identify all locations where the package is used.

<img src='/packagesearch.png'  />
<div style="margin-left:20%"></div>
<br>
<img src='/PackageSerachResults.png'  />
<div style="margin-left:20%"></div>
