---
title: "Installing Ortelius"
linkTitle: "Installing Ortelius"
weight: 3
description: >
  Installing Ortelius On-premise
---

## On Premise Installation Using the Ortelius Helm Chart

Ortelius can be installed into your own cloud environment, or onto a hosted cloud environment.  Ortelius uses Helm to manage and perform the installation. The process includes the installation of multiple containers. 

### Step 1 - Download and Run Helm
The Ortelius on-premise Helm chart and instructions can be found at [ArtifactHub](https://artifacthub.io/packages/helm/ortelius/ortelius). This is the location for the most up to date instructions for downloading and running the Ortelius Helm chart.    (https://artifacthub.io/packages/helm/ortelius/ortelius)

### Step 2 - Access Ortelius from your browser

Run the following command to find your IP address for the Ortelius URL.

```
kubectl get svc -n ortelius ms.nginx 
```
This will display the external IP address you need to run the URL.

### Step 3 - Access the Ortelius URL and Login
Access the URL from the following address:
```
http://<External IP Address from above step>/dmadminweb/Home
```
To log in please use userId: admin and password: admin. 

**Note:**
You can create your own Administrator UserID and remove the default userid and password.

## Next Steps

Once you have completed your installation, you can take the next step and complete a [Proof of Concept](/guides/userguide/Itegrations/CI-CD_Integrations).




