# Contribution

This file is currently not complete but will be improve step by step.

# Release management

This project use semantic versionning to define the releases. This mean that each stable release of the project will get associate a version number of the form `vX.Y.Z`. 

- **X** define the major version number
- **Y** define the minor version number 
- **Z** define the patch version number

When a release contains only bug fixes, the patch number increase. When the release contains new features backward compatibles, the minor version increase. When the release contains breaking changes, the major version increase. 

Thus, it should be safe to depend on a fixed major version and moving minor version of this project.

# Branch management 

This project use gitflow management.

This project contains two main branches:
- **master** : This branch is a stable branch. Each version on this branch should be a stable release of Material Design Lite for Seaside, and idealy each commit modifying the source code of the project should be tagged with a version number.
- **development** : This branch contains the current development of this project. 

## New feature 

When a new feature will take some time to implement, this feature should be developed in a specific branch. Once done, it will be merged in development before the next release of Material Design Lite for Seaside.

## Hot fix

If a bug is found in a stable version and the correction is backward compatible, it should be corrected in an hotfix branch. Once the correction is finished the hotfix branch should be merged into master and development and a new bugfix release should be done.

# Management of the FileLibrary

For now, the resources of the project are managed via a FileLibrary. Since it is hard to write Javascript or CSS in Pharo there is a system to export the files and re-import them easily.

To export the files you can execute: `MDLLibrary deployFiles`. This will deploy all the files of the FileLibrary.
To import the files you can execute: `MDLLibrary importFiles`. Also, if you need to import the files a lot you can execute: `MDLLibrary openImportButton`.

## Management of the CSS

The CSS of this project is managed via [SASS](http://sass-lang.com/). We do not right CSS, we generate it from the SASS files.

To help with it, some scripts exists on the *scripts* folder. On script allow to compile the SASS into CSS and the second launch a watcher that will compile the SASS into CSS each time a file change.
 
