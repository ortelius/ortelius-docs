## Ortelius' Pipeline Automation

In order to continuously gather pipeline intelligence, Ortelius must become part of your pipeline. Ortelius integrates into your CI/CD process using the Ortelius Command Line (CLI). The Ortelius CLI gathers supply chain data based on a single pipeline workflow at the build and deploy steps. The build step gathers Swagger, SBOM, Readme, licenses, Git data, Docker image, and other build output. The deploy step records when a release occurs, what was sent and where the objects were sent to. 

### Ortelius Data Gathering using .toml

The Ortelius CLI reads from a .toml file. The .toml file contains non-derived information for each artifact that you create at your build step. In Ortelius, an artifact is referred to as a _Component_.  A _Component_ is a Container, DB Object, or file object (.jar, Lamda Function, Apex file, etc.). The .toml file will provide the 'non-derived' data for the _Component_ your are tracking in Ortelius which includes the _Component_ name, owner, _Component type_, and owner contact details.  The Ortelius CLI will read the .toml file from the Git Repository associated to your pipeline. If you are using a Mono Repository for your entire codebase, you will need a separate Component.toml file for each _Component_, managed in sub-directories.

In a cloud-native, microservice architecture there are many, if not hundreds, of _Components_. Organizing your _Components_ within Ortelius is done in two ways. They are grouped based on a subject _Domain_ and assigned to a logical _Application_. Not all _Components_ need to be assigned to an _Application_, but they should be stored in a subject matter _Domain_ so they can be easily found and reused. 

 A logical _Application_ is a collection of _Components_ that make up a complete software systems consumed by an end user. Applications are composed of shared _Components_ and _Application_ specific _Components_, and are a logical representation of what _Components_ need to be deployed in order for the software system to run. 

>Note: Once created, your .toml file does not need to be updated unless the non-derived information changes, or you want to reorganize to which Applications or _Domains_ the Component has been assigned. For example, a Component has been reassigned to a new owner and new team represented by a _Domain_ or _Application_.

Perform the following steps to add your _Components_ using the .toml file:

#### Step 1 - Define Your Ortelius Pipeline Variables

The following variables should be set at the beginning of your Pipeline.

| Variable | Value | Description |
| ------- | ----- | ----------- |
| DHURL | URL to Ortelius Login | The URL used to access Ortelius. |
| DHUSER  | UserID | The ID used to log into Ortelius |  
| DHPASS | password | The password used to log into Ortelius. This can encrypted based on the CI/CD solution. |
| DOCKERREPO | Name of your Docker Repository | For Components that are Docker Images. Not needed for non-docker objects. |
| IMAGE_TAG | Tag for the Docker Image if used | For Components that are Docker Images. Not needed for non-docker objects. |

Example

```bash
export DHURL=https://deployhub.example.com
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
    SlackChannel = "your slack channel"
    ServiceOwner = "your Component Developer Name"
    ServiceOwnerEmail = "your Component Owner Email"
```

For example:

```toml
# Application Name and Version
Application = "GLOBAL.Welcome"
Application_Version = "1.0.0" 

# Define Component Name, Variant and Version
Name = "GLOBAL.hello-world"
Variant = "${GIT_BRANCH}"
Version = "v1.0.0.${BUILD_NUM}-g${SHORT_SHA}"


# Key/Values to associate to the Component Version
[Attributes]
    DockerBuildDate = "${BLDDATE}"
    DockerRepo = "${DOCKERREPO}"
    DockerSha = "${DIGEST}"
    DockerTag = "${IMAGE_TAG}"
    SlackChannel = "OrteliusSlack"
    ServiceOwner= "Jane Coder"
    ServiceOwnerEmail = "JC@ortelius.io"

```

#### Step 3 - Add a step in your pipeline to run Syft if you are not generating SBOMS (Optional)
Ortelius can consume any SPDX and CycloneDX formatted SBOM. If you are already generating SBOMs, you will pass the name of the SBOM results to Ortelius is step 4 below. If you are not generating SBOMs as part of your pipeline process, you will need to add SBOM generation to collect the lower dependency data. Following is how to add Syft to your workflow to include the collection of SBOM data. 

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

>Note: To complete the process you will need to install the Ortelius CLI where your CI/CD server is running. Refer to the [Ortelius GitHub CLI Documentation](https://github.com/ortelius/cli/blob/main/doc/dh.md) for installation instructions. 

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

## Results

<img src='/helloworld-comp-details.png'  />
<img src='/helloworld-comp-sbom.png'  />
<img src='/helloworld-comp-license.png'  />
<img src='/helloworld-comp-kv.png'  />
<img src='/helloworld-comp-readme.png'  />
