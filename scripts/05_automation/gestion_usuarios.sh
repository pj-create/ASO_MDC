#!/bin/bash
usuarioscsv=./usuarios.csv
gestionlog=/var/log/gestion_usuarios.log

log() {
        echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$gestionlog"
}

[ ! -f "$usuarioscsv" ] && { echo "ERROR: No existe $usuarioscsv"; exit 1; }

while IFS=',' read -r usuario grupo operacion; do #se indica que el separador es una coma
        usuario=$(echo "$usuario" | xargs)
        grupo=$(echo "$grupo" | xargs)
        operacion=$(echo "$operacion" | xargs) #xargs sirve para leer datos de la entrada estándar y los convierte en comandos, por eso esta aqui

        case "$operacion" in
                add)
                        if id "$usuario" &>/dev/null; then
                        echo "ignorado: ya existe ese usuario"
                        continue
                        fi

                        if ! getent group "$grupo" >/dev/null; then #getent group obtiene la lista de grupos (si fuera getent passwd listaria los usuarios)
                          groupadd "$grupo"
                        fi

                        useradd -m "$usuario" -g "$grupo"
                        echo "$usuario:1234" | chpasswd 
                        log "add - usuario añadido en $grupo"
                        if $? -eq 0 ; then
                                echo "Usuario añadido"
                        else
                                echo "Fallo al crear el usuario"
                        fi
                        ;;

                rm)

                        if ! id "$usuario" &>/dev/null; then
                                log "No existe el usuario"
                                continue
                        fi

                        if passwd -S "$usuario" 2>/dev/null | awk '{print $2}' | grep -q "^L$"; then
                                echo "Usuario ya bloqueado"
                                continue
                        fi

                        passwd -l "$usuario"
                        log "rm - usuario bloqueado"
                        echo "$usuario bloqueado"

                        directoriohome=$(getent passwd "$usuario" | cut -d: -f6)

                        mkdir -p /home/.eliminados

                        if [ -d "$directoriohome" ]; then
                                mv "$directoriohome" "/home/.eliminados/$usuario"
                                log "rm - home de $usuario movido a /home/.eliminados"
                                echo "comprobado que se ha movido"
                        else
                                echo "no existe el home"
                        fi
                        ;;
                *)
                        echo "Opción no válida"
                        ;;
                esac
done < "$usuarioscsv"
