# README – Supervision de l’instance Docker avec Zabbix

# Objectif

Je souhaite mesurer la charge de mon instance Docker (CPU, RAM, disque) et vérifier que cAdvisor est disponible, en utilisant uniquement Zabbix.

Cette supervision me permet de contrôler la santé de mon environnement Docker et de détecter rapidement toute anomalie.

# Prérequis

Docker et Docker Swarm sont installés et configurés sur ma machine Windows.

Zabbix Server fonctionne déjà (par exemple sur localhost:8090).

cAdvisor est déjà déployé (port 8081).

# Étape 1 – Créer un dossier pour le Zabbix Agent

`mkdir zabbix-agent`

`cd zabbix-agent`


# Étape 2 – Créer le fichier docker-compose.yml

Je crée le fichier :

nano docker-compose.yml

Puis je colle le contenu suivant : voir le fichier docker-compose-zabbixagent.yml

Explications :

- ZBX_SERVER_HOST : nom du serveur Zabbix. Ici, host.docker.internal permet de contacter Zabbix Server depuis le conteneur.
- ZBX_HOSTNAME : nom affiché dans Zabbix.
- volumes : accès aux données système de l’hôte pour mesurer les ressources.


# Étape 3 – Déployer le Zabbix Agent

Je déploie le service avec :

`docker stack deploy -c docker-compose.yml zabbixagent`

![image](https://github.com/user-attachments/assets/d2919f83-2ec9-470b-8d2e-02fc74aeffa0)

Je vérifie que l’agent est bien lancé :

`docker stack services zabbixagent`








Étape 4 – Créer un hôte docker-agent dans Zabbix

Ouvrir l’interface Zabbix :

http://localhost:8090

Aller dans Configuration → Hosts.

Cliquer sur Create host.

Renseigner :

Host name : docker-agent

Groups : créer ou sélectionner Docker Services.

Interfaces :

Type : Agent

IP : host.docker.internal

Port : 10050

Sauvegarder.

✅ L’hôte est créé.

🔗 Étape 5 – Associer un Template pour collecter les métriques

Toujours dans l’hôte docker-agent, aller dans l’onglet Templates.

Cliquer sur Select.

Chercher :

Linux by Zabbix agent

Cliquer sur Add.

Sauvegarder.

✅ Cela active la collecte automatique de :

CPU usage

Memory usage

Disk space

Load average

🌐 Étape 6 – Superviser cAdvisor avec un Web Scenario

Cette étape permet de vérifier que cAdvisor fonctionne.

🔹 Créer un hôte cAdvisor

Configuration → Hosts.

Cliquer sur Create host.

Remplir :

Host name : cAdvisor

Group : Docker Services

Pas d’interface Agent nécessaire.

Sauvegarder.

🔹 Créer le Web Scenario

Dans l’hôte cAdvisor, aller dans l’onglet Web scenarios.

Cliquer sur Create web scenario.

Remplir :

Name : cAdvisor HTTP Check

Update interval : 60 sec

Dans Steps, cliquer Add :

Name : Metrics

URL : /metrics

Required status codes : 200

Variables :

URL (Host) :

http://host.docker.internal:8081

Sauvegarder.

✅ Ce scénario vérifie que cAdvisor est bien accessible.

📊 Étape 7 – Vérifier la collecte des données

Dans l’interface Zabbix :

Aller dans Monitoring → Latest data.

Filtrer par docker-agent.

Vous devez voir les valeurs de CPU, RAM et disque.

Filtrer par cAdvisor.

Vous devez voir le résultat du Web Scenario.

✅ Cela prouve que :

La charge de votre instance Docker est supervisée.

cAdvisor est disponible.

🧹 Étape 8 – Supprimer le Zabbix Agent si besoin

Si vous souhaitez supprimer l’agent :

docker stack rm zabbixagent

Le conteneur sera arrêté.

✅ Conclusion

Avec ces étapes, j’ai mesuré la charge de mon instance Docker via le Zabbix Agent et supervisé la disponibilité de cAdvisor avec un Web Scenario.

Cela permet de contrôler la santé du cluster Docker uniquement avec Zabbix, sans outil complémentaire.

Si je souhaite aller plus loin, je peux intégrer Prometheus ou écrire des scripts personnalisés pour importer les métriques détaillées de cAdvisor.


