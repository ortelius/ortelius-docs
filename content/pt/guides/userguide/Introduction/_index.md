---
title: "Bem Vindo"
linkTitle: "Bem Vindo"
weight: 1
description: >  
  Introdução ao Catálogo da Cadeia de Produção Ortelius 
---
## Por que usar Ortelius

Ortelius é um código aberto, trata-se de um catálogo de evidências da cadeia de suprimentos, o qual destina-se a publicação, o versionamento e o compartilhamento de microserviços e outros _Components_, tais como objetos de banco de dados e arquivos de objetos. Ortelius centraliza tudo o que você precisa saber sobre uma arquitetura orientada a componentes, incluindo propriedade em nível de componente _Component level_, SBOMs, vulnerabilidades, relacionamentos de dependências, valores-chave, metadados de implantação, aplicativos consumidores e versões. Ortelius coleta as informações do fluxo de produção DevOps centralizando os dados da cadeia de suprimentos entre as ferramentas e as equipes.

![Supply Chain Catalog](/supplychaincatalog.png)


Ortelius visualizes ‘logical’ application versions in a cloud-native architecture providing a clear view of the software supply chain and their consumers. With this _Component_ level information, Ortelius can easily aggregate metadata up to the 'logical' application producing application level SBOMs, CVEs, audit reports, deployment inventory and status. 

Ortelius is particularly suited for a microservice architecture where hundreds of artifacts and repos are used, and a central view of the entire supply chain from a usage, security, and inventory perspective is required. When you outgrow your excel spreadsheet, its time to consider Ortelius.  

**Decoupled Environments are Complex**

Migrating to decoupled, cloud-native architecture breaks the way we assemble and configure software. With a decoupled implementation, we no longer build a complete software solution, or Application Version. Instead we manage many moving parts that communicate at run-time based on APIs.  The loss of the 'Application Version' disrupts the core of software delivery.  It impacts most of our standard software practices including the generation of application security level reports.  After all, everything is based on an Application Version from tracking changes request, determining differences, tracking relationships and supporting users. Without a method of tracking the logical _Application_, IT teams struggle to confirm that the software they deliver to end users is safe. 

Ortelius is not a 'microservice registry' or 'API Gateway."  Instead, Ortelius interacts with the DevOps pipeline to automatically gather supply chain metadata. Tracking microservices and _Components_ in this way facilitates their sharing and reuse across teams. Ortelius serves as an internal market place for finding, tracking and versioning microservices and relating them to the _Applications_ that consume them. The publishing catalog is based on a _Domain_ structure to support a Domain Driven Design.

## Versioning - Ortelius Secret Sauce

Ortelius versions both _Components_ and 'logical' _Applications_.  When versioning _Components_, Ortelius provides insights needed to determine if the service is safe for consumption including:

- Software Bill of Material
- Common Vulnerabilities and Exposures (CVE)
- Swagger Details
- Readme and Licensing
- Consuming Applications
- Ownership
- Git repo
- Git Commit (Tag and branch)
- CI/CD Build Number
- Container SHA
- Docker Registry
- Key Values
- Deployment Script (Helm Chart, Ansible Playbook, etc.)
- Any Attributes (DB Name for example)

 _Application Versions_ are based on a collection of _Component Versions_. If a new version of a _Component_ is built or registered, Ortelius auto increments the _Component_ version and the consuming _Application_ version.  Dashboards are provided for each new _Application_ version showing:

- A full map of all the microservices, or _Components_, the _Application_ version is consuming.
- An Application Level SBOM, based on all _Component_ SBOMs
- An Application Level CVE
- The specific changes that created the new _Application_ version (your new diff report)
- The audit history
- Log history
- Where it is running
- Trends (Deployment time, success failure rates)

This level of information can also be viewed from the _Component_ level showing similar information to the _Application_, but instead showing the _Applications_ that are dependent on the microservice (_Component_).

## Other Core Features
**Domain-Driven-Design:** First and most important is the Ortelius Domain structure for cataloging and sharing microservices. This feature organizes your microservice in a method that encourages reuse and sharing across development teams.

**Dependency maps:** Shows you the 'logical' view of your application and which microservices, or _Components_, it consumes. Once you begin sharing microservices, you need to track who is using the microservice. An _Application_ is a logical collection of _Components_ that make up an entire software solution.

**Application Level SBOMs and CVE:** Ortelius aggregates all _Component_ level data up to the logical _Application Version_ making it easy to provide security reporting on a complete software system, even when it is decoupled. 

**Blast Radius:** Know your service impact before you ever deploy. Ortelius can provide predictive insights showing what _Applications_ will be impacted by an updated service. Ortelius provides this data in clear maps of dependent _Applications_ and services.

 **Improved incident response:** Ortelius makes it easy to find the owner of microservice or common _Component_, and contact them through PagerDuty, HipChat, Discord, Slack, email or phone.

**Integrates into your CD pipeline:** Ortelius is automated via your CD Pipeline to continuously version your decoupled architecture with changes, including where they are deployed. 

