#!/bin/bash

clear

# variable

HOST=$(hostname)
TIME=$(timedatectl | grep Time | cut -c 17-63)
WHO=$(sh -c 'whoami')
OS=$(uname -msr)
DATE=$(date)
UP_T=$(uptime | awk '{print $2, $3, $4}')
UP_TS=$(awk '{print $1}' /proc/uptime)
IP=$(ip addr show | grep global | awk '{print $2}')
MASK=$(ifconfig |grep broadcast | awk '{print $4}')
GATE=$(ip r | grep default | awk '{print $3}')
RAM_TOT=$(var=$(free -m | grep Mem | awk '{print $2 / 1024}'); printf "%.3f GB\n" $var)
RAM_USE=$(var=$(free -m | grep Mem | awk '{print $3 / 1024}'); printf "%.3f GB\n" $var)
FRE_RAM=$(var=$(free -m | grep Mem | awk '{print $4 / 1024}'); printf "%.3f GB\n" $var)
SPC_ROT=$(var=$(df / | grep dev | awk '{print $2 / 1024}'); printf "%.2f MB\n" $var)
USE_SPC_ROT=$(var=$(df / | grep dev | awk '{print $3 / 1024}'); printf "%.2f MB\n" $var) 
FRE_SPC_ROT=$(var=$(df / | grep dev | awk '{print $4 / 1024}'); printf "%.2f MB\n" $var)

# output

echo "HOSTNAME===========$HOST"
echo
echo "TIMEZONE===========$TIME"
echo
echo "USER===============$WHO"
echo
echo "OS=================$OS"
echo
echo "DATE===============$DATE"
echo
echo "UPTIME=============$UP_T"
echo
echo "UPTIME_SEC=========$UP_TS"
echo
echo "IP=================$IP"
echo
echo "MASK===============$MASK"
echo
echo "GATEWAY============$GATE"
echo
echo "RAM_TOTAL==========$RAM_TOT"
echo
echo "RAM_USED===========$RAM_USE"
echo
echo "RAM_FREE===========$FRE_RAM"
echo
echo "SPACE_ROOT=========$SPC_ROT"
echo
echo "SPACE_ROOT_USED====$USE_SPC_ROT"
echo
echo "SPACE_ROOT_FREE====$FRE_SPC_ROT"
