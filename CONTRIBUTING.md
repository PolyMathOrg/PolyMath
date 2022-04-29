# Contribution Guide for PolyMath

*This file is currently not complete but will be improve step by step.*

You need to download Pharo 9.0 or 10 first.

## Setup Iceberg
You need an ssh key in order to commit on github. Open Iceberg tool, and then click on the settings. Check the box : "Use custom SSH keys".

## Fork the PolyMath repository

All changes you'll do will be versionned in your own fork of the [PolyMath repository](https://github.com/PolyMathOrg/PolyMath). Then, from your fork you'll be able to issue pull requests to PolyMath, where they will be reviewed, and luckily, integrated.

Go to PolyMath github's repository and click on the fork button on the top right. Yes, this means that you'll need a github account to contribute to PolyMath.

## Load last dev version of PolyMath
In a fresh Pharo 9.0 or 10 image, load last development version of Polymath : 

```Smalltalk
Metacello new
    githubUser: 'XXX' project: 'PolyMath' commitish: 'master' path: 'src';
    baseline: 'PolyMath';
    load.
```
where you replace XXX with your github user name.

## Add main PolyMath repository as remote

Open Iceberg, open PolyMath repository, click on repositories, then + button (add remote).

Remote name: polymath-upstream

Remote URL: https://github.com/PolyMathOrg/PolyMath.git

## Send some changes to the original PolyMath repository

#### From Pharo Iceberg
After doing modifications in your image, open Iceberg tool, commit the changes in your PolyMath repository. Cherry-pick the modifications that you want to include in your commit. Then push your commit to your fork. It's more convenient to divide your changes in meaninfull and simple commits, which makes it easier to check for those who need to proofread it.

#### From Github UI
In the GitHub interface, create a Pull Request from your commit.
You have to give some information about what is the purpose of you pull request. Then submit it to PolyMath main repository. 
This will notify PolyMath core developers team that an improvement or bug fix is pending.

### Sync your fork with main PolyMath repo changes
After a while, changes from other developers are integrated in the main PolyMath repository and your fork became out of sync.
In order to do that, you need the fetch the last modifications from the main PolyMath repository, merge them in your image and then push them in your fork repository.

You have also the possibility to delete your fork and fork again the main PolyMath repository.

## Cleanups
Ounce your pull request is integrated, some cleanups are required:
- remove your branch from your fork
- close the issue (tips: you can automatically close the issue n, by inserting the sentence: **close #n** when you merge your pull request).

You will need from time to time to sync your fork with the original repo. You can do it on the command line with: https://help.github.com/articles/syncing-a-fork/ or in the browser like : https://github.com/KirstieJane/STEMMRoleModels/wiki/Syncing-your-fork-to-the-original-repository-via-the-browser You can also kill and redo a fork very easily.

# Release management

This project use semantic versionning to define the releases, meaning that each stable release of the project will be assigned a version number of the form `vX.Y.Z`. 

- **X** define the major version number
- **Y** define the minor version number 
- **Z** define the patch version number

- When a release contains only bug fixes, the patch number is incremented;
- When the release contains new backward compatible features, the minor version is incremented;
- When the release contains breaking changes, the major version is incremented. 

Thus, it should be safe to depend on a fixed major version and moving minor version of this project.

# Branch management 

This project uses trunk-based development: https://trunkbaseddevelopment.com/

This project contains two main branches:
- **master** : This branch is a stable branch. Each version on this branch should be a stable release of PolyMath, and ideally each commit modifying the source code of the project should be tagged with a version number.
- **release** : This branch contains the releases of this project. 

## Hot fix

If a bug is found in a stable version and the correction is backward compatible, it should be corrected in an hotfix branch. Once the correction is finished the hotfix branch should be merged into master and development and a new bugfix release should be done.
