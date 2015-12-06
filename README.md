Teampass for YunoHost
==================

[Yunohost project](https://yunohost.org/#/)

Gestionnaire de mot de passe collaboratif.

http://www.teampass.net

Le script installe le paquet *php5-cli*.

Teampass peut-être configuré uniquement via le compte administrateur. Pour cela il faut s'identifier avec admin et le mot de passe choisi à l'installation.

Pour utiliser la fonction de sauvegarde automatique, il est nécessaire de mettre en place un cron contenant ceci dans /etc/cron.d/teampass:
```0 0 * * * www-data cd /var/www/teampass/backups && php script.backup.php```
