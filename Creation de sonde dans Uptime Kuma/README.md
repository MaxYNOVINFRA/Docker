# Création de sondes (moniteurs) dans Uptime Kuma

# Objectif

Je souhaite créer des sondes (moniteurs) dans Uptime Kuma afin de surveiller la disponibilité des services déployés dans mon cluster Docker Swarm, comme Portainer, cAdvisor, WordPress et Adminer.

# Étape 1 : Accéder à l’interface Uptime Kuma

Je me rends dans mon navigateur à mon adresse : http://localhost:3001


# Étape 2 : Créer un nouveau moniteur (refaire cette etape avec tout les autres sondes ex : zabbix, wordpress, ect...)

Dans la barre de gauche, je clique sur le bouton + New Monitor.

![image](https://github.com/user-attachments/assets/fba4088f-dfed-47f7-a0f5-1c4b66984144)


Exemple de configuration pour Portainer : 

![image](https://github.com/user-attachments/assets/869b4ae8-a830-4e5d-a33b-ced461fd2c09)


# Étape 4 : Vérification des sondes

Après avoir créé les moniteurs :

Chaque service apparaît dans la liste avec son statut en direct (Up/Down).

Uptime Kuma teste automatiquement la disponibilité toutes les 60 secondes.

Si un service est indisponible, le statut devient rouge.


Pour vérifier un moniteur :

Cliquer sur le nom du moniteur.

Consulter l’historique et les logs des vérifications.


# Étape 5 : Ajouter un moniteur de type Ping

Je peux également ajouter une sonde Ping pour vérifier la réponse ICMP de ma machine Docker.

Exemple :

Type : Ping

Friendly Name : Ping Machine Docker

Hostname/IP : 192.168.x.x (l’IP réelle de ma machine)

Cela permet de surveiller la connectivité réseau.






Avec ces étapes, j’ai créé des sondes Uptime Kuma pour surveiller en temps réel mes services Docker Swarm et être alerté en cas d’indisponibilité.



















# Problème courant sur Windows et sa solution

1. Problème rencontré

Quand je crée une sonde avec l’URL http://127.0.0.1:9000 ou http://localhost:9000, j’obtiens l’erreur :

`connect ECONNREFUSED 127.0.0.1:9000`

![image](https://github.com/user-attachments/assets/d0e81125-f90f-4fb6-bb52-ab4900235930)

2. Cause

Dans Docker Desktop (Windows), localhost et 127.0.0.1 pointent vers le conteneur Uptime Kuma lui-même et non vers ma machine.

3. Solution

Je dois utiliser l’URL spéciale suivante : http://host.docker.internal:9000

Ainsi, Uptime Kuma peut joindre les services qui tournent sur mon hôte Windows.

Pour modifier un moniteur existant, il faut cliquer sur le nom du moniteur, pour remplacer l’URL par http://host.docker.internal:PORT.

![image](https://github.com/user-attachments/assets/47eed9d7-17f4-4317-8858-9086bdaeb825)



