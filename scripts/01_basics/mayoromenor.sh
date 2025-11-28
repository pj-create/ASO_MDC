#!/bin/bash

NUM1=0
NUM2=0

read -p “Primer numero: “ NUM1
read -p “Segundo numero: “ NUM2

if (( $NUM1 < NUM2 )); then
	echo “El mas grande es el $NUM2”
else
	echo “El mas grande es el $NUM1”
fi
