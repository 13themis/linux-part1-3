#!/bin/bash

clear

# variables

var1=$(grep column1_background color.cfg | cut -c 20)
var2=$(grep column1_font_color color.cfg | cut -c 20)
var3=$(grep column2_background color.cfg | cut -c 20)
var4=$(grep column2_font_color color.cfg | cut -c 20)

color_name1=""
color_name2=""
color_name3=""
color_name4=""

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
if [[ $var1 = "" ]]
then
	color1=${NORMAL}
	color_name1=$(printf " = default (Black)")
elif [[ $var1 -eq 1 ]]
then
	color1=${BGGRAY}
	color_name1=$(printf " = (White)")
elif [[ $var1 -eq 2 ]]
then
	color1=${BGRED}
	color_name1=$(printf " = (Red)")
elif [[ $var1 -eq 3 ]]
then
	color1=${BGGREEN}
	color_name1=$(printf " = (Green)")
elif [[ $var1 -eq 4 ]]
then
	color1=${BGBLUE}
	color_name1=$(printf " = (Blue)")
elif [[ $var1 -eq 5 ]]
then
	color1=${BGMAGENTA}
	color_name1=$(printf " = (Purple)")
elif [[ $var1 -eq 6 ]]
then
	color1=${BGBLACK}
	color_name1=$(printf " = (Black)")
fi

# before '=' foreG text output

if [[ $var2 = "" ]]
then
	color2=${NORMAL}
	color_name2=$(printf " = default (White)")
elif [[ $var2 -eq 1 ]]
then
	color2=${GRAY}
	color_name2=$(printf " = (White)")
elif [[ $var2 -eq 2 ]]
then
	color2=${RED}
	color_name2=$(printf " = (Red)")
elif [[ $var2 -eq 3 ]]
then
	color2=${GREEN}
	color_name2=$(printf " = (Green)")
elif [[ $var2 -eq 4 ]]
then
	color2=${BLUE}
	color_name2=$(printf " = (Blue)")
elif [[ $var2 -eq 5 ]]
then
	color2=${MAGENTA}
	color_name2=$(printf " = (Purple)")
elif [[ $var2 -eq 6 ]]
then
	color2=${BLACK}
	color_name2=$(printf " = (Black)")
fi

# after '=' back text output

if [[ $var3 = "" ]]
then
	color3=${NORMAL}
	color_name3=$(printf " = default (Black)")
elif [[ $var3 -eq 1 ]]
then
	color3=${BGGRAY}
	color_name3=$(printf " = (White)")
elif [[ $var3 -eq 2 ]]
then
	color3=${BGRED}
	color_name3=$(printf " = (Red)")
elif [[ $var3 -eq 3 ]]
then
	color3=${BGGREEN}
	color_name3=$(printf " = (Green)")
elif [[ $var3 -eq 4 ]]
then
	color3=${BGBLUE}
	color_name3=$(printf " = (Blue)")
elif [[ $var3 -eq 5 ]]
then
	color3=${BGMAGENTA}
	color_name3=$(printf " = (Purple)")
elif [[ $var3 -eq 6 ]]
then
	color3=${BGBLACK}
	color_name3=$(printf " = (Black)")
fi

# after '=' foreG text output

if [[ $var4 = "" ]]
then
	color4=${NORMAL}
	color_name4=$(printf " = default (White)")
elif [[ $var4 -eq 1 ]]
then
	color4=${GRAY}
	color_name4=$(printf " = (White)")
elif [[ $var4 -eq 2 ]]
then
	color4=${RED}
	color_name4=$(printf " = (Red)")
elif [[ $var4 -eq 3 ]]
then
	color4=${GREEN}
	color_name4=$(printf " = (Green)")
elif [[ $var4 -eq 4 ]]
then
	color4=${BLUE}
	color_name4=$(printf " = (Blue)")
elif [[ $var4 -eq 5 ]]
then
	color4=${MAGENTA}
	color_name4=$(printf " = (Purple)")
elif [[ $var5 -eq 6 ]]
then
	color4=${BLACK}
	color_name4=$(printf " = (Black)")
fi

if  [[ $var1 != $var2 && $var3 != $var4 ]]
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
echo
echo
echo "Column 1 background$color_name1"
echo "Column 1 font color$color_name2"
echo "Column 2 background$color_name3"
echo "Column 2 font color$color_name4"
echo ""
