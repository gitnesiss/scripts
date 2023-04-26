#!/bin/bash

# Copyright 19.04.2023  s21genesiss@gmail.com
# Version 0.1
# Учебный скрипт для работы с bash.
# 
# Тут показаны три вида циклов которые можно использовать в работе


for (( i = 0; i < 10; i++ ))
do
    printf '%d\n' "$i"
done

# Бесконечный цикл
#for ((;;))
#do
#    printf 'forever'
#done


# Цикл будет перебирать парметры командной строки скрипта $1, $2, $3, ...
# Например для этого цикла можно ввести: "./main.sh -c 17 core"
for value
do
    echo "$value"
    # Тут можно что-то делать со значением value
done


# Если верхний цикл переместить в функцию, то он будет перебирать параметры переданные в функцию, а не в скрипт
function Listen {
    for arg
    do
        echo "arg to func: '$arg'"
    done
    echo "Inside func: \$0 is still: '$0'"
}
Listen


exit 0