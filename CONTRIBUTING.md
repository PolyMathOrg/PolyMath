# Contribution Guide for PolyMath

This file is currently not complete but will be improve step by step.


# Contributing code
Code contribution that implement new features or fix bugs, should be done as [Pull Requests](https://help.github.com/articles/about-pull-requests/) on the development branch.

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
