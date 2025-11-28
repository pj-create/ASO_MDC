#!/bin/bash

source "scripts/test/base_test.sh"
SCRIPT="scripts/02_flow_control/03_case_menu.sh"

test_case "fecha" \
        "echo -ne \"1\n\" | $SCRIPT" \
        "$(date)" \
        0

test_case "mostrarusuario" \
        "echo -ne \"2\n\" | $SCRIPT" \
        "$(whoami)" \
        0

test_case "mensaje_despedida" \
        "echo -ne \"1\n\" | $SCRIPT" \
        "Adiós" \
        0

summary || exit 1
