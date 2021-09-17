# Ortelius documentation

This is the documentation repo for Ortelius.

Ortelius is an Open Source Project that maps your microservice configurations with their relationships to the applications that use them.

Ortelius is a package that helps with continuous microservices management. Ortelius, named after Abraham Ortelius, the inventor of the first atlas, helps trace the connections between services to improve an ecosystem’s visibility. To get an idea of how it behaves, consider an e-commerce store. To reach an evolvable microservices pipeline, each microservice should be independently deployable with its own workflow. For example, an e-commerce store may require a product microservice, payment microservice and an authentication microservice. These reusable components are independently deployable but rely upon one another to function as a whole. At a macro scale, an enterprise with thousands of inter-application dependencies would visually resemble a constellation of nodes. An extreme example of this may resemble the Netflix Death Star, a mass conglomeration of intersecting points. Ortelius grants transparency into an otherwise tangled mess as an “internal marketplace for microservices,” said Ragan

# Benefits

By streamlining the microservices journey in this way, repos will be broken out and teams no longer go through one big long workflow. According to Ragan, the visibility garnered from this method could help organizations in multiple other ways:

Reduce time: Ragan estimated automated application relationship mapping could replace one to two hours of manual work per week per development team.
Reusability: Decomposing applications into their domains aids reusability across an organization.
Avoid redundancy: Code sharing can significantly reduce duplicated code, thus avoiding redundancy and increasing flexibility.
Visibility: Detailed application to service relational knowledge could empower SREs to make better data-driven decisions.
Centralize: Helps standardize container deployment processes regardless of cluster type or collection, aiding both traditional and containerized microservices deployments.
Versioning: Improved insight into versioning helps when you need to share services externally.

## Based on Docsy Example

[Docsy](https://github.com/google/docsy) is a Hugo theme for technical documentation sites, providing easy site navigation, structure, and more. This **Docsy Example Project** uses the Docsy theme, as well as providing a skeleton documentation structure for you to use. You can either copy this project and edit it with your own content, or use the theme in your projects like any other [Hugo theme](https://gohugo.io/themes/installing-and-using-themes/).

This Docsy Example Project is hosted at [https://example.docsy.dev/](https://example.docsy.dev/).  You can find detailed theme instructions in the [Docsy user guide](https://docsy.dev/docs/).

This is not an officially supported Google product. This project is currently maintained.

## Running the website locally

Once you've cloned the site repo, from the repo root folder, run:

```Shell
hugo server
```

## Installation and Support guide

[Installation and Support](http://docs.ortelius.io/guides/userguide/installation-and-support/)

AG: Change to sign CLA
