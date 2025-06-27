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
