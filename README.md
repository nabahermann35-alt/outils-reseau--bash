# Outils Réseau en Bash

Mini-projets d'administration et de diagnostic réseau développés sous Linux (Ubuntu) avec Bash et `netcat` (`nc`).

## 1. Testeur de connectivité TCP (`test_connectivite.sh`)
- Vérifie l'accessibilité d'une adresse IP ou d'un nom de domaine sur un port TCP (port `80` par défaut).
- Mesure et affiche le temps de réponse en millisecondes.

## 2. Analyseur d'adresses IP locales (`analyseur.sh`)
- Scanne une plage d'adresses IP sur un réseau local (LAN).
- Détecte les machines actives en testant les ports standards (`22`, `80`, `443`) et affiche les ports ouverts.

## Utilisation
```bash
chmod +x test_connectivite.sh analyseur.sh
./test_connectivite.sh
./analyseur.sh
```
