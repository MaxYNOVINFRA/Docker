README - Déploiement de Zabbix avec Docker Swarm (mono-node)

# Objectif

Je souhaite déployer Zabbix, une plateforme de supervision complète, dans un cluster Docker Swarm mono-node. Zabbix permet de surveiller les performances de mon infrastructure (conteneurs, machines, services réseaux) avec alertes, dashboards, et collecte d'historiques.

# Prérequis

- Docker doit être installé sur ma machine.
- Docker Swarm doit être initialisé.
- Je dois avoir les droits administrateur
- Je vérifie que Docker et Swarm sont prêts :

`docker --version`

`docker info | grep Swarm`

Si Swarm n’est pas encore activé, je le fais avec :

`docker swarm init`

# Étape 1 : Création du répertoire de travail

`mkdir zabbix-swarm`

`cd zabbix-swarm`

# Étape 2 : Création du fichier docker-compose.yml

`nano docker-compose.yml`

Je colle le contenu suivant :
Voir fichier docker-compose.yml

Ce fichier définit :

- Une base de données MySQL
- Un serveur Zabbix
- Une interface web Zabbix (port 8082)

# Étape 3 : Déploiement de la stack

`docker stack deploy -c docker-compose.yml zabbix`

Je vérifie ensuite que tout est bien lancé :

`docker stack ls`

`docker stack services zabbix`

`docker stack ps zabbix`







# Étape 4 : Erreurs rencontrées

Au cours du déploiement de Zabbix, j’ai rencontré plusieurs erreurs que j’ai dû corriger. Voici un récapitulatif des problèmes rencontrés, des messages d’erreurs affichés et des solutions apportées.

1. Erreur 1 : "Unable to select configuration"

Cause : La base de données MySQL était accessible, mais les tables nécessaires n’étaient pas encore initialisées ou Zabbix ne parvenait pas à y accéder correctement.

Solution :

Vérifier que zabbix-server peut accéder à la base MySQL.

Supprimer la stack et le volume zabbix_zabbix_mysql, puis redéployer.

S’assurer que le conteneur zabbix-server a le temps d’attendre que MySQL soit prêt (update_config.delay).

- Erreur 2 : "the table 'dbversion' was not found"

Cause : La base zabbix existait, mais les tables n’avaient pas été créées automatiquement.

Solution :

S’assurer que le volume MySQL est bien supprimé avant redéploiement.

Ajouter des options de configuration à MySQL (--character-set-server=utf8 --collation-server=utf8_bin).

- Erreur 3 : "the 'users' table is empty"

- Cause : Le conteneur zabbix-server détecte que la base est vide, mais ne lance pas l’initialisation des tables.

Solution :

Vérifier les logs du service :

docker service logs zabbix_zabbix-server -f

Forcer la réinitialisation complète :

`docker stack rm zabbix`
`docker volume rm zabbix_zabbix_mysql`
`docker stack deploy -c docker-compose.yml zabbix`

# Résolution finale : Changer le port Web

J’ai finalement résolu le problème en changeant le port de l’interface web de Zabbix de 8090 (qui posait problème, il était déja utiliser tout bêtement...) à 8082, ce qui a permis un bon fonctionnement de l’accès.

ports:
  - "8082:8080"

Accès final à l’interface web : http://localhost:8082































# Étape 4 : Accès à l’interface Web

Je me rends sur l’URL suivante :

http://localhost:8082

Identifiants par défaut :

Login : Admin

Mot de passe : zabbix

Je configure ensuite les paramètres selon mes besoins (agents, hôtes, templates, etc.).
