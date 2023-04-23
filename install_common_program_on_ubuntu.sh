#!/bin/bash

# Copyright 20.04.2023  s21genesiss@gmail.com
# Version 1.0
# Скрипт для установки базовых программ для ubuntu

# 1. Chrome
# Загрузить установщик репозитория стабильной версии Chrome в Ubuntu
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# Установка пакета с помощью dpkg
sudo dpkg -i --force-depends google-chrome-stable_current_amd64.deb

# 2. GIT
# Установка git
sudo apt install git -y