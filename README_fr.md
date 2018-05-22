# Teampass pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/teampass.svg)](https://dash.yunohost.org/appci/app/teampass)  
[![Installer Teampass avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=teampass)

*[Read this readme in english.](./README.md)*

> *Ce package vous permet d'installer teampass rapidement et simplement sur un serveur YunoHost.  
Si vous n'avez pas YunoHost, merci de regarder [ici](https://yunohost.org/#/install_fr) pour savoir comment l'installer et en profiter.*

## Résumé

TeamPass est un gestionnaire de mots de passe dédié à la gestion collaborative des mots de passe en les partageant entre les membres de l'équipe.
Teampass offre un large éventail de fonctionnalités permettant de gérer vos mots de passe et données associées de manière organisée dans le respect des droits d'accès définis pour chaque utilisateur.

**Version embarquée:** 2.1.27.15

## Captures d'écran

![](https://teampass.net/images/portfolio/pf_tp_1.png)

## Demo

Pas de démo disponible.

## Configuration

Utilisez le panel admin de votre teampass pour configurer cette app.  
Pour trouver le panel admin, utiliser le login 'admin' et le mot de passe choisi durant l'installation.

## Documentation

 * Documentation officielle: https://teampass.readthedocs.io/en/latest/
 * Documentation YunoHost: Il n'y a pas d'autre documentation, n'hésitez pas à contribuer.

## Fonctionnalités spécifiques à YunoHost

#### Support multi-utilisateurs

Supportée, avec LDAP.

#### Architectures supportées.

* x86-64b - [![Build Status](https://ci-apps.yunohost.org/jenkins/job/teampass%20(Community)/badge/icon)](https://ci-apps.yunohost.org/jenkins/job/teampass%20(Community)/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/jenkins/job/teampass%20(Community)%20(%7EARM%7E)/badge/icon)](https://ci-apps-arm.yunohost.org/jenkins/job/teampass%20(Community)%20(%7EARM%7E)/)

## Limitations

* **Le script de mise à jour ne fonctionne pas depuis la version 2.1.26-3. Une migration manuelle doit être effectuée. Pour l'instant, nous ne pouvons pas être sûrs que le script d'upgrade va fonctionner pour les mises à jour suivantes.  
Sachez que la mise à niveau pourrait ne pas se faire sans difficultés.**

## Informations additionnelles

## Liens

 * Reporter un bug: https://github.com/YunoHost-Apps/teampass_ynh/issues
 * Site de teampass: https://teampass.net/
 * Site de YunoHost: https://yunohost.org/

---

Informations à l'intention des développeurs
----------------

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/teampass_ynh/tree/testing).

Pour tester la branche testing, merci de procéder ainsi.
```
sudo yunohost app install https://github.com/YunoHost-Apps/teampass_ynh/tree/testing --verbose
ou
sudo yunohost app upgrade teampass -u https://github.com/YunoHost-Apps/teampass_ynh/tree/testing --verbose
```
