Teampass for YunoHost
==================

**Ce package n'est pas pleinement fonctionnel. Lisez bien ce qui suit avant de l'installer...**

[Yunohost project](https://yunohost.org/#/)

Gestionnaire de mot de passe collaboratif.

http://www.teampass.net

Teampass peut être configuré uniquement via le compte administrateur. Pour cela il faut s'identifier avec admin et le mot de passe choisi à l'installation.

Pour utiliser la fonction de sauvegarde automatique, il est nécessaire de mettre en place un cron contenant ceci dans /etc/cron.d/teampass:
```0 0 * * * www-data cd /var/www/teampass/backups && php script.backup.php```

**Mise à jour du package:**
sudo yunohost app upgrade teampass -u https://github.com/YunoHost-Apps/teampass_ynh

**Multi-utilisateur:** Oui, avec support ldap.

**Voir l'état du package:**  
~*[Dernier rapport hebdomadaire](https://forum.yunohost.org/t/rapport-hebdomadaire-dintegration-continue/2297)*~  
~*[Dernier test d'intégration continue](https://ci-apps.yunohost.org/jenkins/job/teampass%20%28Community%29/lastBuild/consoleFull)*~

---

> *Depuis la mise à jour 2.1.26-3, le support ldap est cassé. Mais des corrections de bug justifient un changement de version.*  
*Les utilisateurs sont dans la base de données de teampass, mais le mot est généré aléatoirement et devra être réinitialisé pour chaque utilisateur souhaitant utiliser l'application*  
*Pour la première connexion, utiliser l'accès admin, avec le login 'admin' et le mot de passe renseigné à l'installation.*

> *les mails ne fonctionne pas non plus, donc impossible d'utiliser la fonction 'Mot de passe oublié'.*  
*Je pense que Teampass n'est toujours pas prêt... Le sera-t-il un jour ...?*
