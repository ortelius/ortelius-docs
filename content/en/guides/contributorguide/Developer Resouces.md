---
title: "Developer Resources"
linkTitle: "Developer Resources"
weight: 10
description: >
  Tools, Tips and Tricks for Developers.
---

## Developer Tools

The following developer tools will be needed for you to contribute to Ortelius code or documentation:

### Editors

Any of the following Markdown editors can be used: 
- [Visual Studio Code](https://code.visualstudio.com/) with following extensions:
    - Markdown Preview Enhanced - Yiyi Wang
    - markdownlint - David Anderson
    - Docker - Microsoft
    - Docsy - Etienne Dldc
    - Go - Go Team at Google
    - Python - Microsoft
- [PostgreSQL](https://www.postgresql.org/download/) - list of different distrubitions of PostgreSQL tool
    - This is complete package which include PostgreSQL Server, pgAdmin 4, Stack Builder and Command Line Tools
- [pgAdmin](https://www.postgresql.org/ftp/pgadmin/pgadmin4/) - here you can find list of different versions of pgAdmin tool

### Testing Environment

To setup your environment to create a runtime test environment: 
- [Docker](https://docs.docker.com/get-docker/)
- [Helm](https://helm.sh/docs/intro/install/)
- GCloud 
- Azure
- Set local test database [(Link to source)](https://github.com/ortelius/test-database)
    - Default userid and password are `admin` / `admin`
    - Run the image:
        1) Pull the image
          
            ```    
            docker pull quay.io/ortelius/test-database:latest
            ```

        2) Find the image id
            
            ```
            docker image ls quay.io/ortelius/test-database:latest --format "{{.ID}}"
            ```

        3) Create the volume to persist the database

            ```
            docker volume create pdata
            ```

        4) Run the image a expose the Postgres port to the outside world

            ```
            docker run -it -p 9876:5432 -v pgdata:/var/lib/postgresql/data <id_from_step_2>`
            ```

    - The database in the above example will be accessible on port 9876.
        - Userid: postgres
        - Password: postgres
        - Database: postgres
        - Schema: dm

- Container Structure Test
    - The image also has a minimal [container-structure-test](https://github.com/GoogleContainerTools/container-structure-test) setup.
    - This is run as part of the cloud build, and can also be run locally on MacOS/Linux/WSL:

        ```
        container-structure-test test --image=quay.io/ortelius/test-database:latest --config=cst/config.yaml
        ```

### Git

To submit issues and manage pull request:
- [Git GUIs](https://git-scm.com/downloads/guis/)

Getting started with a Pull Request can be tricky. There are a lot of small steps that need to be done in the right order otherwise you may get hung up on a strange error. The nice thing with Git is that its really hard to permanently loose your work.  Check out the [PR Cheat Sheet](https://docs.ortelius.io/guides/contributorguide/pull-request-cheat-sheet/) for the steps on doing a Pull Request. Go through this before starting any changes since a proper setup will make the merge easier down the road.

### Communication

- [Discord Channel](https://discord.gg/ZtXU74x)

