# Copyright 17.01.2023  s21genesiss@gmail.com
# Version 1.0
# Скрипт для установки программ для разработки.

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
echo -e "${BLUE}Установка gcc make perl.${ENDCOLOR}"
sudo apt install gcc make perl -y
echo -e "${BLUE}Установка отладчика GNU и коллекции компиляторов.${ENDCOLOR}"
sudo apt install build-essential -y
echo -e "${BLUE}Установка cmake.${ENDCOLOR}"
sudo apt install cmake -y
sudo apt install cmake-qt-gui -y
echo -e "${BLUE}Установка библиотеки gtest.${ENDCOLOR}"
sudo apt-get install libgtest-dev -y
echo -e "${BLUE}Установка valgrind.${ENDCOLOR}"
sudo apt install valgrind -y
echo -e "${BLUE}Установка OpenGL.${ENDCOLOR}"
sudo apt-get install mesa-common-dev libgl1-mesa-dev libglu1-mesa-dev freeglut3-dev -y
echo -e "${BLUE}Версия OpenGL:${ENDCOLOR}"
glxinfo | grep "OpenGL core profile version string"
echo -e "${BLUE}Установка утилит для OpenGL.${ENDCOLOR}"
sudo apt install mesa-utils -y
echo -e "${BLUE}Установка texinfo.${ENDCOLOR}"
sudo apt-get install texinfo -y
echo -e "${BLUE}Установка библиотеки GLFW${ENDCOLOR}"
sudo apt install libglfw3 -y
sudo apt install libglfw3-dev -y
echo -e "${BLUE}Установка xdg-utils для установки программы, которая открывает файлы или ссылки в предпочтительной программе.${ENDCOLOR}"
sudo apt install xdg-utils
echo -e "${BLUE}Установка инструмент для форматирования кода С/С++ clang-format-11.${ENDCOLOR}"
sudo apt-get install clang-format-11 -y
echo -e "${BLUE}Установка Qt6.02.${ENDCOLOR}"
sudo apt update -y
sudo apt install qtcreator -y
echo -e "${BLUE}Установка примеров программ для Qt.${ENDCOLOR}"
sudo apt install qtbase5-examples qtdeclarative5-examples qtbase5-doc-html -y
echo -e "${BLUE}Установка инструментов разработки для Qt.${ENDCOLOR}"
sudo apt install qtbase5-dev qtwayland5-dev-tools qtwayland5 -y
echo -e "${BLUE}Установить пакеты mesa-common-dev, libgl1-mesa-dev и libglu1. -mesa-dev.${ENDCOLOR}"
sudo apt install libglfw3-dev libglm-dev libepoxy-dev libboost-all-dev libglew-dev libopenal-dev libalut-dev -y
echo -e "${BLUE}Завершение установки.${ENDCOLOR}"

#echo "Удаление Qt Creator."
#sudo apt-get remove qt5-default qtcreator
