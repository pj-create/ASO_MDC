#!/bin/bash

remotos="remotos.txt"
usuarios="usuarios.csv"

while read -r ip; do
        [[ -z "$ip" ]] && continue
        echo "copiando"

        scp "$usuarios" usuario@"$ip":/home/usuario/

        if [[ $? -eq 0 ]]; then
                echo "Copiado correctamente"
        else
                echo "fallo"
        fi

done < "$remotos"
