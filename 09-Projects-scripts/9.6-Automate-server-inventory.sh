#!/bin/bash

Server_Name=$(uname -n)
IP_Address=$(ifconfig | grep inet | awk 'NR==2 {print $2}')
OS_Type=$(uname)
UP_Time=$(uptime | awk '{print $3}' | tr -d ',')

#Creating Header in csv
echo "S_No,Server_Name,IP_Address,OS_Type,Up_Time" > server_info.csv
echo "1.$Server_Name,$IP_Address,$OS_Type,$UP_Time" >> server_info.csv
