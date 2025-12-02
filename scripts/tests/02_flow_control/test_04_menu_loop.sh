#!/bin/bash

source "scripts/tests/base_test.sh"
SCRIPT="scripts/02_flow_control/04_menu_loop.sh"

test_case "fecha actual" \
        "echo -ne \"1\n4\n\" | $SCRIPT" \
        "*$(date).*" \
	0

test_case "nombre de usuario actual" \
        "echo -ne \"2\n4\n\" | $SCRIPT" \
        "*$(whoami)*" \
	0

test_case "nombre del directorio actual" \
        "echo -ne \"3\n4\" | $SCRIPT" \
        "*$(pwd)*" \
        0

test_case "salir" \
        "echo -ne \"4\n\" | $SCRIPT" \
        "*Adiós*" \
        0

test_case "en otro caso" \
        "echo -ne \"5\n4\n\" | $SCRIPT" \
        "*Opción no válida*" \
        0

summary || exit 1
