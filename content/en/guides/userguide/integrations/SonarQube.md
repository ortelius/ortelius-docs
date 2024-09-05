---
title: "SonarQube Code Quality and Security Solution Integration"
linkTitle: "SonarQube Integration"
weight: 320
description: >
  Associating Sonar Project Status, Bugs, Code Smells, and Violations to your _Component Version_.
---

## SonarQube

Ortelius can associate SonarQube Project Status, Bugs, Code Smells, and Violations metrics to your _Component Version_.  Associating these metrics enable compliance scoring for _Application Versions_ since the metrics are rolled-up from the _Component Versions_ to the _Application Version_.  See the Application Compliance Summary below for details.

### Example Compliance Summary Report

![Summary with SonarQube Metrics](/scorecard-complete-sq.png)

### Getting metrics from SonarQube to Ortelius

The Ortelius CI/CD command line program is used to associate Sonar metrics to the Ortelius _Component Version_.  See [CLI Installation](https://docs.ortelius.io/guides/userguide/installation-and-support//0-commandlineinterface/) for instructions on basic setup in your CI/CD pipeline.

Restful API calls are needed in your pipeline to grab the metrics from Sonar.  Shell commands using curl and jq allow us to parse the data returned from Sonar and format it for storage with the _Component Version_.  The `component.toml` file used by the Ortelius CLI is appended to with each new metric and upload to Ortelius at the end of the pipeline.  See [CI-CD Integration](https://docs.ortelius.io/guides/userguide/installation-and-support/0-commandlineinterface/) for more details.


> Note: Your codebase must be scanned with SonarQube and the results uploaded to the Sonar Server.  Sonar RestAPI calls will be made to fetch the metrics from the stored scanned results.  Also, a loop to recheck maybe needed since there can be delay between the scan and publishing the results.  See _SonarQube Project Status_ below for an example that includes the loop.

#### SonarQube Project Status

| Variable       | Value                                                                                                                 |
|----------------|-----------------------------------------------------------------------------------------------------------------------|
| SORAR_URL      | URL for SonarQube Server.  For example: `https://sonar.example.com`                                                   |
| SONAR_ID       | Userid used to login to SonarQube                                                                                     |
| SONAR_PASS     | Password for the userid                                                                                               |
| PROJECTKEY     | Name of the project in SonarQube                                                                                      |
| COMPONENT_TOML | The Ortelius Component TOML file that defined the _Component Version_ to Ortelius.  Typically called `component.toml` |

```bash
Check=$(curl -s -u ${SONAR_ID}:${SONAR_PASS} "${SONAR_URL}/api/qualitygates/project_status?projectKey=$PROJECTKEY" | jq -r '.projectStatus.status')
max_retry=30
counter=0
until [ "$Check" == "OK" ] || [ "$Check" = "ERROR" ] || [ "$Check" ==  "WARN" ];
do
  sleep 20

  [[ counter -eq $max_retry ]] && echo "Failed! Check you sonnar-server" && exit 1
  echo "Retrying. Try #$counter"
  ((counter++))

  Check=$(curl -s -u ${SONAR_ID}:${SONAR_PASS} "${SONAR_URL}/api/qualitygates/project_status?projectKey=$PROJECTKEY" | jq -r '.projectStatus.status')
done

echo '    SonarProjectStatus = "$Check"' >> ${COMPONENT_TOML}
```

#### SonarQube Bugs

| Variable       | Value                                                                                                                                                                                                     |
|----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| SORAR_URL      | URL for SonarQube Server.  For example: `https://sonar.example.com`                                                                                                                                       |
| SONAR_ID       | Userid used to login to SonarQube                                                                                                                                                                         |
| SONAR_PASS     | Password for the userid                                                                                                                                                                                   |
| COMPONENT_NAME | Name of the component in SonarQube.  This name will typically be the same as the name of the component being built, but the Sonar Scan maybe uploaded to an alternate name.  Use the name from SonarQube. |
| COMPONENT_TOML | The Ortelius Component TOML file that defined the _Component Version_ to Ortelius.  Typically called `component.toml`                                                                                     |

```bash
SONAR_BUGS=$(curl -k -s -u ${SONAR_ID}:${SONAR_PASS} "${SONAR_URL}/api/measures/component?component=${COMPONENT_NAME}&metricKeys=complexity,bugs,new_technical_debt,code_smells,branch_coverage,violations" | jq -r '.component.measures | .[] |select(.metric == "bugs") | (.value)')

echo '    SonarBugs = "%{SONAR_BUGS}"'  >> ${COMPONENT_TOML}
```

#### SonarQube Code Smells

| Variable       | Value                                                                                                                                                                                                     |
|----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| SORAR_URL      | URL for SonarQube Server.  For example: `https://sonar.example.com` com>                                                                                                                                  |
| SONAR_ID       | Userid used to login to SonarQube                                                                                                                                                                         |
| SONAR_PASS     | Password for the userid                                                                                                                                                                                   |
| COMPONENT_NAME | Name of the component in SonarQube.  This name will typically be the same as the name of the component being built, but the Sonar Scan maybe uploaded to an alternate name.  Use the name from SonarQube. |
| COMPONENT_TOML | The Ortelius Component TOML file that defined the _Component Version_ to Ortelius.  Typically called `component.toml`                                                                                     |

```bash
SONAR_CODESMELLS=$(curl -k -s -u ${SONAR_ID}:${SONAR_PASS} "${SONAR_URL}/api/measures/component?component=${COMPONENT_NAME}&metricKeys=complexity,bugs,new_technical_debt,code_smells,branch_coverage,violations" | jq -r '.component.measures | .[] |select(.metric == "code_smells") | (.value)')

echo '    SonarCodeSmells = "%{SONAR_CODESMELLS}"'  >> ${COMPONENT_TOML}
```

#### SonarQube Violations

| Variable       | Value                                                                                                                                                                                                     |
|----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| SORAR_URL      | URL for SonarQube Server.  For example: `https://sonar.example.com` com"                                                                                                                                  |
| SONAR_ID       | Userid used to login to SonarQube                                                                                                                                                                         |
| SONAR_PASS     | Password for the userid                                                                                                                                                                                   |
| COMPONENT_NAME | Name of the component in SonarQube.  This name will typically be the same as the name of the component being built, but the Sonar Scan maybe uploaded to an alternate name.  Use the name from SonarQube. |
| COMPONENT_TOML | The Ortelius Component TOML file that defined the _Component Version_ to Ortelius.  Typically called `component.toml`                                                                                     |

```bash
SONAR_VIOLATIONS=$(curl -k -s -u ${SONAR_ID}:${SONAR_PASS} "${SONAR_URL}/api/measures/component?component=${COMPONENT_NAME}&metricKeys=complexity,bugs,new_technical_debt,code_smells,branch_coverage,violations" | jq -r '.component.measures | .[] |select(.metric == "violations") | (.value)')

echo '    SonarViolations = "%{SONAR_VIOLATIONS}"'  >> ${COMPONENT_TOML}
```
