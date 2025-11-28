#!/bin/bash

SALIDA=$(echo -e "STOP\n" | ./mayoromenor.sh)

if [[ $SALIDA == *"Parado"* ]] ; then
	echo -e "[STOP]\t\tTEST FUNCIONAL"
else
	echo -e "[STOP]\t\tFALLO ENCONTRADO"
	exit 1
fi

SALIDA=$(echo -e "4\n5\nSTOP\n"
