---
title: "Eclipse IDE Setup"
linkTitle: "Eclipse IDE Setup"
weight: 20
description: >
  Setting up the Eclipse IDE for Front-end Development
---

## Getting Started

Ortelius' front-end runs as a Tomcat application with servlets and jsp pages serving up the UI.  The client side is written in JS with JQuery.  In order to make changes to the front-end you need to run Ortelius under Tomcat in Eclipse.  Java 8 is used as the Java runtime environment.  

Postgres 9.x is used to persist the data.  Postgres will need to be pre-installed prior to setting up Eclipse Workspace.  The Postgres connection string will be set on Environment Tab for your Run and Debug Configuration for Tomcat.  Ortelius will create the necessary schema and tables if they do not exist in the database.  The default Ortelius userid and password are admin and admin.  

![Eclipse Version](/static/eclipse-version.png)

### Tomcat Server

Tomcat 7 is used to run Ortelius.  You will need to download and configure a Tomcat 7 server for your Eclipse install.  

![Eclipse Tomcat Server](/static/tomcat7.png)

### Running and Debugging Ortelius

Setup a run and debug configuration for Tomcat.  

![Server Tab](/static/server-tab.png)

![Arguments Tab](/static/args-tab.png)

![Classpath Tab](/static/classpath-tab.png)

![Source Tab](/static/src-tab.png)

![Environment Tab](/static/env-tab.png)

![Common Tab](/static/common-tab.png)

### Accessing the Ortelius UI in the browser

The server.xml contains the port for Tomcat.  The default is 8181.  To access Ortelius hit http://localhost:8181/dmadminweb/Home
