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

# Étape 3 : Déploiement de la stack

Je lance la stack Swarm en me plaçant dans le dossier contenant le fichier docker-compose.yml :

`docker stack deploy -c docker-compose.yml nextcloud`

![image](https://github.com/user-attachments/assets/1f62dce5-ef3a-465f-90cd-ac18fe10f984)


# Étape 4 : Vérification du déploiement

Je vérifie que la stack est bien en place avec les commandes suivantes :

`docker stack ls`

![image](https://github.com/user-attachments/assets/e097d2e6-2f19-4d3a-8068-48ea7561f3eb)


`docker stack services nextcloud`

![image](https://github.com/user-attachments/assets/8919d6d2-f230-444a-b6ed-f80f82380200)

`docker stack ps nextcloud`

![image](https://github.com/user-attachments/assets/cd517083-ba7d-4f59-91c3-32bd892ffdd4)

Je peux maintenant ouvrir un navigateur et accéder à Nextcloud via :

http://localhost:8080

Je devrais voir l’interface de configuration de Nextcloud.

![image](https://github.com/user-attachments/assets/77635a0e-1500-4cf4-ac99-6ceae156062d)

# Étape 5 : Nettoyage (optionnel)

Si je souhaite supprimer la stack :







