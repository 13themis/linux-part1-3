#!/bin/bash

clear

# variables

color1=""
color2=""
color3=""
color4=""
normcolor=""

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

# color foreground

BLACK='\033[30m'      # black
RED='\033[31m'        # red
GREEN='\033[32m'      # green
BLUE='\033[34m'       # blue
MAGENTA='\033[35m'    # purple
GRAY='\033[37m'       # white
NORMAL='\033[0m'        # normal

# color background

BGBLACK='\033[40m'     # black
BGRED='\033[41m'       # red
BGGREEN='\033[42m'     # green
BGBLUE='\033[44m'      # blue
BGMAGENTA='\033[45m'   # purple
BGGRAY='\033[47m'      # white

# before '=' back text output
if [[ $# -lt 4 ]]
then
	color1=${NORMAL}
elif [[ $1 -eq 1 ]]
then
	color1=${BGGRAY}
elif [[ $1 -eq 2 ]]
then
	color1=${BGRED}
elif [[ $1 -eq 3 ]]
then
	color1=${BGGREEN}
elif [[ $1 -eq 4 ]]
then
	color1=${BGBLUE}
elif [[ $1 -eq 5 ]]
then
	color1=${BGMAGENTA}
elif [[ $1 -eq 6 ]]
then
	color1=${BGBLACK}
fi

# before '=' foreG text output

if [[ $# -lt 4 ]]
then
	color2=${NORMAL}
elif [[ $2 -eq 1 ]]
then
	color2=${GRAY}
elif [[ $2 -eq 2 ]]
then
	color2=${RED}
elif [[ $2 -eq 3 ]]
then
	color2=${GREEN}
elif [[ $2 -eq 4 ]]
then
	color2=${BLUE}
elif [[ $2 -eq 5 ]]
then
	color2=${MAGENTA}
elif [[ $2 -eq 6 ]]
then
	color2=${BLACK}
fi

# after '=' back text output

if [[ $# -lt 4 ]]
then
	color3=${NORMAL}
elif [[ $3 -eq 1 ]]
then
	color3=${BGGRAY}
elif [[ $3 -eq 2 ]]
then
	color3=${BGRED}
elif [[ $3 -eq 3 ]]
then
	color3=${BGGREEN}
elif [[ $3 -eq 4 ]]
then
	color3=${BGBLUE}
elif [[ $3 -eq 5 ]]
then
	color3=${BGMAGENTA}
elif [[ $3 -eq 6 ]]
then
	color3=${BGBLACK}
fi

# after '=' foreG text output

if [[ $# -lt 4 ]]
then
	color4=${NORMAL}
elif [[ $4 -eq 1 ]]
then
	color4=${GRAY}
elif [[ $4 -eq 2 ]]
then
	color4=${RED}
elif [[ $4 -eq 3 ]]
then
	color4=${GREEN}
elif [[ $4 -eq 4 ]]
then
	color4=${BLUE}
elif [[ $4 -eq 5 ]]
then
	color4=${MAGENTA}
elif [[ $5 -eq 6 ]]
then
	color4=${BLACK}
fi

if [ $# -lt 4 ] || [[ $1 != $2 && $3 != $4 ]]
then
	echo -en "${color1}${color2}HOSTNAME${NORMAL}===========${color3}${color4}$HOST${NORMAL}"
	echo
	echo -en "${color1}${color2}TIMEZONE${NORMAL}===========${color3}${color4}$TIME${NORMAL}"
	echo
	echo -en "${color1}${color2}USER${NORMAL}===============${color3}${color4}$WHO${NORMAL}"
	echo
	echo -en "${color1}${color2}OS${NORMAL}=================${color3}${color4}$OS${NORMAL}"
	echo
	echo -en "${color1}${color2}DATE${NORMAL}===============${color3}${color4}$DATE${NORMAL}"
	echo
	echo -en "${color1}${color2}UPTIME${NORMAL}=============${color3}${color4}$UP_T${NORMAL}"
	echo
	echo -en "${color1}${color2}UPTIME_SEC${NORMAL}=========${color3}${color4}$UP_TS${NORMAL}"
	echo
	echo -en "${color1}${color2}IP${NORMAL}=================${color3}${color4}$IP${NORMAL}"
	echo
	echo -en "${color1}${color2}MASK${NORMAL}===============${color3}${color4}$MASK${NORMAL}"
	echo
	echo -en "${color1}${color2}GATEWAY${NORMAL}============${color3}${color4}$GATE${NORMAL}"
	echo
	echo -en "${color1}${color2}RAM_TOTAL${NORMAL}==========${color3}${color4}$RAM_TOT${NORMAL}"
	echo
	echo -en "${color1}${color2}RAM_USED${NORMAL}===========${color3}${color4}$RAM_USE${NORMAL}"
	echo
	echo -en "${color1}${color2}RAM_FREE${NORMAL}===========${color3}${color4}$FRE_RAM${NORMAL}"
	echo
	echo -en "${color1}${color2}SPACE_ROOT${NORMAL}=========${color3}${color4}$SPC_ROT${NORMAL}"
	echo
	echo -en "${color1}${color2}SPACE_ROOT_USED${NORMAL}====${color3}${color4}$USE_SPC_ROT${NORMAL}"
	echo
	echo -en "${color1}${color2}SPACE_ROOT_FREE${NORMAL}====${color3}${color4}$FRE_SPC_ROT${NORMAL}"
else
	echo "The background and font color should not match. Retry!"
fi
echo ""
