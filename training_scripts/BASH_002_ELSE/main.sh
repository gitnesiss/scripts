#!/bin/bash

# Copyright 19.04.2023  s21genesiss@gmail.com
# Version 0.1
# Учебный скрипт для работы с bash.
# - В переменную заносится результат работы команды.
# - Работа с условиями.  (https://www.opennet.ru/docs/RUS/bash_scripting_guide/x1673.html)
# Скрипту в качестве первого аргумента можно назначить команду "pwd",
#    тогда он перейдёт в каталог и покажет список содержащихся там файлов.
# Если оставить скрипт без первого аргумента, то скрипт покажет содержание
#    текущего каталога.

if [[ -z $1 ]]
then
    DIR=""
else
    DIR=$($1)"/trash"
fi

# -z   строка пустая, т.е. имеет нулевую длину
# -n   строка не пустая

[[ -z "$DIR" ]] || cd "$DIR"
echo "Выполняется первая часть условия если \$DIR пустой: [[ -z \"\$DIR\" ]]"
echo "Выполняется вторая часть условия если \$DIR не пустой: сd \"\$DIR\""
ls -la

echo
echo "--------------------"
echo

if [[ -z "$DIR" ]] 
then
    :
    echo "Строка пустая. Двоеточие \":\", в коде, означает пустую инструкцию, которая ничего не делает."
else
    echo "Строка не пустая: $DIR"
fi

exit 0