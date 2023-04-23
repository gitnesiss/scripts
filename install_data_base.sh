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

echo "Установка DataGrip от JetBrains"
sudo snap install datagrip --classic

echo "Если всё верно, то должно вывестись текущее дата и время."
sudo -u postgres psql -c 'select now()' -y

# Для проверки текущего состояния PostgreSQL
sudo systemctl status postgresql


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