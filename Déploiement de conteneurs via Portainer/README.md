# Déploiement de conteneurs simples via Portainer

# Accéder à l’interface Portainer

Ouvre ton navigateur pour accéder a portainer : 
Si il n'est pas installer, se rendre au dossier 

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


