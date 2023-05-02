#!/bin/bash

# Copyright 19.04.2023  s21genesiss@gmail.com
# Version 0.1
# Учебный скрипт для работы с bash.
# - Работа с условиями.  (https://www.opennet.ru/docs/RUS/bash_scripting_guide/x1673.html)
# Проверка скрипта на отсутствие и на наличие параметров
# Двойные скобки [[ ]] это ключевые слова, тогда как одинарные [] - это встроенная функция

# Проверка на пустой параметр
if [[ -z "$1" ]] 
then
  echo "Parameters are empty! Need 2 parametrs."
  exit 1
# Проверка на то что параметров больше 2
# $# - количество параметров переданных скрипту
elif [[ $# -gt 2 ]]
then
  echo "Too much parameters! Need 2 parametrs."
  exit 1
# Проверка на то что параметров меньше 2
elif [[ $# -lt 2 ]]
then
  echo "Too few parameters! Need 2 parametrs."
  exit 1
fi

exit 0