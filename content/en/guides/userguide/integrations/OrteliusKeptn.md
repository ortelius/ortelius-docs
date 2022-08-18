
# Ortelius Keptn Event Diagram

```mermaid
%%{init: { 'sequence': {'showSequenceNumbers': true } } }%%

sequenceDiagram
Microservice Git Repo->>Keptn: Git Commit via GitHub Action
Keptn->>Docker Build/Tag: Start Docker Build
Docker Build/Tag->>Keptn: Running Docker Build
Docker Build/Tag->>Keptn: Finished Docker Build
Keptn->>Docker Push: Start Docker Push
Docker Push->>Keptn: Running Docker Push
Docker Push->>Keptn: Finished Docker Push
Keptn->>Ortelius: Start Component/App Version
Ortelius->>Keptn: Running Component/App Version
Ortelius->>Keptn: Finished Component/App Version
Keptn->>Ortelius: Start Deploy App Version
Ortelius->>Keptn: Running Deploy App Version
Ortelius->>Application Git Repo: Update Helm Charts
Ortelius->>Keptn: Finished Deploy App Version
Application Git Repo->>ArgoCD: Start Deployment
ArgoCD->>Keptn: Running Deployment
ArgoCD->>Keptn: Finished Deployment
Keptn->>Ortelius: ArgoCD Deployment Finished
Ortelius->>Keptn: Finished Deployment Logging
Keptn->>Quality Gates: Start Quality Gate Check
Quality Gates->>Keptn: Running Quality Gate Check
Quality Gates->>Keptn: Finished Quality Gate Check
```

1) GitHub Keptn #1 - Utkarsh, Sacha
2) Docker Keptn #2 thru #7 - Steve
3) Ortelius Keptn #8 thru #14 - Steve, Joseph
4) ArgoCD Ketpn #15 thru #19 - Brad, Meha
5) Keptn Quality Gates #20 thru #22 - Brad, Arvind

Reviewer - Tony

Tuesday 8/23 - Discord Check In Status

1. Overall process summary
2. How does the event work?
3. What does the event contain?
4. Security concerns
