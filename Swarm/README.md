README - Déploiement de Nextcloud avec Docker Swarm (mono-node)

# Objectif

Je souhaite déployer l'application Nextcloud à l'aide de Docker Swarm sur une machine unique (mono-node), en utilisant un fichier docker-compose.yml et la commande docker stack deploy.

# Prérequis

Docker doit être installé sur ma machine.

Je vérifie que Docker est bien installé avec :

`docker --version`

# Étape 1 : Initialisation du cluster Swarm

Je commence par initialiser Docker Swarm en tant que node manager (mono-node) :

`docker swarm init`

Docker m’indique que le Swarm est bien initialisé et que je suis maintenant manager du cluster.

# Étape 2 : Création du fichier docker-compose.yml

Je crée un dossier pour y mettre mon fichier de configuration :

`mkdir nextcloud-swarm`

`cd nextcloud-swarm`

Puis je crée le fichier :
Voir le fichier Docker-compose.yml
