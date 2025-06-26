# Script PowerShell : Mise en place d'un cluster Kubernetes avec Dashboard

# Installation via Chocolatey (si non installé, aller sur https://chocolatey.org/install)
choco install minikube -y
choco install kubernetes-cli -y

# Démarrage du cluster Minikube avec Docker comme driver
minikube start --driver=docker

# Vérification du nœud Kubernetes
kubectl get nodes

# Lancement du Dashboard Kubernetes
Start-Process powershell -ArgumentList "minikube dashboard"

# Déploiement d'un serveur web simple (NGINX)
kubectl create deployment prod-aix --image=nginx

# Vérification que le pod est bien lancé
kubectl get pods

# Exposition du déploiement en NodePort (accessible en local)
kubectl expose deployment mon-site --type=NodePort --port=80

# Récupération de l'URL pour accéder au service depuis le navigateur
$serviceUrl = minikube service prod-aix --url
Write-Output "Accédez à votre site ici : $serviceUrl"
