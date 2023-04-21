#!/bin/bash

# Copyright 20.04.2023  s21genesiss@gmail.com
# Version 1.0
# Скрипт для создания файлов *.sql на бассейне SQL
# Скрипт создаёт файлы *.sql и раскладывает их по папкам, названия которых соответствует номереру упражнения.
#
# Скрипт должен иметь два аргумента:
#    $1 - аргумент, обозначающий номер дня (нумерация дня идёт с 00)
#    $2 - аргумент, обозначающий количество заданий (нумерация идёт с задания 00)


# Проверка на отсутствие аргументов
if [[ -z "$1" ]] 
then
  echo "Отсутствуют аргументы! Нужно 2 аргумента. 1-ый - номер дня. 2-ой - количество заданий."
  exit 1
# Проверка на то что аргументов больше 2
# $# - количество аргументов переданных скрипту
elif [[ $# -gt 2 ]]
then
  echo "Введено больше двух аргументов! Нужно 2 аргумента. 1-ый - номер дня. 2-ой - количество заданий."
  exit 1
# Проверка на то что аргументов меньше 2
elif [[ $# -lt 2 ]]
then
  echo "Введено меньше двух аргументов! Нужно 2 аргумента. 1-ый - номер дня. 2-ой - количество заданий."
  exit 1
fi

# Проверка на то что оба аргумента числа
if [[ $1 =~ [^0-9]+ ]] || [[ $2 =~ [^0-9]+ ]]
then
    echo "Один из параметров не является числом."
    exit 1
fi

DIR_START=$(pwd)

for (( i = 0; i < $2; i++ ))
do
    DIR_TEMP=$(printf "ex%02d" "$i")
    mkdir $DIR_TEMP
    cd $DIR_TEMP
    touch $(printf "day%02d_ex%02d.sql" "$1" "$i")
    cd $DIR_START
done