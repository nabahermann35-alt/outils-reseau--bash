
#!/bin/bash

echo "*** Analyseur d'adresse IP du reseau local ***"

read -p "Entrer l'adresse reseau (ex: 192.168.10) : " adr_reseau
read -p "Entrer le debut de la plage : " debut_adr
read -p "Entrer la fin de la plage : " fin_adr

# Liste des ports a tester
ports=(22 80 443)

echo "Scan en cours de $adr_reseau.$debut_adr a $adr_reseau.$fin_adr"

compteur=0

for i in $(seq "$debut_adr" "$fin_adr"); do

    ip="$adr_reseau.$i"
    echo "Analyse de $ip ..."

    for port in "${ports[@]}"; do

        nc -z -w1 "$ip" "$port" 2>/dev/null
        resultat=$?

        if [ "$resultat" -eq 0 ]; then
            echo "Machine active : $ip | Port $port OUVERT"
            compteur=$((compteur + 1))
        else
            echo "Machine : $ip | Port $port FERME ou inaccessible"
        fi

    done

    sleep 0.2

done

echo "Nombre de ports ouverts : $compteur"
