## MHWD DB - RebornOS

MHWD database for RebornOS.

[![Discord Server](https://dcbadge.vercel.app/api/server/cU5s6MPpQH?style=flat)](https://discord.gg/cU5s6MPpQH)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/rebornos-developers/mhwd-db-rebornos)
[![Release](https://github.com/RebornOS-Developers/mhwd-db-rebornos/actions/workflows/release.yml/badge.svg)](https://github.com/RebornOS-Developers/mhwd-db-rebornos/actions/workflows/release.yml)
[![Pre-Release (Git)](https://github.com/RebornOS-Developers/mhwd-db-rebornos/actions/workflows/pre_release.yml/badge.svg)](https://github.com/RebornOS-Developers/mhwd-db-rebornos/actions/workflows/pre_release.yml)

> **Note**: This project should carry any RebornOS-specific configuration for MHWD. Refer to the [mhwd-rebornos](https://github.com/RebornOS-Developers/mhwd-rebornos) project for other non-RebornOS-specific files.

This is a fork of the [MHWD DB CachyOS project](https://github.com/CachyOS/mhwd-db-cachyos). It is highly recommended to [keep this project updated](https://github.com/RebornOS-Developers/mhwd-db-rebornos#updating).

## Cloning

In order to download the source code to your local computer for testing, or for development, you can clone from the remote repository using either SSH, or HTTPS. Below are instructions on how to do so using Gitlab hosted code as remote.

### HTTPS

```bash
git clone https://github.com/RebornOS-Developers/mhwd-db-rebornos.git 
```

OR

### SSH

```bash
git clone git@github.com:RebornOS-Developers/mhwd-db-rebornos.git
```

## Local development

### 1. Build

The below script will build the ISO image (and install any prerequisites). Change to the project directory (`cd mhwd-db-rebornos`) and run th below. You can specify any commandline parameters to `makepkg` by passing it to the below script

```bash
sh scripts/build.sh
```

### 2. Run
Change to the project directory (`cd mhwd-db-rebornos`) and run the below. You can specify any commandline parameters to `mhwd-db-rebornos` by passing it to the below script

```bash
sh scripts/run.sh
```

## Packaging

Change to the project directory (`cd mhwd-db-rebornos`) and run any of the below scripts:
- `sh packaging/setup.sh <MODE>`: Builds and installs a package
- `sh packaging/build-package.sh <MODE>`: Just builds a package without installing it locally
- `sh packaging/install-package.sh <MODE>`: Just installs a package locally, except if no built package is detected, a package is built.

- where `<MODE>` can be one of the below
     1. `local`: Selects *mhwd-db-rebornos-local* from the local project that you have cloned already.
     2. `git`: Selects *mhwd-db-rebornos-git* from the latest git commit.
     3. `stable`: Selects *mhwd-db-rebornos* from the git tag corresponding to the [`pkgver` specified in the PKGBUILD](https://github.com/RebornOS-Developers/mhwd-db-rebornos/blob/main/packaging/mhwd-db-rebornos/PKGBUILD#L4). If `pkgver=3.3.0_alpha2_2`, then the git tag `v3.3.0_alpha2_2` is used for packaging. 
     
> **Note**: Any additional parameters passed to the above scripts are automatically sent to `makepkg` or `pacman` (whichever is applicable).

## Updating

To keep this project in sync with the upstream `mhwd-db-cachyos` source, please follow the below steps. Change to the project directory (`cd mhwd-db-rebornos`) before continuing...

1. **Fetch changes from the upstream Github source**: The below script clones the [upstream `mhwd-db-cachyos` source](https://github.com/CachyOS/mhwd-db-cachyos) to the `mhwd` branch (force overwrites it).
```sh
sh scripts/update_mhwd-db_branch.sh
```

2. **Merge upstream changes**
```sh
git checkout main

git merge mhwd-db
```

3. **Manually handle merge conflicts**: Follow [this guide for commandline operations](https://www.atlassian.com/git/tutorials/using-branches/merge-conflicts) or [this guide if you are using *Visual Studio Code*](https://code.visualstudio.com/docs/sourcecontrol/overview#_merge-conflicts).

4. **Push updates back to the project**: After all the merge conflicts are handled and you stage all the changes, you are ready to push the updates with `git push`.