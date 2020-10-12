---
title: "Contributing"
linkTitle: "Contributing"
weight: 140
description: >
  Getting started with contributing
---

# How to Contribute

We'd love to accept your patches and contributions to this project. There are
just a few small guidelines you need to follow.

## Contributor License Agreement

Contributions to this project must be accompanied by a Contributor License
Agreement. You (or your employer) retain the copyright to your contribution;
this simply gives us permission to use and redistribute your contributions as
part of the project. Please fill out the [Ortelius Individual CLA](./OrteliusIndividualCLA.pdf) or the [Ortelius Corporate CLA](./OrteliusCorporateCLA.pdf)
and email the signed document to cla@ortelius.io.

## Code reviews

All submissions, including submissions by project members, require review. We
use GitHub pull requests for this purpose. Consult
[GitHub Help](https://help.github.com/articles/about-pull-requests/) for more
information on using pull requests.

## Submitting Pull Requests

Patches for fixes, features, and improvements are accepted through pull requests. Here are some tips for contributing:

* Add Git Commit Signing to your local git install and to GitHub.  Here are the [config instructions](https://blog.petehouston.com/sign-git-commits/).
* Write good commit messages in the present tense ("Add X", not "Added X") with a short title, blank line, and bullet points if needed. Capitalize the first letter of the title and any bullet items. No punctuation in the title.
* Include tests to improve coverage and prevent regressions.
* Squash changes into a single commit per feature/fix. 
 Typical steps to do that are:
    - git rebase -i HEAD~3 (the number depends on the number of commits you are squashing)
    - git push -u origin master --force (master might not be the branch you are pushing to so make sure to change to the 
 branch)
* Whenever possible, tag your pull request with appropriate Github labels and issue numbers.

**Important:** For any **breaking changes** that require a major version bump, add `BREAKING CHANGE` somewhere in the commit title or message.
