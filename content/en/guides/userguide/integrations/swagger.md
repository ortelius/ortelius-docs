---
title: "Swagger/OpenAPI Integration"
linkTitle: "Swagger/OpenAPI Integration"
weight: 330
description: >
  Tracking Swagger/OpenAPI for Your Component
---


![swagger](/guides/userguide/images/Swagger-logo.png)


## Swagger

Ortelius uses [Swagger](https://swagger.io/) to display your microservice / API documentation, based on your _Component Version_. Developers create, or automate the creation of Swagger/OpenAPI documentation. Once created the Swagger/OpenAPI documentation can be associated to the _Component Version_.

### Uploading Swagger/OpenAPI Documentation

You can use the Ortelius _Component_ Detail view to manually upload your Swagger/OpenAPI documentation for your _Component_. Alternatively, the recommended approach is to use the CI/CD Command Line Interface to automatically add your Swagger/OpenAPI documentation file. Refer to the [CI/CD CLI details](https://github.com/Ortelius/cli/blob/main/doc/dh.md) for incorporating Swagger/OpenAPI into your pipeline process.

> Note: Swagger or OpenAPI formats can be used.

### Viewing Component CVE Data

Swagger/OpenAPI data is associated to a particular _Component Version_ and can be seen by going to the Component Detail View.