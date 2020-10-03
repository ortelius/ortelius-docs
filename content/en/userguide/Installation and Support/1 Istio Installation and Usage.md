---
title: "Istio Installation and Usage"
linkTitle: "Istio Installation and Usage"
weight: 4
description: >
  Getting Istio installed in the cluster along with essential add-ons
---

## What is Istio?
[Istio](https://istio.io) is an industry-leading service mesh framework that allows for greater visibility into the workloads in your cluster.

## Installing Istio
To start, please ensure you have pulled down the relevant `kubeconfig` file for the cluster.  Some examples of how to do this using major cloud providers can be seen below.

**AKS**
```bash
az login
az account set -s <SUBSCRIPTION>
az aks get-credentials -n <CLUSTERNAME> -g <CLUSTER_RESOURCEGROUP>
```
**EKS**
```bash
```
**GKE**
```bash
```

### Base Install
There are several ways to install Istio into a Kubernetes cluster.  We will focus on the `istioctl` command line interface, which will install the operator as well as all of the core infrastructure for the service mesh.

### Installation of Add-Ons / Integrations
As of version 1.7.x, the installation for Istio does not come with the ability to install add-ons such as Kiali, Prometheus, Grafana, and Jaeger.  For this install we will be installing the aforementioned add-ons using the guidance found on the Istio [integrations page](https://istio.io/latest/docs/ops/integrations/).

### Using the Istio ingress
Gateways, Virtual Services are placed in the namespace that relates to the application being run.
