# Copyright 30.01.2023  s21genesiss@gmail.com
# Version 0.2
# Скрипт с описанием команд управления и настроек для git'а.

#!/bin/bash

# Цвет текста
# 0 - Нормальный
# 1 - Жирный текст
# 2 - Тусклый текст
# 3 - Курсив
# 4 - Подчеркнутый текст
# Буква "e" в цветах может быть заменена на цифры "033"
BLACK="\e[30m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
PURPLE="\e[35m"
TURQUOISE="\e[36m"
GREY="\e[37m"
ENDCOLOR="\e[0m"

BOLD_BLACK="\e[1;30m"
BOLD_RED="\e[1;31m"
BOLD_GREEN="\e[1;32m"
BOLD_YELLOW="\e[1;33m"
BOLD_BLUE="\e[1;34m"
BOLD_PURPLE="\e[1;35m"
BOLD_TURQUOISE="\e[1;36m"
BOLD_GREY="\e[1;37m"

ITALIC_BLACK="\e[1;30m"
ITALIC_RED="\e[1;31m"
ITALIC_GREEN="\e[1;32m"
ITALIC_YELLOW="\e[1;33m"
ITALIC_BLUE="\e[1;34m"
ITALIC_PURPLE="\e[1;35m"
ITALIC_TURQUOISE="\e[1;36m"
ITALIC_GREY="\e[1;37m"

# Цвет фона
BACK_BLACK="\e[40m"
BACK_RED="\e[41m"
BACK_GREEN="\e[42m"
BACK_YELLOW="\e[43m"
BACK_BLUE="\e[44m"
BACK_PURPLE="\e[45m"
BACK_TURQUOISE="\e[46m"
BACK_GREY="\e[47m"

USER=$(whoami)

