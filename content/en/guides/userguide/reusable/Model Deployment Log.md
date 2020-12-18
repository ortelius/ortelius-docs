**Deployment Log**

| Name | Type | Description | Required |
| ---- | ---- | ----------- | -------- |
| application | string | The name of the _Application_ that was deployed. | No |
| complete | boolean | A Boolean indicating if the deployment is complete (true) or still in progress (false). | No |
| environment | string | The _Environment_ to which the _Application_ was deployed. | No |
| exitcode | integer | The exit code of the deployment. | No |
| exitstatus | string | The error text if the deployment failed. | No |
| started | integer | The start date/time of the deployment (in Epoch time). | No |
| finished | integer | The end date/time of the deployment (in Epoch time). | No |
| id | integer | The deployment ID. | No |
| loglinecount | integer | The number of lines in the "logoutput" array. | No |
| logoutput | [ string ] |  The log output.| No |
