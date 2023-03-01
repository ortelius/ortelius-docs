---
title: "Pull Request (PR) Cheat Sheet"
linkTitle: "Pull Request Cheat Sheet"
weight: 10
description: >
  Pull Request (PR) Cheat Sheet.
---

# Pull Request (PR) Cheat Sheet

## Savoir-vivre of pull requests

Patches for fixes, features, and improvements are accepted through pull requests. Here are some tips for contributing:

* Add Git Commit Signing to your local git install and to GitHub.  Here are the [config instructions](https://blog.petehouston.com/sign-git-commits/).
* Write good commit messages in the present tense ("Add X", not "Added X") with a short title, blank line, and bullet points if needed. Capitalize the first letter of the title and any bullet items. No punctuation in the title.
* Include tests to improve coverage and prevent regressions.
* Squash changes into a single commit per feature/fix. 
 Typical steps to do that are:
    - git rebase -i HEAD~3 (the number depends on the number of commits you are squashing)
    - git push -u origin master --force (master might not be the branch you are pushing to so make sure to change to the branch)
* Whenever possible, tag your pull request with appropriate Github labels and issue numbers.

**Important:** For any **breaking changes** that require a major version bump, add `BREAKING CHANGE` somewhere in the commit title or message.

## Terms

- Branch - series of commits
- Clone - create a local copy of a repo
- Commit - change to the repo
- Downstream - this would be your repository that is forked from an Ortelius repo [sbtaylor15/ortelius-docs](https://github.com/sbtaylor15/ortelius-docs)
- Fetch - sync a repo with another
- Fork - your copy of the upstream repo
- Local Repo - a repo on your computer
- Pull - get changes from GitHub into your local repo
- Pull Request (PR) - changes to be merged from one repo to another repo
- Push - send your changes to GitHub
- Rebase - rewrite commit history
- Remote Repo - a repo on GitHub
- Squash - combining multiple commits into one
- Upstream - this would be an Ortelius repository [ortelius/ortelius-docs](https://github.com/ortelius/ortelius-docs)

## Working scenarios

We want to update the User Guide that is in the [ortelius/ortelius-docs](https://github.com/ortelius/ortelius-docs) repo.

### First pull request

1) Fork the Ortelius repo
   In GitHub click on the Fork button for the repo you want to make a copy of, i.e. [ortelius/ortelius-docs](https://github.com/ortelius/ortelius-docs).  The fork will be created under
   your userid as [sbtaylor15/ortelius-docs](https://github.com/sbtaylor15/ortelius-docs).

2) Make a local copy of your repo [sbtaylor15/ortelius-docs](https://github.com/sbtaylor15/ortelius-docs). The url for the repo is under the *Code* button in GitHub for your repo.

   From a command prompt, `cd /home/steve/repos`

   Run `git clone https://github.com/sbtaylor15/ortelius-docs.git` this will create `/home/steve/repos/ortelius-docs`

3) Tell your local repo about the upstream and downstream repos (this only needs to be done once)
   
   By this tep you will create `upstream` and `downstream` local variables which contain address of source and your forked repos. You can use them as parameters of `git` key word.

   ```
   git remote add upstream https://github.com/ortelius/ortelius-docs.git
   git remote add downstream  https://github.com/Javailabe/ortelius-docs.git
   ```
   `upstream` holds `https://github.com/ortelius/ortelius-docs.git`

   `downstream` holds `https://github.com/Javailabe/ortelius-docs.git` (that is forked repo of Javailabe user)

4) Make a branch for your work

   ```
   cd /home/steve/repos/ortelius-docs
   git checkout -b maintenance
   ``` 
   `maintenance` will be your branch name

5) Make some changes

   Update the files and commit the changes back to your local branch

   ```
   git add .
   git commit -m "changed some files"
   ```

   Do this as many time that you want.

6) Squash before merge

   We need to collapse all of our little changes into one.  This will make merging much easier.

   ```
   git checkout master
   git log --oneline -1
   ``` 

   Grab the commit sha (hex number), i.e. d34bf46

   ```
   git checkout -b maintenance
   git rebase -i d34bf46
   ```

   You will be placed into an editor with a line for each commit.  The first column will say 
   pick.  Change pick to squash from line **2** to the end of the list.  Save and quit the file.

   You will jump back to the command prompt for a bit while git does it work.  The editor will
   pop up again.  This is the comment for the squashed commit.  All of the comments from the
   little commit are listed.  Delete all of the lines and add a single line describing your
   changes.

   If you run `git log --oneline` you should see that there is only one new commit.

7) Update GitHub forked repo with your local changes

   We can backup changes to GitHub at anytime without effecting anyone else.

   ```
   git push downstream
   ```

   This syncs forked GitHub repo with your local branch.  Basically, you are overriding GitHub.

8) Create your Pull Request

    In GitHub, go to the upstream repo and do a new pull request.  Choose compare across
    forks.  Select your fork and master branch.
	
9) After the PR has been merged you need to bring your repo in sync with upstream since it has new commits

      ```
      git checkout master
      git fetch upstream
      git rebase upstream/master
      ```

### Daily regime

1) Sync your local repo

      ```
      git pull upstream
      git push downstream
      ```
      This will download the latest version of the upstream to your local repo and after push it will update (override) your forked GitHub repo

2) Make changes
   
   a) in case of multiple small commits it might be necessary to squash them all

3) Update GitHub forked repo with your local changes

      ```
      git push downstream
      ```

4) Create your Pull Request

5) After PR merging, sync your repos (step 1)
