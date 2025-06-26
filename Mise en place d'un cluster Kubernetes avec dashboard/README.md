# Mise en place d'un cluster Kubernetes avec Dashboard

# Objectif

Installation d’un cluster Kubernetes local sur un PC Windows, en utilisant Minikube, Docker Desktop, et déploiement d’un service web simple accessible via un navigateur.

# Préparation de l’environnement

Vérification de Docker Desktop installé et fonctionnel.

Installation des outils via PowerShell :

`choco install minikube -y`

`choco install kubernetes-cli -y`

Minikube : pour créer un cluster Kubernetes local

kubectl : pour interagir avec Kubernetes via la ligne de commande

Vérification du bon fonctionnement des outils.

# Lancement du cluster Kubernetes

Démarrage du cluster avec le driver Docker :

`minikube start --driver=docker`

Vérification que le nœud est actif :

`kubectl get nodes`

# Accès au Dashboard Kubernetes

Lancement de l’interface graphique :

`minikube dashboard`

Une page web s’ouvre pour visualiser les ressources du cluster (pods, services, déploiements…).

![image](https://github.com/user-attachments/assets/38f22c61-358e-4774-bdca-2014701f1688)

# Déploiement d’un site web simple (NGINX)

Création du déploiement :

`kubectl create deployment prod-aix --image=nginx`

Vérification du pod :

`kubectl get pods`

Exposition du service via NodePort :

`kubectl expose deployment mon-site --type=NodePort --port=80`

Récupération de l’URL d’accès :

`minikube service prod-aix --url`

Affichage de la page d’accueil NGINX dans le navigateur.

# Visualisation dans le Dashboard

Pod correspondant au déploiement NGINX

Service NodePort exposant le pod

Logs, état de santé, détails du conteneur visibles

# Résultat

Un cluster Kubernetes local fonctionnel, un service web accessible et visualisable via le Dashboard.


