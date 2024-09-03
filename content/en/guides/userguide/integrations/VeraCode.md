---
title: "Veracode Software Security Integration"
linkTitle: "Veracode Integration"
weight: 320
description: >
  Associating Veracode Security Scan to your _Component Version_.
---

## Veracode

Ortelius can associate Veracode Security Scan to your _Component Version_  Associating these metrics enable compliance scoring for _Application Versions_ since the metrics are rolled-up from the _Component Versions_ to the _Application Version_.  See an Application Compliance Scorecard Report below for details.

### Example Scorecard Report

![Scorecard with Veracode Metrics](/scorecard-complete-vc.png)

### Getting metrics from Veracode to Ortelius

The Ortelius CI/CD command line program is used to associate Veracode metrics to the Ortelius _Component Version_.  See [CLI Installation](https://docs.ortelius.io/guides/userguide/installation-and-support/0-commandlineinterface/) for instructions on basic setup in your CI/CD pipeline.

Restful API calls are needed in your pipeline to grab the metrics from Veracode.  Shell commands using HTTPie, xmltojson and jq allow us to parse the data returned from Veracode and format it for storage with the _Component Version_.  The `component.toml` file used by the Ortelius CLI is appended to with each new metric and upload to Ortelius at the end of the pipeline.  See [CI-CD Support](https://docs.ortelius.io/guides/guides/userguide/integrations/ci-cd_integrations/) for more details.

> Note: Your codebase must be scanned with Veracode and the results uploaded to the Veracode Server.  Veracode RestAPI calls will be made to fetch the metrics from the stored scanned results.  HTTPie (http command) is used in order to authenticate using the veracode_hmac auth-type.

#### VerCode Score

| Variable          | Value                                                                                                                   |
|-------------------|-------------------------------------------------------------------------------------------------------------------------|
| VERACODE_USERNAME | Username to login into `https://analysiscenter.veracode.com`                                                          |
| VERACODE_PASSWORD | Password for Veracode login                                                                                             |
| build_id          | build_id that the Veracode scan is published under                                                                      |
| COMPONENT_TOML    | The Ortelius Component TOML file that defined the _Component Version_ to Ortelius.  Typically called `component.toml` |

```bash
VERACODE_API_KEY_ID=${VERACODE_USERNAME}
VERACODE_API_KEY_SECRET=${VERACODE_PASSWORD}

http --auth-type=veracode_hmac "https://analysiscenter.veracode.com/api/5.0/detailedreport.do" "build_id==${build_id}" > detailedreport.xml
VERACODE_SCORE=$(xmltojson detailedreport.xml | jq -r '.detailedreport."static-analysis"."@score"')

echo "    VeracodeScore = \"${VERACODE_SCORE}\"" >> ${COMPONENT_TOML}
```
