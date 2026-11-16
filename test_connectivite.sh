#!/bin/bash

echo "***Outils de test de connectivite***"

read -p "Saisir une adresse ip ou nom de domaine a tester :" hote
read -p "le port a tester :" port
if [ -z "$port" ]; then
port=80
fi

echo "test de connection de $hote vers le port $port"

debut=$(date +%s%3N)

nc -z -w3 "$hote" "$port" 2>/dev/null
resultat=$?

fin=$(date +%s%3N)
temps_ms=$((fin - debut))

if [ $resultat -eq 0 ]; then
	echo "hote accessible et port $port ouvert"
	echo "temps de reponse : ${temps_ms} ms"
else
	echo "hote inaccessible ou port ferme sur $hote au port $port"
fi
