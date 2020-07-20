---
title: "Ortelius and Continuous Delivery"
linkTitle: "Ortelius and Continuous Delivery"
weight: 42
description: >
  Using Ortelius with your Continuous Delivery solution. 
---
## Introduction to Life Cycle _Subdomains_

Ortelius uses a built-in deployment pipeline for tracking an _Application's_ journey across a software delivery Life Cycle, i.e. Dev, Test, Production. However, it is important to understand that a Ortelius Life Cycle _Subdomain_ is not intended to replace your continuous delivery (CD) orchestration solution. In fact, there is integration that allows Ortelius to be called by your CD pipeline so it becomes part of your overall ecosystem for performing continuous configuration management and continuous deployment.  

Ortelius tracks an _Application's_ configuration including where it is in the Life Cycle in terms of _Environments_.  An _Environment_ is assigned to a Life Cycle _Subdomain_. Therefore, we can track where a _Component_ or _Application_ is in the Life Cycle based on where it has been installed. Each Life Cycle _Subdomain_ can contain multiple _Environments_. Regardless of what _Environment_ an _Application_ is running in, Ortelius can still track where it is in the Life Cycle process based on the Life Cycle _Subdomain_. This is the core function of Life Cycle _Subdomains_.

A Life Cycle _Subdomain_ is the lowest level _Domain_.  You can not create a _Subdomain_ off of a Life Cycle _Subdomain_.  

## Using a Life Cycle Subdomain

When you create a Life Cycle Subdomain, you provide a means to include Life Cycle state information as part of your _Application's_ configuration. For each state of your software delivery Life Cycle, you create an associated Life Cycle _Subdomain_ for your _Application_. You do this by using the _Domain_ Dashboard. Navigate to your _Application's_ _Domain_, select the  "All _Subdomains_ are Life Cycles" checkbox, and then add your child _Subdomains_.  All _Subdomains_ will represent your Life Cycle process. You will need to navigate to the _Environment_ Dashboard to add the _Environments_ to your Life Cycle _Subdomains_.

### Establishing the Progression Order of Your Life Cycle

You can force the progression of your Life Cycle process by adding a "Move" Task to the Life Cycle _Subdomain_.  At the "Move" Task level, you define what Life Cycle _Subdomain_ will be the next state (the "move to _Domain_). This is how Ortelius clearly defines the order of how an _Application_ should progress through the Life Cycle, i.e. first development, then test, and finally production. A "Move" Task does not perform a deployment, it just stages the _Application_ for a deployment into the _Environments_ associated with that Life Cycle _Subdomain_.

To deploy an _Application_ into an _Environment_ make sure that the Deploy Task is assigned to the _Domain_.  The Deploy Task is the default Task for all newly created _Domains_.  

### Your Life Cycle _Subdomains_ and your Continuous Delivery Engine

Your continuous delivery (CD) engine will define your Life Cycle progression.  When you integrate Ortelius into your existing CD Pipeline, you will need to define your Life Cycle _Subdomains_ to mimic your CD Workflow progression. You can then associate integration of each of your CD Workflows directly to a Ortelius Life Cycle _Subdomain_. You can perform calls to Ortelius to both "Move" and "Deploy" _Applications_ into _Environments_.  If you are a DeployHub Pro users, you can also call "Request" and "Approve" Tasks as part of your integration. These Tasks interact with DeployHub Pro "Smart" calendars, not available in Ortelius.
