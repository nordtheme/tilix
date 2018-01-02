<p align="center"><img src="https://cdn.rawgit.com/arcticicestudio/nord-tilix/develop/src/assets/nord-tilix-banner.svg"/></p>

<p align="center"><img src="https://cdn.travis-ci.org/images/favicon-c566132d45ab1a9bcae64d8d90e4378a.svg" width=24 height=24/> <a href="https://travis-ci.org/arcticicestudio/nord-tilix"><img src="https://img.shields.io/travis/arcticicestudio/nord-tilix/develop.svg"/></a> <img src="https://circleci.com/favicon.ico" width=24 height=24/> <a href="https://circleci.com/gh/arcticicestudio/nord-tilix"><img src="https://circleci.com/gh/arcticicestudio/nord-tilix.svg?style=shield&circle-token=eaf4cf0919257aeeb77fde037ea2274a9524d6b4"/></a> <img src="https://assets-cdn.github.com/favicon.ico" width=24 height=24/> <a href="https://github.com/arcticicestudio/nord-tilix/releases/latest"><img src="https://img.shields.io/github/release/arcticicestudio/nord-tilix.svg"/></a> <a href="https://github.com/arcticicestudio/nord/releases/tag/v0.2.0"><img src="https://img.shields.io/badge/Nord-v0.2.0-88C0D0.svg"/></a> <a href="https://gnunn1.github.io/tilix-web"><img src="https://img.shields.io/badge/Tilix-v1.5.0+-4C566A.svg"/></a></p>

<p align="center">An arctic, north-bluish clean and elegant <a href="https://gnunn1.github.io/tilix-web">Tilix</a> color scheme.</p>

<p align="center">Designed for a fluent and clear workflow.<br>
Based on the <a href="https://github.com/arcticicestudio/nord">Nord</a> color palette.</p>

---

<p align="center"><img src="https://raw.githubusercontent.com/arcticicestudio/nord-tilix/develop/src/assets/scrot-colortest.png"/><blockquote>Font: <a href="https://adobe-fonts.github.io/source-code-pro">Source Code Pro</a> 12px.</blockquote></p>

## Getting started
### Installation
#### Manual
Copy the [`nord.json`](https://github.com/arcticicestudio/nord-tilix/blob/develop/src/json/nord.json) file to the color schemes directory according to the desired installation type.

Local: `~/.config/tilix/schemes`  
Global: `/usr/share/tilix/schemes`

#### Install Script
The included `install.sh` shell script can be used for an automated installation.  
If no option is specified, the default installion type is local and the scheme file is `src/json/nord.json`.

A list of available options can be shown with the `--help` option.
```shell
./install.sh --help
```
Syntax: `install.sh [OPTIONS]`

| Option | Description |
| --- | --- |
| `-h`, `--help` | Shows the help |
| `-v`, `--verbose` | Verbose output |
| `-g`, `--global` | Install  global |
| `-s  <SCHEME_FILE>`, `--schemefile <SCHEME_FILE>` | Use the specified scheme file |

**Note**: The global installation requires root privileges via `sudo`!

### Activation
  1. Open your profile preferences
  2. Switch to the *Color* tab
  3. Select `Nord` from the *Color scheme* drop-down menu

## Screenshots
<p align="center"><strong>htop</strong><br><img src="https://raw.githubusercontent.com/arcticicestudio/nord-tilix/develop/src/assets/scrot-htop.png"/></p>

<p align="center"><strong>Advanced Color Settings</strong><br><img src="https://raw.githubusercontent.com/arcticicestudio/nord-tilix/develop/src/assets/scrot-feature-advanced-settings.png"/><br><strong>Badges</strong><br><img src="https://raw.githubusercontent.com/arcticicestudio/nord-tilix/develop/src/assets/scrot-feature-advanced-settings-badges.png"/></p>

## Development
[![](https://img.shields.io/badge/Changelog-0.3.0-81A1C1.svg)](https://github.com/arcticicestudio/nord-tilix/blob/v0.3.0/CHANGELOG.md) [![](https://img.shields.io/badge/Workflow-gitflow--branching--model-81A1C1.svg)](http://nvie.com/posts/a-successful-git-branching-model) [![](https://img.shields.io/badge/Versioning-ArcVer_0.8.0-81A1C1.svg)](https://github.com/arcticicestudio/arcver)

Continuous integration builds are running at [Travis-CI](https://travis-ci.org/arcticicestudio/nord-tilix) and [Circle CI](https://circleci.com/bb/arcticicestudio/nord-tilix).

### Contribution
Please report issues/bugs, feature requests and suggestions for improvements to the [issue tracker](https://github.com/arcticicestudio/nord-tilix/issues).

<p align="center"><img src="https://cdn.rawgit.com/arcticicestudio/nord/develop/src/assets/banner-footer-mountains.svg" /></p>

<p align="center">Copyright &copy; 2016-present Arctic Ice Studio</p>

<p align="center"><a href="https://github.com/arcticicestudio/nord-tilix/blob/develop/LICENSE.md"><img src="https://img.shields.io/badge/License-MIT-5E81AC.svg?style=flat-square"/></a> <a href="https://creativecommons.org/licenses/by-sa/4.0"><img src="https://img.shields.io/badge/License-CC_BY--SA_4.0-5E81AC.svg?style=flat-square"/></a></p>
