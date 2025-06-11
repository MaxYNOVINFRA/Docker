# Projet Docker - Application Flask (Débutant) - WINDOWS

Ce projet guide étape par étape la création d'une application web Flask conteneurisée avec Docker et orchestrée avec Docker Compose. Il est conçu pour les débutants.

# Étape 1 : Créer la structure du projet

Crée un nouveau dossier pour ton projet avec le terminal docker :
 
 - mkdir mon-projet-docker
- cd mon-projet-docker

Ce dossier contiendra tous les fichiers nécessaires.

# Étape 2 : Créer les fichiers de l'application

1. `app.py`

C'est le fichier principal de ton application Flask :

from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello depuis Docker !"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

2. `requirements.txt`

Ce fichier liste les dépendances Python à installer :

flask


# Étape 3 : Créer le Dockerfile

Le Dockerfile décrit comment construire l'image Docker :

FROM python:3.10

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD ["python", "app.py"]

# Étape 4 : Créer le fichier `docker-compose.yml`

Ce fichier permet de lancer facilement le conteneur :

version: '3.8'
services:
  web:
    build: .
    ports:
      - "5000:5000"


# Étape 5 : Lancer l'application

Dans le terminal, place-toi dans le dossier du projet, puis exécute :

docker-compose up


Tu devrais voir des logs de démarrage. Ouvre ensuite ton navigateur sur :

http://localhost:5000


Tu verras le message : **Hello depuis Docker !**


# Étape 6 : Arrêter l'application

Appuie sur `CTRL + C`, puis exécute :
docker-compose down

# Étape 7 : Nettoyage (facultatif)

Pour supprimer l'image Docker créée :


docker image ls        # pour voir les images
docker image rm nom_image
- Tu as créé un dossier avec tous les fichiers nécessaires
- Tu as écrit une application Flask simple
- Tu l'as conteneurisée avec Docker
- Tu l'as lancée avec Docker Compose

Ce projet est une base pour comprendre comment Docker fonctionne avec une app web Python.


# Étape 8 : Recharger l'application après une modification

Si tu modifies un fichier (comme `app.py`), tu dois **reconstruire le conteneur Docker** pour que les changements soient pris en compte.

Dans ton terminal, exécute ces deux commandes dans le dossier du projet :

- docker-compose down
- docker-compose up --build
