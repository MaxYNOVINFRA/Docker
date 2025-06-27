# README - Déploiement de Uptime Kuma avec Docker Swarm (mono-node)

# Objectif

Je souhaite déployer Uptime Kuma, un outil de supervision moderne, dans mon cluster Docker Swarm mono-node, afin de monitorer la disponibilité de mes services (Nextcloud, Portainer, etc.).

# Prérequis

Docker doit être installé et fonctionnel.

Docker Swarm doit être initialisé.

Je vérifie Docker et Swarm :

`docker --version`

`docker info | grep Swarm`

Si Swarm n’est pas activé :

`docker swarm init`

# Étape 1 : Créer un répertoire de travail

`mkdir uptime-kuma-swarm`

`cd uptime-kuma-swarm`

# Étape 2 : Créer le fichier docker-compose.yml

Je crée le fichier :

`nano docker-compose.yml`

Puis je colle ce contenu : voir le fichier docker-compose.yml
