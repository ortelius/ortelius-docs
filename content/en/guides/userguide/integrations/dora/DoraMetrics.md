---
title: "DORA Metrics Reports"
linkTitle: "DORA Metrics Reports"
weight: 30
description: >
  Aggregated DORA Metrics for Coupled and Decoupled Architectures
---

## DevOps Research and Assessment (DORA)

When Ortelius is integrated into your CI/CD pipeline, it can capture metrics for DORA reporting. The two DORA metrics that Ortelius captures are Deployment Frequency and Lead Time for Changes.

### Deployment Frequency

The DORA Deployment Frequency is how **often** an organization **successfully** releases to **production**.

Ortelius takes the deployment frequency to the next level, it tracks all deployments from Development, to QA and to Production.
This additional tracking provides insights into movement of changes throughout the whole pipeline and not just Production.

### Lead Time for Changes

The DOARA Lead Time for Changes is the amount of **time** it takes a **commit** to get into **production**.

Ortelius expands upon the Lead Time for Changes and calculates the time lag for each stage of the pipeline.  
This view gives a complete picture of the pace of changes from when the development makes a coding change to
when that change has been deployed to a pipeline stage.
