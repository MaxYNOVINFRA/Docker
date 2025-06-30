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

Ce fichier définit :

- L'image officielle de cAdvisor.
- L'exposition du service sur le port 8081.
- Les volumes montés pour accéder aux informations système nécessaires à la collecte des métriques.
- Le mode de déploiement replicated avec une seule réplique.

# Étape 3 : Déploiement de la stack Docker Swarm

Je déploie la stack nommée monitoring :

`docker stack deploy -c docker-compose.yml monitoring`

Docker va créer un service cadvisor dans la stack monitoring.

![image](https://github.com/user-attachments/assets/5809434d-fa88-474e-ba06-d52965309daf)


# Étape 4 : Vérification du déploiement

Je m'assure que le service est bien lancé avec les commandes suivantes :

`docker stack ls`

![image](https://github.com/user-attachments/assets/af13a90d-9091-4e3e-b60e-a68134c874c6)

`docker stack services monitoring`

![image](https://github.com/user-attachments/assets/3d85583a-bf1c-42b7-a7c7-8833ecd3170b)


`docker stack ps monitoring`

![image](https://github.com/user-attachments/assets/840a3843-824b-45e7-bd85-7906458b2a68)

Étape 5 : Accéder à l’interface web de cAdvisor

Je peux accéder à l’interface cAdvisor via mon navigateur à l’adresse suivante :

http://localhost:8081

![image](https://github.com/user-attachments/assets/85833c21-811d-416e-8e13-9e7b8aac9df3)


L’interface affiche :

La liste des conteneurs actifs

L’utilisation CPU et mémoire de chaque conteneur

Les lectures/écritures disque

Les entrées/sorties réseau

Des graphes de performance en temps réel


![image](https://github.com/user-attachments/assets/fc18adf9-6806-4e13-b16d-dc09f74069cd)
![image](https://github.com/user-attachments/assets/7f168dc3-7d2f-415a-8cd3-d985b15f8e7f)

# Erreur rencontrer

3 jours après l'installation du conteneur Cadvisor, il a cessé de démarrer. L'interface web est devenue inaccessible et l'erreur suivante est survenue :

![image](https://github.com/user-attachments/assets/d44e599a-bbc7-4d00-b11e-8e276d877457)

![image](https://github.com/user-attachments/assets/f2e7cc97-332d-4a67-90f5-99fd46ae671e)


La solution consiste simplement à relancer le déploiement à l'aide du fichier docker-compose.yml. 

`docker stack deploy -c docker-compose.yml monitoring`

Après le redéploiement, le conteneur a redémarré correctement et l'accès à l'interface web a été rétabli.

![image](https://github.com/user-attachments/assets/289ff31e-1c10-43dd-a362-35bf17657224)





