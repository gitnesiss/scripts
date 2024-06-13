#!/bin/bash

# Copyright 13.06.2023  s21genesiss@gmail.com
# Version 1.0
# Скрипт для настройки имени и почты в системе для гитхаба

if [[ -n $1 ]]
then
    git config --global user.name "$1"
    git config --global user.email "$1@gmail.com"
fi

exit 0