echo
echo -e "--------  Hello ${BOLD_GREEN}$USER${ENDCOLOR}.  --------"
echo
echo "В этом скрипте ты найдёшь описание команд для работы с git'ом."
echo
echo "Создание ключа для репозитория."
echo " 1 Генерация."
echo "  1.1 Генерация SSH-ключа ed25519:"
echo -e "    ${BOLD_TURQUOISE}ssh-keygen -t ed25519${ENDCOLOR}"
echo "  1.2 Генерация SSH-ключа - не рекомендуется, ed25519 считается более предпочтительным."
echo -e "    ${BOLD_TURQUOISE}ssh-keygen${ENDCOLOR}"
echo " 2 Просмотр созданного ключа для возможности его копирования и просмотра."
echo -e "    ${BOLD_TURQUOISE}cat ~/.ssh/id_ed25519.pub${ENDCOLOR}    или    ${BOLD_TURQUOISE}cat ~/.ssh/id_rsa.pub${ENDCOLOR}"
echo
echo "Часто используемые команды:"
echo -e "    ${TURQUOISE}git status${ENDCOLOR}"
echo -e "    ${TURQUOISE}git add .${ENDCOLOR}"
echo -e "    ${TURQUOISE}git commit -m \"dev: тут пишится коммит\"${ENDCOLOR}"
echo -e "    ${TURQUOISE}git push origin develop${ENDCOLOR}"
echo
echo "Первоначальные настройки логина и e-mail'a git'а. Здесь --global означает"
echo "настройка для всей системы. А без этого флага настройка для конретного проекта."
echo -e "    ${BOLD_TURQUOISE}git config --global user.name \"$USER\"${ENDCOLOR}"
echo -e "    ${BOLD_TURQUOISE}git config --global user.email \"$USER@gmail.com\"${ENDCOLOR}"
echo
echo "Посмотреть настройки логина и e-mail'a для git'а ."
echo -e "    ${BOLD_TURQUOISE}git config user.name${ENDCOLOR}"
echo -e "    ${BOLD_TURQUOISE}git config user.email${ENDCOLOR}"
echo
echo "Создание (инициализаия) репозитория в папке."
echo -e "    ${BOLD_TURQUOISE}mkdir -p dirGit${ENDCOLOR} - создание паки"
echo -e "    ${BOLD_TURQUOISE}cd dirGit${ENDCOLOR}       - переход в созданную папку"
echo -e "    ${BOLD_TURQUOISE}git init${ENDCOLOR}        - команда создания репозитория"
echo
echo "В git файлы имееют следующие состояния:"
echo -e "    ${RED}- untracked - неотслеживаемые.${ENDCOLOR}"
echo -e "    ${GREEN}- unmodified - немодифицированные / зафиксированные.${ENDCOLOR}"
echo -e "    ${YELLOW}- modified - модифицированные.${ENDCOLOR}"
echo -e "    ${BLUE}- staged - подготовленные (файлы отмеченные для включения в следующий коммит).${ENDCOLOR}"
echo
echo "Добавление удалённого репозитория к уже созданному локальному каталогу."
echo "Сначала заходим в локальный каталог, а там следует ввести:"
echo -e "    ${BOLD_TURQUOISE}git remote add origin https://github.com/<адрес на созданный проект>${ENDCOLOR}"
echo
echo "Проверка удалённого репозитория. Просмотр привязки локального репозитория к удалённому."
echo -e "    ${BOLD_TURQUOISE}git remote -v${ENDCOLOR}"
echo
echo "Изменить origin адрес репозитория можно двумя способами:"
echo -e "    1-ый: ${BOLD_TURQUOISE}git remote set-url origin git@github.com:gitnesiss/Test_proj_CPP.git${ENDCOLOR}"
echo -e "    2-ой: Отредактировать файл .git/config: секция [remote \"origin\"] параметр - url."
echo
echo "Синхронизация."
echo -e "    ${BOLD_TURQUOISE}git push origin master${ENDCOLOR}"
echo "origin - удалённый сервер, master - имя ветки."
echo
echo "Установить ветку по умолчанию с которой будет синхронизироваться локальный репозиторий."
echo -e "    ${BOLD_TURQUOISE}git push -u origin develop${ENDCOLOR}"
echo "-u можно заменить на git push --set-upstream origin develop"
echo
echo "Скачать последние изменения с удалённого репозитория. После чего слить их вместе."
echo -e "    ${BOLD_TURQUOISE}git fetch origin${ENDCOLOR}"
echo -e "    ${BOLD_TURQUOISE}git merge origin/master${ENDCOLOR}"
echo "Скачать и сразу слить можно одной командой:"
echo -e "    ${BOLD_TURQUOISE}git pull${ENDCOLOR}"
echo
echo "Клонирование репозитория."
echo -e "    ${BOLD_TURQUOISE}git clone <адрес репозитроия> /<путь куда сохранить>${ENDCOLOR}"
echo -e "    ${BOLD_TURQUOISE}git clone <адрес репозитроия> MyProject${ENDCOLOR} - MyProject название папки."
echo
echo "Просмотр истории репозитория."
echo -e "    ${BOLD_TURQUOISE}git log${ENDCOLOR}"
echo "Просмотр разницы между коммитами."
echo -e "    ${BOLD_TURQUOISE}git log -p${ENDCOLOR}"
echo
echo "Просмотр ветвления всего проекта."
echo -e "    ${BOLD_TURQUOISE}git log --graph --oneline --all${ENDCOLOR}"
echo
echo "Вычленение нужной информации из коммитов."
echo -e "    ${BOLD_TURQUOISE}git log --pretty=format:\"%h %s\" --graph${ENDCOLOR}"
echo "%h - хэш-число, %s - коммит, --graph - показать все ветки и слияния."
echo
echo "Изменение коммита последнего локального репозитория."
echo -e "    ${BOLD_TURQUOISE}git commit --amend${ENDCOLOR}"
echo
echo "Отмена индексации (коммита/изменений) в локальном репозитории."
echo -e "    ${BOLD_TURQUOISE}git reset HEAD file.txt${ENDCOLOR}"
echo
echo "Создание ветки."
echo -e "    ${BOLD_TURQUOISE}git branch testing${ENDCOLOR}      - создание новой ветки с именем testing."
echo -e "    ${BOLD_TURQUOISE}git checkout -b testing${ENDCOLOR} - создание и переключение на вновь созданную ветку."
echo
echo "Посмотреть информацию по веткам."
echo -e "    ${BOLD_TURQUOISE}git branch${ENDCOLOR}         - посмотреть имя текущей ветки."
echo -e "    ${BOLD_TURQUOISE}git branch -r${ENDCOLOR}      - посмотреть имена удалённых репозиториев."
echo -e "    ${BOLD_TURQUOISE}git branch -a${ENDCOLOR}      - посмотреть имена локальных и удалённых репозиториев."
echo
echo "Переключение на существующую ветку."
echo -e "    ${BOLD_TURQUOISE}git checkout testing${ENDCOLOR} - testing имя ветки."
echo
echo "Удаление веток. Флаг \"-d\" можно заменить на \"--delete\"."
echo " 1 Удаление локальной ветки."
echo "  Для удаления ветки нужно находиться на не удаляемой ветке."
echo "  Если нужно удалить ветку без лишних вопросов, то нужно поставить флаг \"-D\"."
echo -e "    ${BOLD_TURQUOISE}git branch -d local_branch_name${ENDCOLOR}"
echo " 2 Удаление ветки с удалённого репозитория."
echo -e "    ${BOLD_TURQUOISE}git push origin -d remote_branch_name${ENDCOLOR}"
