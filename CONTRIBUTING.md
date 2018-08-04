# Contribution Guide for PolyMath

This file is currently not complete but will be improve step by step.

# Contributing code
Use last version of Pharo 7.0 in order to use Iceberg.
## Fork the Pharo repository

All changes you'll do will be versionned in your own fork of the [PolyMath repository](https://github.com/PolyMathOrg/PolyMath). Then, from your fork you'll be able to issue pull requests to PolyMath, where they will be reviewed, and luckily, integrated.

Go to PolyMath github's repository and click on the fork button on the top right. Yes, this means that you'll need a github account to contribute to PolyMath, yes.

## Load last dev version of PolyMath
In a fresh Pharo 7.0 image, load last development version of Polymath : 

```Smalltalk
Metacello new
    githubUser: 'XXX' project: 'PolyMath' commitish: 'development' path: 'src';
    baseline: 'PolyMath';
    load.
```
where you replace XXX with your github user name.

## Setup Iceberg
You need an ssh key in order to commit on github. Open Iceberg tool, and then click on the settings. Check the box : "Use custom SSH keys".

## Send the PR to github
After doing the modification in your image, open Iceberg tool, commit the changes in your PolyMath repository. Cherry-pick the modifications that you want to include in your commit. In the github interface, create a Pull Request from your commit.
Send the PR to PolyMath main repository.

## Cleanups
Ounce your pull request is integrated, some cleanups are required:
- remove your branch from your fork
- close the issue (tips: you can automatically close the issue n, by inserting the sentence: **close #n** when you merge your pull request).

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

This project uses gitflow management.

This project contains two main branches:
- **master** : This branch is a stable branch. Each version on this branch should be a stable release of PolyMath, and ideally each commit modifying the source code of the project should be tagged with a version number.
- **development** : This branch contains the current development of this project. 

## Hot fix

If a bug is found in a stable version and the correction is backward compatible, it should be corrected in an hotfix branch. Once the correction is finished the hotfix branch should be merged into master and development and a new bugfix release should be done.
