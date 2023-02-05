#!/bin/bash

# Copyright 05.02.2023  s21genesiss@gmail.com
# Version 0.1
# Скрипт для очистки памяти на компьютере.

INFO_SHOW=1

while :
do
    if [[ $INFO_SHOW -eq 1 ]]
    then
        echo "Общая информация о памяти в системе:"
        free -m
        echo
        echo "Память используемая под кэш:"
        sudo du -sh /var/cache/apt
        echo
        echo "Память занятая логами системных журналов:"
        sudo journalctl --disk-usage
    fi
    INFO_SHOW=0
    echo "Вы хотите очистить память?"
    echo
    echo "0 - Посмотреть информацию о памяти"
    echo "1 - Очистить логи системных журналов   2 - Очистить память занятую эскизами"
    echo "y - Очистить все доступные места       q - Ничего не очищать и выйти"
    read answer  #сюда записывается ответ

    # Очистка всех доступных мест
    if [[ $answer = "y" || $answer = "Y" ]]
        then
        echo
        sudo journalctl --vacuum-time=3d
        rm -rf ~/.cache/thumbnails/*
        echo "Очищаю все доступные места."

    # Посмотреть информацию по свободной/занятой памяти
    elif [[ $answer = 0 ]]
        then
        echo
        echo "Посмотреть память."
        INFO_SHOW=1
    
    # Очистка логов системных журналов
    elif [[ $answer = 1 ]]
        then
        echo
        echo "Память занятая логами системных журналов:"
        sudo journalctl --disk-usage
        while :
        do
            echo
            echo "Очиcтить логи системных журналов старше 3 дней? [y/n]"
            read answer_clear_log_journal
            if [[ $answer_clear_log_journal = "y" || $answer_clear_log_journal = "Y" ]]
            then
                echo
                sudo journalctl --vacuum-time=3d
                echo "Очищаю логи системных журналов."
                echo "Логи системных журналов очищены."
                break
            elif [[ $answer_clear_log_journal = "n" || $answer_clear_log_journal = "N" ]]
            then
                echo
                echo "Очистка логов системных журналов отменена."
                break
            fi
        done

    # Очистка памяти (кэш) занятой эскизами
    elif [[ $answer = 2 ]]
        then
        echo
        echo "Объём памяти (кэш) занятый эскизами:"
        du -sh ~/.cache/thumbnails
        while :
        do
            echo
            echo "Очиcтить память (кэш) занятую эскизами? [y/n]"
            read answer_clear_scketch
            if [[ $answer_clear_scketch = "y" || $answer_clear_scketch = "Y" ]]
            then
                echo
                rm -rf ~/.cache/thumbnails/*
                echo "Очищаю память от эскизов."
                echo "Память от эскизов очищена."
                break
            elif [[ $answer_clear_scketch = "n" || $answer_clear_scketch = "N" ]]
            then
                echo
                echo "Очиcтка памяти (кэш) занятой эскизами отменена."
                break
            fi
        done
        
    # всё кроме вышеописанных выборов
    else
        echo
        echo "Выбрано: ничего не очищать."
        exit 0
    fi
done