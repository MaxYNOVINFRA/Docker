# Déploiement de conteneurs simples via Portainer

# Accéder à l’interface Portainer

Ouvre ton navigateur pour accéder a portainer : 
Si il n'est pas installer, se rendre au dossier SWARM

Une fois installer rendez-vous sur sont URL : 

http://localhost:9000

Connecte-toi avec ton compte admin.

# Sélectionner l’environnement Docker
Sur la page d’accueil Portainer, clique sur ton environnement local Docker Swarm.

Tu arrives sur le tableau de bord du cluster.

![image](https://github.com/user-attachments/assets/2d0c40c8-f5fe-4188-8c20-cb4e09988604)


# Déployer un stack Wordpress + MariaDB
On va créer un petit WordPress complet.

Étape :

![image](https://github.com/user-attachments/assets/15d6d2d6-8f37-4c5d-929b-b3155057b3a1)

Dans le menu de gauche, clique sur Stacks.

Clique sur + Add stack.

Nom de la stack : wordpress et dans la zone Web editor, colle le fichier YAML (docker-compose-wordpress.yml) :

![image](https://github.com/user-attachments/assets/840acb78-6927-4477-a660-dc645a0ba108)

Ensuite on clique sur Deploy the stack.

et après quelque seconde on aura accès a notre wordpress le temps que le déploiement démarre.

http://localhost:8085

![image](https://github.com/user-attachments/assets/63beec18-45d2-4ccb-a122-c3ee523011ae)



# Déployer un conteneur Nginx simple

Nginx est un serveur web léger et rapide. Il sert principalement à publier des sites web statiques, faire du reverse proxy ou gérer la répartition de charge. Ici, il permet simplement de tester l’exposition d’un conteneur web.

Dans Containers, clique sur + Add container.

![image](https://github.com/user-attachments/assets/6988adea-ea84-451a-8ced-eac73b2cd6a8)

Nom : nginx-test

Image : nginx:latest

Publish a new network port :

host: 8086 et container: 80

![image](https://github.com/user-attachments/assets/851cf46d-5f90-4402-b33a-624cd2f9a698)

Clique sur Deploy the container pour le deployer.

Accède à Nginx : http://localhost:8086

![image](https://github.com/user-attachments/assets/35871960-1556-4dda-8714-175d70954b94)


# Déployer Adminer (interface base de données)

Adminer est un outil web qui sert à administrer facilement des bases de données (MySQL, MariaDB, PostgreSQL…). Il offre une interface simple pour exécuter des requêtes, créer des tables et gérer les utilisateurs.

C'est les mêmes procédé que le deployement de Ngix, il vous suffira seulement de modifier les champs suivant : 

- Nom : adminer
- Image : adminer:latest
- Publish port : host: 8087 et container: 8080

Clique sur Deploy the container.

# Accède à Adminer :

http://localhost:8087

![image](https://github.com/user-attachments/assets/140beb00-db8e-463a-85ae-02ccff582762)


# Vérifier le fonctionnement

Dans Portainer : on va dans Containers.

Et on vérifie que tous les conteneurs ont le statut Running.

![image](https://github.com/user-attachments/assets/739a9d4a-cac4-4ad3-af4a-620256614d12)

Si besoin, on peut cliquer sur les logs.
