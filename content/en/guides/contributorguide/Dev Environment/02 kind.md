---
title: "Kind"
linkTitle: "Kind"
weight: 5
description: >
  Kind configuration and setup.
---

### [Kind.sigs.k8s.io](https://kind.sigs.k8s.io/)
- Kind allows you to use Docker to run K8s nodes as containers
- Install [here](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)
- Get familiar with the basic commands
- Checkout the Kind documentation [here](https://kind.sigs.k8s.io/docs/user/quick-start/)

![kind docker!](images/kind/kind-docker.jpg)

## Why kind?
- kind supports multi-node (including HA) clusters
- kind supports building Kubernetes release builds from source
- support for make / bash or docker, in addition to pre-published builds
- kind supports Linux, macOS and Windows
- kind is a `CNCF certified conformant Kubernetes installer`

### [Kubernetes.io](https://kubernetes.io/)
- K8s is a production grade container orchestrater
- K8s is the conductor of the orchestra where the conductor is K8s and the orchestra is the containers within PODs
- PODS are cuddly safe worlds to hold containers (so cute)
- Get familiar with the basic commands

## Requirements
- Docker installed & running
- Kubectl command line tool

## Up & Running
### Clusters
- Create a cluster `kind create cluster`
- Delete a cluster `kind delete cluster`

## Kubectl
- Install `kubectl` the command line tool [here](https://kubernetes.io/docs/tasks/tools/)
- Use the `kubectl` cheat sheet [here](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- Use [Devdocs](https://devdocs.io/) and the official documentation [here](https://kubernetes.io/docs/home/)
- Add the `aliases` & `auto complete` which are in the `cheat sheet`
- [Interacting with your cluster](https://kind.sigs.k8s.io/docs/user/quick-start/#interacting-with-your-cluster)
- Switch context and namespaces easily with these [tools](https://github.com/ahmetb/kubectx)

`kind-ortelius-config.yaml`
```
kind: Cluster
apiVersion: kind.sigs.k8s.io/v1alpha3
nodes:
- role: control-plane
  extraPortMappings:
  - containerPort: 32000
    hostPort: 8080
```