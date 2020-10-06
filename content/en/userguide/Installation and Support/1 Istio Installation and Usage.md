---
title: "Istio Installation and Usage"
linkTitle: "Istio Installation and Usage"
weight: 4
description: >
  Getting Istio installed in the cluster along with essential add-ons
---

## What is Istio?

[Istio](https://istio.io) is an industry-leading service mesh framework that allows for greater visibility into the workloads in your cluster.  It provides visibility into workloads and services within the cluster, as well as telemetry and tracing.  One of the biggest benefits to using a service mesh is the ability to leverage mutual TLS (mTLS), which encrypts communications between microservices within a specific namespace or rule set.

## Installing Istio

To start, please ensure you have pulled down the relevant `kubeconfig` file for the cluster.  Some examples of how to do this using major cloud providers can be seen below.

**[AKS](https://docs.microsoft.com/en-us/cli/azure/aks?view=azure-cli-latest#az_aks_get_credentials)**

```shell
az login
az account set -s <SUBSCRIPTION>
az aks get-credentials -n <CLUSTERNAME> -g <CLUSTER_RESOURCEGROUP>
```

**[EKS](https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html)**

``` shell
aws eks --region <region-code> update-kubeconfig --name <cluster_name>
```

**[GKE](https://cloud.google.com/sdk/gcloud/reference/container/clusters/get-credentials)**

``` shell
gcloud container clusters get-credentials NAME [--internal-ip] [--region=REGION     | --zone=ZONE, -z ZONE] [GCLOUD_WIDE_FLAG …]
```

### Base Install

There are several ways to install Istio into a Kubernetes cluster.  We will focus on the `istioctl` command line interface, which will install the operator as well as all of the core infrastructure for the service mesh.  Instructions for installing and using the `istioctl` command line utility can be found [here](https://istio.io/latest/docs/ops/diagnostic-tools/istioctl/).  Once installed, use the command line interface to install Istio into your cluster using the kubeconfig you downloaded in the previous step.  If you saved the kubeconfig to a specific file instead of merging it into the global kube.config file, you can use `--kubeconfig` to specify the path to that file.  Otherwise, you can issue the command directly assuming the current kubeconfg context is set to the cluster you wish to install Istio into.  For the most permissive settings, you can use the option `--set profile=demo` to use the demo profile for service communication.

```
istioctl install --set profile=demo
```


### Installation of Add-Ons / Integrations

As of version 1.7.x, the installation for Istio via `istioctl` does not come with the ability to install add-ons such as Kiali, Prometheus, Grafana, and Jaeger.  For this example, we will be installing the aforementioned add-ons using the guidance found on the Istio [integrations page](https://istio.io/latest/docs/ops/integrations/).  Following is a snippet that contains the installation commands for each add-on.  This will use the default settings for each add-on, which in most cases will serve all of your needs.

``` shell
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.7/samples/addons/kiali.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.7/samples/addons/prometheus.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.7/samples/addons/grafana.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.7/samples/addons/jaeger.yaml
```

To open a port-forwarded instance of these add-ons, use `istioctl dashboard` to instantiate a new browser tab.  For example, if you wished to open a new tab and load the Kiali interface, you would type 

``` shell
istioctl dashboard kiali
``` 

in the shell of your choice.

### Using the Istio ingress

Gateways and Virtual Services are placed in the namespace that relates to the application being run.  The decision to put them in the namespace versus having them all in the `istio-system` namespace is one that you are welcome to make.  For the purposes of this use case, however, we will be containing [Gateways](https://istio.io/latest/docs/reference/config/networking/gateway/) and [Virtual Services](https://istio.io/latest/docs/reference/config/networking/virtual-service/) within the relevant namespace for the application.
The `Gateway` is an object that listens for TCP/UDP requests coming in with a specific host header, and routes those requests to related `VirtualService` objects to serve up a target application.  You may also use a `PeerAuthentication` object to restrict the communications between services within a namespace and require them to all use mTLS.  Using these objects in conjunction with the Istio `ingressgateway`, you will be able to route HTTP, HTTPS, and other Layer 4 requests to services within your cluster.  Using these objects enables mTLS to flow from the ingress to the individual services being exposed as well as between services within the same namespace.

<img src="http://yuml.me/diagram/plain/activity/(start)-HTTPS>[Request]-[TLS]>(Istio ingressgateway)-[mTLS]>(Gateway)-[mTLS]>(VirtualService)-[mTLS]>(Exposed Service)-[pods]>(end)" >

To use the `ingressgateway` to route traffic to an exposed Ortelius service within the `ortelius` namespace, a Gateway and VirtualService would be created to allow that traffic to hit that service. This example assumes that HTTPS would be used and a certificate would be loaded allowing for secure traffic to access the site.  The secret could be stored in the `istio-system` namespace or the `ortelius` namespace, and the secret name is listed as `ortelius-istio`.

```yaml
---
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: ortelius-gateway
  namespace: ortelius
spec:
  selector:
    istio: ingressgateway
  servers:
  - port:
      number: 443
      name: https
      protocol: HTTPS
    tls:
      mode: SIMPLE
      credentialName: ortelius-istio
    hosts:
    - "ortelius.example.net"
  - hosts:
        - ortelius.example.net
    port:
      name: http
      number: 80
      protocol: HTTP
    tls:
      httpsRedirect: true
---
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: ortelius
  namespace: ortelius
spec:
  hosts:
  - "ortelius.example.net"
  gateways:
  - ortelius-gateway
  http:
  - match:
    - uri:
        prefix: /
    - uri:
        prefix: /dmadminweb
    route:
    - destination:
        port:
          number: 7171
        host: ortelius-web
```

There are more complex configurations that allow you to redirect HTTP traffic to HTTPS as well as perform additional mappings based on the URI prefix.  In this case, a simple example is shown to provide context on how to set up the Istio networking components.

### Using `cert-manager`

[TBD]
Certificate manegement can be a bit complicated.  With the use of utilities such as `cert-manager`, you can use a central cluster resource to manage and issue SSL certificates for ingress points using [Let's Encrypt](https://letsencrypt.org/).  If you have requirements that specify an alternative method for procuring, storing, and using SSL certificates using a dedicated certificate authority (CA), please use that method for including SSL certificates in your cluster.  If using `cert-manager` is acceptable for your cluster, you can reference the instructions on the [Istio website](https://istio.io/latest/docs/ops/integrations/certmanager/) for provisioning `cert-manager` in your cluster.
