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


# Étape 5 : Ajout d’un outil de supervision - Portainer

Pour aller plus loin dans la gestion de mes services, je vais également intégrer un outil de supervision : Portainer. Cet outil me permettra de visualiser et d'administrer facilement mes containers, stacks et volumes via une interface web intuitive.

Création du fichier docker-compose-portainer.yml

Je vais créer un nouveau fichier pour déployer Portainer dans une stack séparée :

Voir le fichier Docker-compose-portainer.yml

# Étape 6 : Déploiement de la stack Portainer

Je déploie maintenant Portainer dans une stack dédiée nommée portainer :

`docker stack deploy -c docker-compose-portainer.yml portainer`

![image](https://github.com/user-attachments/assets/7c2fd3db-8f5f-47e5-bd7f-df6705661948)

Accès à l’interface

Une fois le service lancé, je peux accéder à l’interface de Portainer dans mon navigateur à l’adresse suivante :

http://localhost:9000

Je configure ensuite un utilisateur administrateur et je choisis de gérer l’environnement Docker local.

![image](https://github.com/user-attachments/assets/a4e90537-3933-4ff9-9eb3-22fcdbe4ceae)

On peut visualiser Nextcloud sur Portainer dans les stacks : 

![image](https://github.com/user-attachments/assets/0a863503-709a-4ba0-90f6-0f05d9be6ffb)










