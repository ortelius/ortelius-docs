---
title: "Fine dining with Abraham Ortelius"
linkTitle: "Fine dining with Abraham Ortelius"
weight: 4
description: >
  We begin our local environment construction here.
---

# Fine dining with Abraham Ortelius

## Canapes

### Windows 10 / 11
- Latest version & fully updated
- Enable `WSL2` | Go to `Programs and features` → `Turn Windows features on or off` → `Windows Subsystem for Linux`
- Install [Windows Terminal](https://docs.microsoft.com/en-us/windows/terminal/install) for easier management
- Use this [documentation](https://www.windowscentral.com/how-install-ubuntu-2110-wsl-windows-10-and-11) to install the latest Ubuntu flavour (we recommend `Ubuntu Jammy JellyFish`)
- Line feed ending issues can be solved with the [Change All End of Line Sequence](https://marketplace.visualstudio.com/items?itemName=vs-publisher-1448185.keyoti-changeallendoflinesequence) VS Code extension or [Dos2Unix](https://www.computerhope.com/unix/dos2unix.htm)
- Windows uses CRLF; Linux uses LF
- **Suggestion:** Set your VS Code to `LF` and do all your work inside WSL2

### WSL Configs

**Windows:** `c:\Users\Abraham\.wslconfig`
```
[wsl2]
memory=4GB
processors=2
swap=4GB
localhostforwarding=true
nestedVirtualization=false
debugConsole=true

[user]
default = youruser

[automount]
options = "metadata"
```

**Ubuntu VM:** `/etc/wsl.conf`
```
[automount]
enabled = true
root = /
options = "metadata,uid=1003,gid=1003,umask=077,fmask=11,case=off"
mountFsTab = true

[network]
hostname = DemoHost

[interop]
enabled = false
appendWindowsPath = false

[user]
default = DemoUser

[boot]
command = service docker start
```

## Linux

#### [Ubuntu](https://ubuntu.com/)
- Recommended distro for WSL2

### Package Managers
- **APT** for Ubuntu: `sudo apt update && sudo apt upgrade`
- **YUM** for CentOS: `sudo yum update`

## macOS

### Package Managers
- [Brew.sh](https://brew.sh/) — recommended
- [Macports.org](https://www.macports.org/)
- [Docker Mac Net Connect](https://github.com/chipmk/docker-mac-net-connect) — **required** for accessing containers directly by IP

```bash
brew install chipmk/tap/docker-mac-net-connect
sudo brew services start chipmk/tap/docker-mac-net-connect
```

---

# Starters

### [Topgrade](https://github.com/r-darwish/topgrade) — Update everything with one command `OPTIONAL`
- Supports all operating systems
- Config file: `.config/topgrade.toml`

### [Devdocs.io](https://devdocs.io/) — Offline command encyclopedia
- Covers Bash, Docker, Git, Go, HTML, JavaScript, Markdown, Nginx, Node.js, npm, Python, Kubectl, Kubernetes and more

### [WARP](https://www.warp.dev/) — Modern terminal `OPTIONAL`

### [Discord.com](https://discord.com/)
- Set up a dedicated Discord server with a channel for Git Guardian alerts before setting up Git Guardian

### [Git Guardian](https://www.gitguardian.com/)
- Warns you when sensitive information is accidentally pushed to public repos
- Set up Discord notifications for alerts

---

# Main Course

### [Git-scm.com](https://git-scm.com/)
- Install Git for all things source control
- See the [Ortelius PR Cheat Sheet](https://docs.ortelius.io/guides/contributorguide/pull-request-cheat-sheet/)

`.gitconfig` inspiration:
```
[alias]
cap = "!f() { git add .; git commit -m \"$@\"; git push; }; f"
new = "!f() { git cap \"📦 NEW: $@\"; }; f"
imp = "!f() { git cap \"👌 IMPROVE: $@\"; }; f"
fix = "!f() { git cap \"🐛 FIX: $@\"; }; f"
rlz = "!f() { git cap \"🚀 RELEASE: $@\"; }; f"
doc = "!f() { git cap \"📖 DOC: $@\"; }; f"
tst = "!f() { git cap \"🤖 TEST: $@\"; }; f"
brk = "!f() { git cap \"‼️ BREAKING: $@\"; }; f"

[init]
defaultBranch = main

[pull]
rebase = false
```

### Source Control — [GitHub.com](https://github.com/)
- Set yourself up on GitHub

### [VS Code](https://code.visualstudio.com/) IDE
- Download VS Code [here](https://code.visualstudio.com/download)
- **Recommended Extensions:**
  - `golang.Go` — Go language support
  - `dbaeumer.vscode-eslint` — ESLint for JS/TS
  - `esbenp.prettier-vscode` — Code formatter
  - `snyk-security.snyk-vulnerability-scanner` — Security scanning
  - `redhat.vscode-yaml` — YAML support
  - `vs-publisher-1448185.keyoti-changeallendoflinesequence` — Line ending fixer
  - `Gruntfuggly.todo-tree` — TODO tracking
  - `yzhang.markdown-all-in-one` — Markdown authoring

### [Go](https://go.dev/) — Backend Language
- [Download Go](https://go.dev/dl/) (1.21+ recommended)
- [Go Tour](https://go.dev/tour/) — interactive introduction
- [Go by Example](https://gobyexample.com/)
- [Go Modules reference](https://go.dev/ref/mod)
- Install the Go VS Code extension for IDE support, debugging, and linting

### [Node.js](https://nodejs.org/) — Frontend Runtime
- [Download Node.js LTS](https://nodejs.org/)
- [Next.js Documentation](https://nextjs.org/docs)
- [npm Documentation](https://docs.npmjs.com/)

### [Docker.com](https://www.docker.com/)
- [Account setup](https://hub.docker.com/signup)
- [Install Docker Desktop](https://docs.docker.com/get-docker/)
- Scan images with Snyk: `docker scan your-docker-image`

### [Podman.io](https://podman.io/) — Docker alternative
- [Podman Desktop](https://podman-desktop.io/)
- [Podman documentation](https://docs.podman.io/en/latest/)

### Container Registries
- [Docker Hub](https://hub.docker.com/)
- [AWS ECR](https://gallery.ecr.aws/)
- [GCP Container Registry](https://cloud.google.com/container-registry)
- [Azure Container Registry](https://azure.microsoft.com/en-us/products/container-registry/)
- [Red Hat Quay](https://quay.io/) — Ortelius images live here

### [Kind.sigs.k8s.io](https://kind.sigs.k8s.io/)
- Runs K8s nodes as Docker containers — great for local testing
- [Quick start](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)

### [Kubernetes.io](https://kubernetes.io/)
- K8s is a production-grade container orchestrator

### Kubectl
- [Install kubectl](https://kubernetes.io/docs/tasks/tools/)
- [kubectl cheat sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

### [ArangoDB.org](https://www.arangodb.com/)
- Open source relational database used by Ortelius

---

# Dessert

### [Ortelius.io](https://ortelius.io/)
- [Documentation](https://docs.ortelius.io/guides/)
- [User Guide](https://docs.ortelius.io/guides/userguide/)
- [Contributors Guide](https://docs.ortelius.io/guides/contributorguide/)

### [Helm.sh](https://helm.sh/)
- K8s templating engine

### [Argo CD](https://argo-cd.readthedocs.io/en/stable/)
- Declarative GitOps continuous delivery for Kubernetes

### [AWS Localstack](https://localstack.cloud/) `OPTIONAL`
- Run the AWS cloud locally for offline development and testing

### [Terraform](https://www.terraform.io/intro) / [Pulumi](https://www.pulumi.com/) — IaC `OPTIONAL`
