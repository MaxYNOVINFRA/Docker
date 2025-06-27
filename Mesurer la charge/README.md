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

![image](https://github.com/user-attachments/assets/62427080-513a-4e70-8f5a-b10c4096e0d8)


Étape 4 – Créer un hôte docker-agent dans Zabbix

Ouvrir l’interface Zabbix :

http://localhost:8090

Aller dans Configuration → Hosts.

![image](https://github.com/user-attachments/assets/3028fcc8-7b98-4dbb-91e2-e6e7507d2e12)


Cliquer sur Create host.

![image](https://github.com/user-attachments/assets/7ece0f1b-4629-4d7f-b13f-b1a8226e5f43)

Renseigner :

- Host name : docker-agent
- Groups : créer ou sélectionner Docker Services.
- Interfaces ->  Type : Agent / IP : de ton pc windows / Port : 10050

Ensuite sauvegarder.

Pourquoi j’utilise l’IP de ma machine Windows et non celle de Docker ?

Le Zabbix Agent tourne dans un conteneur Docker sur ma machine Windows. Docker Desktop expose ce conteneur sur un port (10050) accessible depuis l’extérieur via l’IP de l’hôte Windows. Ainsi, lorsque le serveur Zabbix se connecte à l’Agent, il passe par le réseau de la machine Windows, pas directement par une IP interne Docker. C’est pourquoi je renseigne l’IP locale de mon PC Windows (par exemple 192.168.x.x) dans la configuration de l’hôte Zabbix, pour que la communication fonctionne correctement.


# Étape 5 – Associer un Template pour collecter les métriques

Toujours dans l’hôte docker-agent, aller dans l’onglet Templates.

Chercher : Linux by Zabbix agent

![image](https://github.com/user-attachments/assets/b2c0fc46-c0fc-44fb-b814-5107ed15daee)

Cela active la collecte automatique de :

- CPU usage
- Memory usage
- Disk space
- Load average



# Étape 6 – Superviser cAdvisor avec un Web Scenario

Cette étape permet de vérifier que cAdvisor fonctionne.

🔹Créer un hôte cAdvisor

Remplir :

- Host name : cAdvisor
- Group : Docker Services
- Pas d’interface Agent nécessaire.


🔹 Créer le Web Scenario

Dans l’hôte cAdvisor, aller dans l’onglet Web scenarios.

Cliquer sur Create web scenario.

Remplir :

- Name : cAdvisor HTTP Check
- Update interval : 60 sec
- Dans Steps, cliquer Add : Name : Metrics / URL : http://host.docker.internal:8081/metrics / Required status codes : 200

Ce scénario vérifie que cAdvisor est bien accessible.

![image](https://github.com/user-attachments/assets/55852cb3-3bbb-48ff-8274-1ddd40af979e)
![image](https://github.com/user-attachments/assets/c6943836-995f-4316-a834-6d57496ad05c)



# Étape 7 – Vérifier la collecte des données

Dans l’interface Zabbix : Aller dans Monitoring → Latest data.

Filtrer par docker-agent, et on devraitvoir les valeurs de CPU, RAM et disque.

![image](https://github.com/user-attachments/assets/48a563f3-d85b-4432-9fbb-5d8f728b2344)


Filtrer par cAdvisor, et on devrait le résultat du Web Scenario.

![image](https://github.com/user-attachments/assets/4445cafe-ef35-4221-945a-2f1f2a8dc4bb)




1. La charge de votre instance Docker est supervisée.

2. cAdvisor est disponible.


Avec ces étapes, j’ai mesuré la charge de mon instance Docker via le Zabbix Agent et supervisé la disponibilité de cAdvisor avec un Web Scenario.

Cela permet de contrôler la santé du cluster Docker uniquement avec Zabbix, sans outil complémentaire.


