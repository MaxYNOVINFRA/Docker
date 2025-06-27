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



