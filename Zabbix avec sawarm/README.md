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

# Étape 4 : Accès à l’interface Web

Je me rends sur l’URL suivante :

http://localhost:8082

Identifiants par défaut :

Login : Admin

Mot de passe : zabbix

Je configure ensuite les paramètres selon mes besoins (agents, hôtes, templates, etc.).
