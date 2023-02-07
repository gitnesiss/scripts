# Copyright 31.01.2023  s21genesiss@gmail.com
# Version 1.0
# Скрипт для просмотра памяти в ОС Ubuntu.

#!/bin/bash

echo -e "        \033[1;37mИнформация о системе.\033[0m"
echo
echo "Открыть программу которая покажет используемые ресурсы ОС, можно с помощью команды:"
echo -e "    \033[36mgnome-system-monitor\033[0m"
echo "Для запуска просмотра ресурсов оперативной памяти с обновлением каждую секунду:"
echo -e "    \033[36mwatch -n 1 free -m\033[0m"
echo "Для запуска просмотра ресурсов оперативной памяти с обновлением каждую секунду, подсвечиванием изменений (запускать из места расположения скрипта)"
echo -e "    \033[36mwatch -t -c -d -n 1 ./watch_memory_ubuntu.sh\033[0m"
echo


HOSTNAME=$(hostname)
TIMEZONE="$(cat /etc/timezone) $(date +"%Z" -u) $(date +"%:::z")"
USER=$(whoami)
OS=$(uname)
DATE=$(date +"%d %B %Y %X")
UPTIME=$(uptime -p)
UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
IP=$(hostname -I)
GATEWAY=$(ip r | grep default | awk '{print $3}')
RAM_TOTAL=$(free | grep -e Mem: -e Память: | awk '{printf "%.3f GB", $2/(1024. * 1024.)}')
RAM_USED=$(free | grep -e Mem: -e Память: | awk '{printf "%.3f GB", $3/(1024. * 1024.)}')
RAM_FREE=$(free | grep -e Mem: -e Память: | awk '{printf "%.3f GB", $4/(1024. * 1024.)}')
SPACE_ROOT=$(df / | grep dev | awk '{printf "%.2f MB", $2/(1024.)}')
SPACE_ROOT_USED=$(df / | grep dev | awk '{printf "%.2f MB", $3/(1024.)}')
SPACE_ROOT_FREE=$(df / | grep dev | awk '{printf "%.2f MB", $4/(1024.)}')

str01="HOSTNAME = $HOSTNAME"
str02="TIMEZONE = $TIMEZONE"
str03="USER = $USER"
str04="OS = $OS"
str05="DATE = $DATE"
str06="UPTIME = $UPTIME"
str07="UPTIME_SEC = $UPTIME_SEC"
str08="IP = $IP"
str09="GATEWAY = $GATEWAY"
str10="RAM_TOTAL = $RAM_TOTAL"
str11="RAM_USED = $RAM_USED"
str12="RAM_FREE = $RAM_FREE"
str13="SPACE_ROOT = $SPACE_ROOT"
str14="SPACE_ROOT_USED = $SPACE_ROOT_USED"
str15="SPACE_ROOT_FREE = $SPACE_ROOT_FREE"

for arg in "$str01" "$str02" "$str03" "$str04" "$str05" "$str06" "$str07"\
  "$str08" "$str09" "$str10" "$str11" "$str12" "$str13" "$str14" "$str15"
do
  echo $arg
done
