#!/bin/bash

source "scripts/test/base_test.sh"
SCRIPT="scripts/02_flow_control/04_menu_loop.sh"

test_case "fecha" \
        "echo -ne \"1\n\" | $SCRIPT" \
        "$(date)" \

test_case "usuario" \
        "echo -ne \"2\n\" | $SCRIPT" \
        "$(whoami)" \

test_case "pwd" \
        "echo -ne \"3\n\" | $SCRIPT" \
        "$(pwd)" \

test_case "salir" \
        "echo -ne \"4\n\" | $SCRIPT" \
        "Adiós" \
        0

summary || exit 1
