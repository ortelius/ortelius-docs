---
title: "Pull Request (PR) Cheat Sheet"
linkTitle: "Pull Request Cheat Sheet"
weight: 10
description: >
  Pull Request (PR) Cheat Sheet.
---

# Pull Request (PR) Cheat Sheet

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

## Terms

- Upstream - this would be an Ortelius repository [ortelius/ortelius-docs](https://github.com/ortelius/ortelius-docs)
- Fork - your copy of the upstream repo
- Downstream - this would be your repository that is forked from an Ortelius repo [sbtaylor15/ortelius-docs](https://github.com/sbtaylor15/ortelius-docs)
- Pull Request (PR) - changes to be merged from one repo to another repo
- Commit - change to the repo
- Squash - combining multiple commits into one
- Branch - series of commits
- Fetch - sync a repo with another
- Local Repo - a repo on your computer
- Remote Repo - a repo on GitHub
- Rebase - rewrite commit history
- Clone - create a local copy of a repo
- Push - send your changes to GitHub
- Pull - get changes from GitHub into your local repo

## Example Scenario

We want to update the User Guide that is in the [ortelius/ortelius-docs](https://github.com/ortelius/ortelius-docs) repo.

### Steps

1) Fork the Ortelius repo
   In GitHub click on the Fork button for the repo you want to make a copy of, i.e. [ortelius/ortelius-docs](https://github.com/ortelius/ortelius-docs).  The fork will be created under
   your userid as [sbtaylor15/ortelius-docs](https://github.com/sbtaylor15/ortelius-docs).

2) Make a local copy of your repo [sbtaylor15/ortelius-docs](https://github.com/sbtaylor15/ortelius-docs). The url for the repo is under the *Code* button in GitHub for your repo.

   From a command prompt, `cd /home/steve/repos`

   Run `git clone https://github.com/sbtaylor15/ortelius-docs.git` this will create `/home/steve/repos/ortelius-docs`

3) Make a branch for your work

   ```
   cd /home/steve/repos/ortelius-docs
   git checkout -b maintenance
   ``` 

4) Make some changes

   Update the files and commit the changes back to your local branch

   ```
   git add .
   git commit -m "changed some files"
   ```

   Do this as many time that you want.

5) Backup your changes to GitHub

   We can backup changes to GitHub at anytime without effecting anyone else.

   ```
   git push
   ```

   You may get a message about the changes not getting tracked.  Just copy git command
   displayed in the message and run it.  That will fix the error. Only needs to be done once.

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

7) Update GitHub with your local changes

    ```
    git push --force
    ```

    This syncs GitHub with your local branch.  Basically, you are overriding GitHub.

8) Tell your local repo about the upstream repo (this only needs to be done once)

   ```
   git remote add upstream https://github.com/ortelius/ortelius-docs.git
   ```

9) Update your local fork with upstream changes

   ```
   git checkout master
   git fetch upstream
   git merge upstream/master
   ```

10) Merge your change with the upstream changes

    ```
    git merge maintenance
    ```

    You may get a merge conflict if you and someone else changed the same file at the 
    same time.  Use an editor like VS Code to pick and choose which conflicting lines
    are the right ones.

    ```
    git add .
    git commit -m "merged conflict with upstream"
    ```

11) Push your merged changes to GitHub

    ```
    git push
    ```

12) Create your PR.

    In GitHub, go to the upstream repo and do a new pull request.  Choose compare across
    forks.  Select your fork and master branch.
