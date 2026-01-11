#!/bin/bash

SALIDA=$(echo -e "4\n" | ./menu.sh)

if [[ $SALIDA == *"Adiós"* ]]; then
	echo -e "[STOP]\t\tTEST OK"
else
	echo -e "[STOP]\t\tTEST FAILED"
	exit 1
fi

SALIDA=$(echo -e "1\n4\n" | ./menu.sh)

if [[ $SALIDA == *"Aqui tienes:"* ]]; then
	echo -e "[RESULTADO 1]\tTEST OK"
else
	echo -e "[RESULTADO 1]\tTEST FAILED"
	exit 1
fi

SALIDA=$(echo -e "2\n4\n" | ./menu.sh)

if [[ $SALIDA == *"Aqui tienes:"* ]]; then
        echo -e "[RESULTADO 2]\tTEST OK"
else
        echo -e "[RESULTADO 2]\tTEST FAILED"
        exit 1
fi

SALIDA=$(echo -e "3\n4\n" | ./menu.sh)

if [[ $SALIDA == *"Aqui tienes:"* ]]; then
        echo -e "[RESULTADO 3]\tTEST OK"
else
        echo -e "[RESULTADO 3]\tTEST FAILED"
        exit 1
fi
