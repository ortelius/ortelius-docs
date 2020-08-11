---
title: "SaaS Sign-up and Reverse Proxy"
linkTitle: "SaaS Sign-up and Reverse Proxy"
weight: 1
description: >
  How to Sign up
---
## SaaS Sign-up Process and the Reverse Proxy

When you [signed up to use Ortelius SaaS](https://www.deployhub.com/register-for-team/), you were asked for basic information. Your UserID/Password, Company and Project names. Your UserID/Password and Company name are unique.  Your Project will be a _Subdomain_ under your Company _Domain_.

**Note:**  If another user signs up with the same Company name, they will be informed that they must contact the Administrator for access to the Ortelius account. The Administrator is the first person who signed up to Ortelius with that Company name.

 Ortelius is accessible through the following url:

[https://console.deployhub.com/dmadminweb/Home](https://console.deployhub.com/dmadminweb/Home)

Login using the UserID and Password you used when you signed up for Ortelius.

## Take a Test Drive of the Online Store Company -  Hipster Store Tutorial

The Hipster Store Tutorial is provided to give you a review of _Domains_, _Components_, and _Applications_ and will help you understand Ortelius basic concepts. See [Hipster Store Tutorial](/userguide/introduction/0-hipster-store-tutorial/) for more information.

## Installing the Reverse Proxy for Managing Deployments

To start deploying your _Applications_ and _Components_, you will first need to install a Reverse Proxy inside your firewall. This contacts Ortelius in our SaaS environment to receive deployment requests.  The Reverse Proxy is required for deploying into your environment.

~~~bash
Note: You do not need to install a Reverse Proxy in order to deploy the Hipster Store Application in the Hipster Store Tutorial. This deployment is done in the Ortelius Google Cloud environment.
~~~

A Reverse Proxy queries the Ortelius SaaS every minute to determine if a deployment is needed. For SaaS users, it provides a security layer, preventing you from opening a port to the outside world. It uses standard HTTPS requests to communicate to the Ortelius SaaS on the Google GKE environment. Nothing from the external Google side of the firewall is pushed to the local Ortelius Reverse Proxy.

Once the Reverse Proxy determines that a deployment is needed, it executes the deployment using all files on the inside of the firewall. The one-way communication initiates the deployment but all work is done local to your network. On completion of the deployment, the logs are pushed back up to the Ortelius SaaS for viewing and audit.

![Ortelius Architecture](/userguide/images/ReverseProxy.png)

### Reverse Proxy Installation

The Reverse Proxy runs as docker container. In order to install it, you need to install Docker.

### Docker Installation Guides

- [Docker for CentOS](https://docs.docker.com/engine/install/centos/)
- [Docker for Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- [Docker for Fedora](https://docs.docker.com/engine/install/fedora/)
- [Docker for RedHat](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux_atomic_host/7/html-single/getting_started_with_containers/index)
- [Docker for OS/X](https://docs.docker.com/docker-for-mac/install/)

### Test your Docker Install

See the [Docker Install Test](https://docs.docker.com/get-started/#test-docker-version) instructions

## Installing Your Ortelius Reverse Proxy Docker Image

The Ortelius Reverse Proxy Docker Image is found on the Redhat Quay Docker Registry. Follow the steps below to install the Reverse Proxy into your Docker installation.

**Step 1 - Set your CLIENTID as environment variable**

Use your Client ID that you received in your "Welcome" sign up email from Ortelius. It will be a hexadecimal number such as:

~~~bash
Your CLIENTID is 6d961c2d-69a4-4660-8a4a-aaea11276864
~~~

Run:

~~~bash
export CLIENTID="Your ID"
~~~

For example:

~~~bash
export CLIENTID=6d961c2d-69a4-4660-8a4a-aaea11276864
~~~

**Step 2 - Pull Reverse Proxy from Redhat Quay Registry**

Run:

~~~bash
docker pull quay.io/Ortelius/Ortelius-rproxy:latest
~~~

**Step 3 - Find your image SHA**

Run:

~~~bash
docker images | grep Ortelius-rproxy | grep latest
~~~

Find the image SHA from the third column in the output.

~~~bash
quay.io/Ortelius/Ortelius-rproxy      v9.0.0          0114088b0b44        6 days ago          3.32GB
~~~

The SHA in the above example is 0114088b0b44.

**Step 4 - Start the container for Linux and OS/X**

Use the image SHA from Step 3 as the last parameter to the docker run.

```bash
docker run -d --hostname `hostname` -e CLIENTID=$CLIENTID -v ~/.ssh:/keys:Z 0114088b0b44
```

**Step 5 - Access Ortelius from your browser**

 Ortelius is accessible through the following url:

~~~bash
https://console.deployhub.com/dmadminweb/Home
~~~

Login using the UserID and Password you used when you Signed-up for Ortelius

**Step 6 - Confirm Your Reverse Proxy is Running**

In the upper right hand corner you will see a message that should say "2 out of 2 Reverse Proxy Running."  There is a default proxy used to deploy into the Ortelius environment for the Hipster Store Tutorial.
