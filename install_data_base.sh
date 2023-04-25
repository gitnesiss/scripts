#!/bin/bash

# Установка GUI для управления ролями пользователей.
# sudo apt-get install gnome-system-tools

# Установка vim
# sudo apt install vim

# Обновите списки пакетов:
sudo apt-get update

# Создадим конфигурацию репозитория файлов:
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Импортируем ключ подписи репозитория:
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Установите последнюю версию PostgreSQL.
# Если вам нужна конкретная версия, используйте 'postgresql-12' или аналогичный вместо 'postgresql':
sudo apt-get -y install postgresql


while :
do
    echo
    echo "Установить:"
    echo "1 - pgAdmin 4          2 - DataGrip от JetBrains" 
    echo "[n/N] - ничего не устанавливать."
    read answer_install_program
    if [[ $answer_install_program = 1 ]]
    then
        echo
        echo "Начинаю установку ..."
        echo "Устанавливаю утилити командной строки для передачи данных с/на удаленный сервер"
        sudo snap install curl
        echo "Устанавливаю публичный ключ для репозитория"
        curl  -fsSL https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/pgadmin.gpg
        echo "Создаю файл конфигурации репозитория"
        sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list'
        sudo apt update
        sudo apt upgrade -y
        echo "Установливаю pgAdmin4"
        sudo apt install pgadmin4
        echo "Установка окончена."
        break
    elif [[ $answer_install_program = 2 || $answer_clear_scketch = "N" ]]
    then
        echo
        echo "Установка DataGrip от JetBrains"
        sudo snap install datagrip --classic
        break
    elif [[ $answer_install_program = "n" || $answer_clear_scketch = "N" ]]
        echo
        echo "Ничего не установливать."
        break
    fi
done

echo "Если всё верно, то должно вывестись текущее дата и время."
sudo -u postgres psql -c 'select now()'

# Для проверки текущего состояния PostgreSQL
sudo systemctl status postgresql

exit 0

# Для отключения автозапуска PostgreSQL
# sudo systemctl disable postgresql

# Для остановки службы сервера баз данных PostgreSQL
# sudo systemctl stop postgresql

# Для запуска служы сервера PostgreSQL
# sudo systemctl start postgresql

# Для проверки текущего состояния PostgreSQL
# sudo systemctl status postgresql


# echo "Записи из журнала сообщений сервера"
# cat /var/log/postgresql/postgresql-15-main.log

# echo "Информация, которая содержится в БД, располагается в этом каталоге."
# open /var/lib/postgresql/15/main/

# echo "Основной конфигурационный файл, содержащий значения параметров сервера."
# cat /etc/postgresql/15/main/postgresql.conf

# echo "Файл, определяющий настройки доступа."
# sudo cat /etc/postgresql/15/main/pg_hba.conf