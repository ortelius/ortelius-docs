---
title: "Hipster Store Tutorial"
linkTitle: "Hipster Store Tutorial"
weight: 3
description: >
  The Hipster Store Test Drive.
---

## Log in and Take a Test Drive

When you [signed up to use Ortelius SaaS](https://www.deployhub.com/register-for-team/?), you were asked for basic information. Your UserID/Password, Company and Project names. Your UserID/Password and Company name are unique.  Your Project will be a _Subdomain_ under your Company _Domain_.

 Ortelius is accessible through the following url:

[https://console.deployhub.com/dmadminweb/Home](https://console.deployhub.com/dmadminweb/Home)

Login using the UserID and Password you used when you signed up for Ortelius.

## The Online Store Company - Hipster Store Tutorial

This _Hipster Store_ tutorial walks you through the basic concepts and [Objects](/guides/userguide/concepts/basic-concepts/) behind Ortelius. It also allows you to run a deployment in our hosted Kubernetes cluster (Google.) In Ortelius terminology, the Hipster Store is both an _Application_ and a _Subdomain_. The Hipster Store belongs to a higher level _Domain_ called the "Online Store Company".  We will first review and deploy an _Application_ and then we will review the _Application's_ _Components_ and how they are organized under _Domains_. We will review the "Online Store Company" _Domain_ structure, and show how the Objects are organized using a _Domain_ design.

## Learn About Applications

An _Application_ is a collection of microservices or _Components_ that make up a complete software solution.  In monolithic, we compile/link an _Application_, but this goes away in microservices.  Ortelius puts the _Application_ back together providing a "logical view" of the _Application_ including the _Components_ that it depends upon.

_Applications_ are a collection of _Components_.  _Components_ are deployed to _Environments_. _Environments_ are a collection of _Endpoints_.  For more on each of these Objects see:

- [Packaging _Applications_](/guides/userguide/packaging-applications/)
- [Publishing _Components_](/guides/userguide/publishing-components/)
- [Build Your _Environments_](/guides/userguide/first-steps/2-define-environments/)
- [Define Your _Endpoints_](/guides/userguide/first-steps/2-define-endpoints/)

### Step 1 - Deploy the Hipster Store Application

To get started, [sign up for Ortelius](https://www.deployhub.com/free-team-sign-up/). Once you signed up, you will first deploy the Hipster Store _Application Base Version_ to the Hipster Store _Environment_.

- Select the _Application_ Menu option from the left side of the Ortelius Home panel. This will bring you to a List View.
- Checkbox the "Hipster Store;July 4th Sale." This is the Hipster Store _Application Base Version_ and it has not been previously deployed.
- Select the Tasks option at the top of the List View and choose "Deploy Version to Environment."  This will bring you to a pop-up dialog box that allows you to select an _Environment_ for the manual deployment.  Select "Hipster Store Cluster."

This process will deploy the _Application_ to the cluster.  Once the deployment completes and shows "success" in the results colum, double click on the "Hipster Store; July 4th Sale" to view the Dashboard.  Take a look at:

- The Dependency Map - this shows all of the _Component Versions_ the "Hipste Store;July 4th Sale" consumes.
- Log History - a list of deployment logs for this version of the Hipster Store.
- Deployed Environments for _Components_ - shows everything that was deployed for the cluster selected in the drop down box. For this base version, you deployed all _Components_.
- Select the "Package Component" tab at the top of the Dashboard. This will take you to a blueprint designer. This designer is how you define your _Application Base Version_. The blueprint show which _Components_ are being consumed by this _Base Version_.  Notice on the right hand side there is a _Component Selector_.  If you navigate through the tree view, you will see _Domains_ where _Components_ like microservices have been published.  The Hipster Store reuses microservices from the "Purchase Processing" and "Store Service" as well as the "Front End" service from its own Hipster Store _Domain_.

Now lets do a second deployment by selecting a new version of the Hipster Store:

- Select the _Application_ Menu option from the left side of the Ortelius Home panel. This will bring you to a List View.
- Checkbox the "Hipster Store;July 4th Sale;1_2_9_1." This is a new version of the Hipster Store, called an_Application Version_ and it has not been previously deployed.
- Select the Tasks option at the top of the List View and choose "Deploy Version to Environment."  This will bring you to a pop-up dialog box that allows you to select an _Environment_ for the manual deployment.  Select "Hipster Store Cluster."

Once the deployment completes and shows "success" in the results colum, double click on the "Hipster Store; July 4th Sale;1_2_9_1" to view the Dashboard.  Take a look at:

- Log History - a list of deployment logs for this version of the Hipster Store. A new log will be available.
- Deployed Environments for _Components_ - This will show that only two microservices were deployed -  new Facebook _Component_ and a new version of the Currency Service _Component_.  Ortelius used its versioning engine to determine which _Components_ were already deployed to the cluster and only updated what changed.

## Learn about Domains

_Domains_ serve as the basic structure of organizing your microservice catalog. Developers use _Domains_ to catalog microservices based on 'solution spaces' allowing them to both share their services and find others.
_Domains_ are not folders. They serve as a method for creating fully qualified names of Objects within Ortelius to keep things organized.  You will learn how each Object is defined to a _Domain_ and how the Object's fully qualified name is derived. _Domains_ also manage security and Tasks.  When you assign security options and Tasks at the _Domain_ level, any child _Subdomain_ inherits the value. A child _Subdomain_ can override a parent _Domain_ value. Start exploring _Domains_ from the left side main menu and selecting the _Domain_ option.  You will be brought to a sunburst map that shows the following three levels of _Domains_:

<ul><li>Global - the highest level Domain. This cannot be changed.</li>
<ul><li>Online Store Company - A sample company configuration. See <a href="/guides/userguide/introduction/0-hipster-store-tutorial/">Hipster Store </a> </li>
<li>Your Company Name - Your Company Domain Level</li>
<ul><li>Your Project Name - A Subdomain of your Company Domain. This Domain can be defined with "Life Cycle Subdomains for managing a deployable software application using a Pipeline, or it can be used as a Catalog Domain for publishing Components such as microservices.</li></ul></ul></ul>

For our tutorial, we will explore the Online Store Company _Subdomain_ and it's child _Subdomains_. Click on the Sunburst Online Store Company Segment to view the child _Subdomains_.

- Hipster Store - A Project _Subdomain_ where our _Application_ lives.
- Purchase Processing - A Catalog _Subdomain_ where microservices and other _Components_ live that handles the purchase processing services for the entire fictitious Online Store Company.
- Store Services - A Catalog _Subdomain_ where microservices and other _Components_ live that handle general services for the entire company.
- Load Generator - A Catalog _Subdomain_ where reusable testing _Components_ live.

Each of these _Subdomains_ have their own _Subdomains_.  Let's explore:

### Step 1 - Explore a Catalog _Subdomain_

From the Ortelius home panel, select _Domains_ on the left hand side Main Menu. Click on the "Store Services" _Subdomain_ to see what it includes. You will see _Subdomains_ that provide services for the following "Solution Spaces":

- Add Services
- Email Services
- Product Catalog Services
- Recommendation Services
- Cart Services

These Store Services _Subdomains_ organize _Components_ that can be reused by any other team for building out custom websites for our fictitious Online Store Company.  You can also explore the Purchase Processing _Subdomain_ to see how these solution spaces are organized. You can click on the center of the starburst map to navigate back up to higher level _Domains_.

### Step 2 - Explore a Project _Subdomain_

Now lets take a look at our Hipster Store _Subdomain_.  The Hipster Store _Subdomain_ manages our Hipster Store _Application_.  It also has _Subdomains_, but these _Subdomains_ are refereed to as "Life Cycle _Subdomains_."  Life Cycle Subdomains are defined to contain _Environments_ where your _Application_ will be deployed. Life Cycle _Subdomains_ cannot have any child _Subdomains_.  It is the lowest level of _Subdomain_ allowed.

### Step 3 - Explore the Online Store _Domain_ Details and Access

Return to the Online Store Company _Domain_ by clicking anywhere in the center of the sunburst map. Details about this _Domain_ is displayed to the right of the sunburst.  You will see that is belongs to the "Global" _Domain_, shown by the field labeled "Full Domain."  You will also see that it has the "All _Subdomains_ are Life Cycles" option set to "No" and a list of it's child _Subdomains_. There are other details as well. For a full description see [Building Your Domain Catalog](/guides/userguide/first-steps/2-defining-domains/).

The Access Control Section defines who can see this _Domain_ and it's child _Subdomains_. For this example, the "Everyone" _Group_ is defined to all Access.  The Everyone _Group_ is a default Ortelius _Group_ that includes all _Users_ and _Administrators_.  For more on _Users_ see [Managing Users](/guides/userguide/customizations/2-users/).

### Step 3 - Explore Tasks for the Online Store Company _Domain_

You used the "Deploy Version to an Environment" Task when you deployed the Hipster Store. Tasks allow you to perform steps related to deployments and are only needed by your Project _Domains_. You can assign a Task at a higher _Domain_ level allowing any child _Domains_ to automatically inherit the Tasks. This inheritance simplifies managing Tasks by making some common to all of your _Subdomains_. However, this means that a Catalog _Domain_ may include Tasks that it cannot see.

You can assign Access to Tasks and customize them with Pre and Post _Actions_.  For more on Tasks see [Deployment Tasks](/guides/userguide/first-steps/2-defining-domains/#deployment-tasks).

## Learn about Components

_Components_ are microservices, binaries, database SQL, files or any deployable artifact used by an _Application_.  _Components_ themselves are not deployed, they must be consumed by an _Application_ in order to be deployed to an _Environment_. With microservices, this may seem counter intuitive as microservices are independently deployable.  This is true and Ortelius takes this into account during a deployment of an _Application_. Ortelius deploys using incremental processing which means if a single  _Component_ of an _Application_ is updated, and the _Application_ is deployed, only the single _Component_ is moved.  Ortelius does incremental processing of deployable objects, but relates them to a logical _Application_.  If an _Application_ pushes a new version of a single microservice _Component_ to a cluster, it will move alone.  Subsequently, all dependent _Applications_ will have a new _Application Version_ created.

### Step 1 - Review the Hipster Store _Components_

Choose the _Components_ Menu option on the left side of the Ortelius home panel. This will take you to a list view of all _Component Base Versions_ and _Component Versions_.  A _Component Base Version_ is the original _Component_. When the _Component_ is updated, a _Component Version_ is created.

Double click on the "cartservice;v1_2_2_9_gcadf581" _Component Version_ to explore the _Component_.  You will be taken to the Dashboard view. You will see in the "Full Domain" field of the Details Section to what _Domain_ the _Component_ belongs.  You will see all _Applications_ that have a dependency on this version of the _Component_, and in the "Deployed Environments for _Component_" you will see all _Environments_ where the _Component_ has been deployed.

## Learn about _Environment_ and _Endpoints_

_Environments_ are collections of one or more _Endpoints_ where _Applications_ are installed.

### Step 1 - Review the Hipster Store _Environment_

Select _Environments_ from the left hand side of the Ortelius main home panel. This will take you to a list of _Environments_. Double click on the "Hipster Store Cluster". From the Dashboard view you can see how the _Environment_ was setup.  You can also see all of the _Components_ installed on this cluster.

### Step 2 - Review the Hipster Store Cluster _Endpoint_

Select _Endpoints_ from the left hand side of the Ortelius main home panel.  This will take you to a list of _Endpoints_.  Double click on the "Hipster Store Cluster Helm Host" _Endpoint_.  This _Endpoint_ defines where Helm will execute to update the cluster. This _Endpoint_ has been configured to talk to the Hipster Store Cluster.  See [Helm for Container Deployments](/guides/userguide/integrations/helm/) for creating your Helm configuration file.

## Conclusion

There are many other features of Ortelius that we did not get to cover on this short test drive. However, you should have the basic understanding of the major Objects and concepts needed to get you started.  What we did not cover that you may want to view are:

- [Create Credentials](/guides/userguide/first-steps/2-define-your-credentials/) - User names and passwords for accessing _Endpoints_ and _Repositories_.
- [Connect Repositories](/guides/userguide/first-steps/2-define-repositories/) - Repositories for accessing artifiacts.

We will leave you with how to setup Ortelius for your installation.  See [First Steps](/guides/userguide/first-steps/), for getting your setup completed. Once you have your setup complete you can start publishing _Components_, packaging _Applications_ and performing deployments.

Another important topic is integrating with your CD pipeline.  See [Using Ortelius with CI/CD](/guides/userguide/integrations/ci-cd_integrations/) for how you can include continuous configuration management and continuous deployments into your CD pipeline.
