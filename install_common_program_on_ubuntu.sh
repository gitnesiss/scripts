#!/bin/bash

# Copyright 20.04.2023  s21genesiss@gmail.com
# Version 1.0
# Скрипт для установки базовых программ для ubuntu
# Изменение 13.06.2024

USERNAME=$(whoami)
SYS_NAME=$(uname)

# 1. Chrome
# Для установки Google Chrome вам нужно будет загрузить ключ репозитория, добавить сам репозиторий и обновить список пакетов: 
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update -y
# Установка google Chrome
sudo apt-get install google-chrome-stable

# 2. GIT
# Установка git
sudo apt install git -y
# Настройка логина и электронной почты при условии что они указаны в качестве аргумента при запуске скрипта
# -z   строка пустая, т.е. имеет нулевую длину
# -n   строка не пустая
if [[ -n $1 ]]
then
    git config --global user.name "$1"
    git config --global user.email "$1@gmail.com"
fi

# 3. Генерация ключей для соединения с git.
# Генерация SSH ключа в формате ed25519 
ssh-keygen -t ed25519
# Вывод на экран ключа для возможности его копирования и просмотра в Linux.
cat /home/$USERNAME/.ssh/id_ed25519.pub
# Вывод на экран ключа для возможности его копирования и просмотра в Windows.
cat C:/Users/$USERNAME/.ssh/id_ed25519.pub
echo "Вставьте выше выведенную строку в настройки доступа к github."

exit 0