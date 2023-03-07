#!/bin/bash
TH_L=1210
free_RAM=$(free -mt | grep -E "Total" | awk '{print $4}')

if [[ $free_RAM -lt $TH_L ]]
then 
cat << EOF | /usr/bin/mail -s "$(date '+%d_%m_%y'): REPORT on $(hostname)" "mindinboogy@gmail.com"
server is running with low RAM Size
Available RAM is: $free_RAM
EOF
fi
