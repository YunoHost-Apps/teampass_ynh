# Teampass for YunoHost

[![Integration level](https://dash.yunohost.org/integration/teampass.svg)](https://dash.yunohost.org/appci/app/teampass)  
[![Install Teampass with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=teampass)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allow you to install teampass quickly and simply on a YunoHost server.  
If you don't have YunoHost, please see [here](https://yunohost.org/#/install) to know how to install and enjoy it.*

## Overview

TeamPass is a Passwords Manager dedicated for managing passwords in a collaborative way by sharing them among team members.  
Teampass offers a large set of features permitting to manage your passwords and related data in an organized way in respect to the access rights defined for each users.

**Shipped version:** 2.1.27.15

## Screenshots

![](https://teampass.net/images/portfolio/pf_tp_1.png)

## Demo

No demo available.

## Configuration

Use the admin panel of your teampass to configure this app.  
To find the admin panel, use the login 'admin' and the password choose during the installation.

## Documentation

 * Official documentation: https://teampass.readthedocs.io/en/latest/
 * YunoHost documentation: There no other documentations, feel free to contribute.

## YunoHost specific features

#### Multi-users support

Supported, with LDAP.

#### Supported architectures

* x86-64b - [![Build Status](https://ci-apps.yunohost.org/jenkins/job/teampass%20(Community)/badge/icon)](https://ci-apps.yunohost.org/jenkins/job/teampass%20(Community)/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/jenkins/job/teampass%20(Community)%20(%7EARM%7E)/badge/icon)](https://ci-apps-arm.yunohost.org/jenkins/job/teampass%20(Community)%20(%7EARM%7E)/)
* Jessie x86-64b - [![Build Status](https://ci-stretch.nohost.me/jenkins/job/teampass%20(Community)/badge/icon)](https://ci-stretch.nohost.me/jenkins/job/teampass%20(Community)/)

## Limitations

* **The upgrade script doesn't work from the version 2.1.26-3. A manual migration have to be done. For now we can't be sure that the upgrade script is going to work for the following upgrades.  
Be aware that the upgrade could be not smoothly.**

## Additionnal informations

## Links

 * Report a bug: https://github.com/YunoHost-Apps/teampass_ynh/issues
 * Teampass website: https://teampass.net/
 * YunoHost website: https://yunohost.org/

---

Developers infos
----------------

Please do your pull request to the [testing branch](https://github.com/YunoHost-Apps/teampass_ynh/tree/testing).

To try the testing branch, please proceed like that.
```
sudo yunohost app install https://github.com/YunoHost-Apps/teampass_ynh/tree/testing --verbose
or
sudo yunohost app upgrade teampass -u https://github.com/YunoHost-Apps/teampass_ynh/tree/testing --verbose
```
