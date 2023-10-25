---
title: "Bem Vindo"
linkTitle: "Bem Vindo"
weight: 1
description: >  
  Introdução ao Catálogo da Cadeia de Produção Ortelius 
---
## Por que usar Ortelius

Ortelius é um código aberto, trata-se de um catálogo de evidências da cadeia de suprimentos, o qual destina-se a publicação, o versionamento e o compartilhamento de microserviços e outros _Components_, tais como objetos de banco de dados e arquivos de objetos. Ortelius centraliza tudo o que você precisa saber sobre uma arquitetura orientada a componentes, incluindo propriedade em nível de componente _Component level_, SBOMs, vulnerabilidades, relacionamentos de dependências, valores-chave, metadados de implantação, aplicativos consumidores e versões. Ortelius coleta as informações do fluxo de produção DevOps centralizando os dados da cadeia de suprimentos entre as ferramentas e as equipes.

![Catálogo da Cadeia de Produção](/supplychaincatalog.png)

Ortelius permite visualizar as versões lógicas da aplicação em uma arquitetura nativa de nuvem, fornecendo uma clara visão da cadeia de suprimentos de software e de seus consumidores. Com esta informação a nível de _Component_, Ortelius pode facilmente agregar desde os metadados até a lógica da aplicação produzindo SBOMs, CVEs no nível de aplicação, bem como relatórios de auditoria, inventário e status da implantação.

Ortelius é particularmente adequado para uma arquitetura de microsserviços, onde centenas de artefatos e repositórios são usados necessitando de uma visão central de toda a cadeia de suprimentos, do ponto de vista de uso, segurança e inventário. Quando sua planilha do Excel já não é suficiente, é hora de considerar o Ortelius.

**Ambientes desacoplados são complexos**

Migrating to decoupled, cloud-native architecture breaks the way we assemble and configure software. With a decoupled implementation, we no longer build a complete software solution, or Application Version. Instead we manage many moving parts that communicate at run-time based on APIs.  The loss of the 'Application Version' disrupts the core of software delivery.  It impacts most of our standard software practices including the generation of application security level reports.  After all, everything is based on an Application Version from tracking changes request, determining differences, tracking relationships and supporting users. Without a method of tracking the logical _Application_, IT teams struggle to confirm that the software they deliver to end users is safe. 

A migração para uma arquitetura desacoplada e nativa da nuvem descontrói a forma tradicional como desenvolvemos e configuramos o software. Com uma implementação desacoplada, não construímos mais uma solução completa de software, ou uma versão da aplicação. Em vez disso, passamos a trabalhar com muitas partes móveis, as quais se comunicam em tempo de execução com base nas APIs. A perda da versão da aplicação rompe com o núcleo de entrega do software. Isso impacta a maioria de nossas práticas padrão de software, incluindo a geração de relatórios em nível de segurança da aplicação. Afinal, tudo baseia-se em uma versão da aplicação desde o rastreamento das solicitações de mudanças, determinação de diferenças, rastreamento de relacionamentos e atendimento aos usuários. Na falta de um meio para rastrear a lógica da _Application_, as equipes de TI lutam para confirmar que o software que entregam a seus usuários finais é seguro.

Ortelius não é um 'registro de microsserviços' ou uma 'Gateway de API'. Em vez disso, Ortelius interage com o fluxo de produção DevOps a fim de coletar automaticamente metadados da cadeia de suprimentos. O rastreamento dos microsserviços e dos _Components_ facilita o compartilhamento e a reutilização destes entre as equipes. Desta forma, Ortelius atua como um mercado interno para viabilizar a busca, o rastreio e o versionamento de microsserviços, relacionando-os com as _Applications_ que os utilizam. O catálogo de publicação é baseado em uma estrutura de _Domain_ para suportar um design orientado a domínio.

## Versionamento - Ortelius Secret Sauce

O Ortelius permite o versionamento tanto de _Components_ quanto de _Applications_ lógicas. Ao versionar os componentes, o Ortelius fornece informações necessárias para determinar se o serviço é seguro para consumo, as quais incluem:

- Software Bill of Material
- Vulnerabilidades e Exposições Comuns (CVE)
- Detalhes do Swagger
- Leia-me e Licenciamento
- Aplicações Consumidoras
- Propriedade
- Repositório Git
- Commit Git (tag e branch)
- Número de build CI/CD
- Container SHA
- Registro do Docker
- Valores de chave
- Script de Implantação (Helm Chart, Ansible Playbook, etc.)
- Atributos (por exemplo, nome do banco de dados)

As _Application Versions_ são baseadas em uma coleção de versões dos componentes. Quando uma nova versão de um componente é criada ou registrada, o Ortelius incrementa automaticamente a versão do componente e faz o mesmo com a versão da aplicação que o consume. Painéis são fornecidos para cada nova versão de aplicação, mostrando:

- Um mapa completo de todos os microsserviços ou componentes que a versão da aplicação está consumindo.
- Um SBOM em nível de aplicação, baseado em todos os SBOMs de componentes
- Um CVE em nível de aplicação
- As alterações específicas que culminaram em uma nova versão da _Application_ (seu novo relatório de diferenças)
- O histórico de auditoria
- Histórico de logs
- Onde está executando
- Tendências (tempo de implantação, taxas de sucesso e falha)

Esse nível de informação também pode ser visto em nível de _Component_, mostrando informações semelhantes à aplicação, mas em vez disso, mostrando quais as _Applications_ que são dependentes do microsserviço (_Component_).

## Outras Características Essenciais
**Domain-Driven-Design:** A primeira e mais importante é a estrutura de domínio do Ortelius com o objetivo de catalogar e compartilhar microsserviços. Essa funcionalidade organiza seus microsserviços de tal forma que o reuso e o compartilhamento deles seja incentivado entre as equipes de desenvolvimento.

**Mapas de Dependência:** Mostra a visão "lógica" da sua aplicação e quais microsserviços, ou _Components_, ela consome. Uma vez que você inicie o compartilhamento dos microsserviços, far-se-á necessário rastrear quem está usando o microsserviço. Uma _Application_ é uma coleção lógica de _Components_ que constituem uma solução de software completa.

**SBOMs e CVEs em Nível de Aplicação:** O Ortelius agrega todos os dados a nível de _Component_ até a versão lógica da aplicação (_Application Version_), facilitando a produção dos relatórios de segurança a respeito de todo o sistema de software, até mesmo quando ele é desacoplado.

**Raio de Destruição:** Conheça o impacto provocado pelos seus serviços antes mesmo de implantá-los. O Ortelius é capaz de fornecer insights preditivos mostrando quais _Applications_ serão impactadas por um serviço que sofreu alterações. O Ortelius fornece estes dados de forma clara usando os mapas de dependência de _Applications_ e dos serviços.

**Resposta aprimorada a incidentes:** O Ortelius facilita a descoberta do proprietário de um microsserviço, ou seja, o _Component_ comum e contatá-los através do PagerDuty, HipChat, Discord, Slack, e-mail ou ainda via telefone.

**Integração com o Fluxo de Entrega Contínua (CD):** O Ortelius pode ser automatizado por meio do seu pipeline, o fluxo CD, para versionar continuamente sua arquitetura desacoplada com mudanças, incluindo onde elas são implantadas.
