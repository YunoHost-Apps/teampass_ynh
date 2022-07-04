<!--
N.B.: This README was automatically generated by https://github.com/YunoHost/apps/tree/master/tools/README-generator
It shall NOT be edited by hand.
-->

# Teampass for YunoHost

[![Integration level](https://dash.yunohost.org/integration/teampass.svg)](https://dash.yunohost.org/appci/app/teampass) ![Working status](https://ci-apps.yunohost.org/ci/badges/teampass.status.svg) ![Maintenance status](https://ci-apps.yunohost.org/ci/badges/teampass.maintain.svg)  
[![Install Teampass with YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=teampass)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allows you to install Teampass quickly and simply on a YunoHost server.
If you don't have YunoHost, please consult [the guide](https://yunohost.org/#/install) to learn how to install it.*

## Overview

TeamPass is a Passwords Manager dedicated for managing passwords in a collaborative way by sharing them among team members.
Teampass offers a large set of features permitting to manage your passwords and related data in an organized way in respect to the access rights defined for each users.


**Shipped version:** 2.1.27.15~ynh3

## Screenshots

![Screenshot of Teampass](./doc/screenshots/screenshot.png)

## Disclaimers / important information

## Configuration

Use the admin panel of your teampass to configure this app.  
To find the admin panel, use the login 'admin' and the password choose during the installation.

## Documentation and resources

* Official app website: <http://www.teampass.net>
* Official admin documentation: <https://teampass.readthedocs.io/en/latest/>
* Upstream app code repository: <https://github.com/nilsteampassnet/TeamPass>
* YunoHost documentation for this app: <https://yunohost.org/app_teampass>
* Report a bug: <https://github.com/YunoHost-Apps/teampass_ynh/issues>

## Developer info

Please send your pull request to the [testing branch](https://github.com/YunoHost-Apps/teampass_ynh/tree/testing).

To try the testing branch, please proceed like that.

``` bash
sudo yunohost app install https://github.com/YunoHost-Apps/teampass_ynh/tree/testing --debug
or
sudo yunohost app upgrade teampass -u https://github.com/YunoHost-Apps/teampass_ynh/tree/testing --debug
```

**More info regarding app packaging:** <https://yunohost.org/packaging_apps>
