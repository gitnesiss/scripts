# Copyright 20.03.2023  s21genesiss@gmail.com
# Version 0.1
# Скрипт для установки программ для разработки на Java.

#!/bin/bash

# Цвет текста
# 0 - Нормальный
# 1 - Жирный текст
# 2 - Тусклый текст
# 3 - Курсив
# 4 - Подчеркнутый текст
BLACK="\e[30m"
RED="\e[31m"
GREEN="\e[32m"
BOLDGREEN="\e[1;32m"
YELLOW="\e[33m"
BLUE="\e[34m"
PURPLE="\e[35m"
TURQUOISE="\e[36m"
GREY="\e[37m"
ENDCOLOR="\e[0m"

# Цвет фона
BLACKBACK="\e[40m"
REDBACK="\e[41m"
GREENBACK="\e[42m"
YELLOWBACK="\e[43m"
BLUEBACK="\e[44m"
PURPLEBACK="\e[45m"
TURQUOISEBACK="\e[46m"
GREYBACK="\e[47m"


USER=$(whoami)

echo -e "Hello ${GREEN}$USER.${ENDCOLOR}"

echo -e "${BLUE}Добавление шрифтов (часто используемых в windows).${ENDCOLOR}"
sudo apt install ubuntu-restricted-extras -y
echo -e "${BLUE}Обновление системы.${ENDCOLOR}"
sudo apt update & upgrade -y
echo -e "${BLUE}Установка valgrind.${ENDCOLOR}"
sudo apt install valgrind -y
echo -e "${BLUE}Установка OpenJDK-17.${ENDCOLOR}"
sudo apt install openjdk-17-jdk-headless -y
 