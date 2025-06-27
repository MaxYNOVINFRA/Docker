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


Étape 3 : Déployer la stack

Dans le dossier, je lance la commande :

`docker stack deploy -c docker-compose.yml uptimekuma`

![image](https://github.com/user-attachments/assets/a1aeec2c-e47c-48fc-8870-ca3b4f303d37)

# Étape 4 : Vérifier le déploiement

Je vérifie que le service est bien démarré :

`docker stack services uptimekuma`

Je dois voir :

uptimekuma_uptime-kuma   replicated   1/1

![image](https://github.com/user-attachments/assets/1b5cd5f3-3fb5-43f4-8667-af939ac12917)

# Étape 5 : Accéder à l’interface web

Je me rends dans mon navigateur sur :

http://localhost:3001

La page d’installation d’Uptime Kuma apparaît. Je crée mon utilisateur administrateur.

![image](https://github.com/user-attachments/assets/092a314d-2e9f-46bc-b18f-19e739f77975)

# Étape 6 : Configuration initiale

Après la création du compte :

Je peux ajouter des checks HTTP(S), ping, TCP, etc.

Exemple : ajouter un check HTTP sur Nextcloud :

URL : http://host.docker.internal:8080

Intervalle : 60s


