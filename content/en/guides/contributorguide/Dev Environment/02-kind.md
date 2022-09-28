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
- Get familar with the basic commands

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

[`kind example config`](https://raw.githubusercontent.com/kubernetes-sigs/kind/main/site/content/docs/user/kind-example-config.yaml)
```
# this config file contains all config fields with comments
# NOTE: this is not a particularly useful config file
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
# patch the generated kubeadm config with some extra settings
kubeadmConfigPatches:
- |
  apiVersion: kubelet.config.k8s.io/v1beta1
  kind: KubeletConfiguration
  evictionHard:
    nodefs.available: "0%"
# patch it further using a JSON 6902 patch
kubeadmConfigPatchesJSON6902:
- group: kubeadm.k8s.io
  version: v1beta2
  kind: ClusterConfiguration
  patch: |
    - op: add
      path: /apiServer/certSANs/-
      value: my-hostname
# 1 control plane node and 3 workers
nodes:
# the control plane node config
- role: control-plane
# the three workers
- role: worker
- role: worker
- role: worker
```