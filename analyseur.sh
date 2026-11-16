#!/bin/bash
echo "***analyseur d'adresse IP du reseau local***"
read -p "entrer l'adresse reseau (ex:192.168.10) :" adr_reseau
read -p "entrer le debut de la plage :" debut_adr
read -p "entrer la fin de la plage :" fin_adr
read -p "entrer le port a tester( port par defaut=80) :" port
if [ -z "$port" ]; then
	port=80
fi
echo "scan en cours de $adr_reseau.$debut_adr a $adr_reseau.$fin_adr sur le port $port "

compteur=0

for i in $(seq "$debut_adr" "$fin_adr"); do 
	ip="$adr_reseau.$i"

nc -z -w1 "$ip" "$port" 2>/dev/null
resultat=$?

if [ $resultat -eq 0 ]; then
	echo "machine aactive :$ip"
	compteur=$((compteur + 1))
else
	echo "pas de reponse :$ip"
fi
sleep 0.2
done
echo "nombre de machine active :$compteur"	
