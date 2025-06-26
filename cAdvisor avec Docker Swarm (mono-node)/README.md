# Swarm (mono-node)

# Objectif

Je souhaite déployer cAdvisor, un outil de supervision développé par Google, dans un cluster Docker Swarm mono-node afin de collecter et visualiser les métriques en temps réel de mes conteneurs : utilisation CPU, mémoire, disque et réseau.

# Prérequis

Docker doit être installé sur ma machine.

Docker Swarm doit être initialisé.

Je dois avoir les droits administrateur sur la machine.

Et je vérifie que Docker Swarm est bien initialisé :

`docker info | grep Swarm`

S’il n’est pas encore actif, je l’active avec :

`docker swarm init`

# Étape 1 : Création d’un répertoire de travail

Je commence par créer un nouveau répertoire dédié au service cAdvisor :

`mkdir cadvisor-swarm`

`cd cadvisor-swarm`

# Étape 2 : Création du fichier docker-compose.yml

Je crée le fichier de configuration nécessaire pour déployer cAdvisor avec Docker Swarm :

`nano docker-compose.yml`

Je colle le contenu suivant :

Voir le fichier : docker-compose.yml
