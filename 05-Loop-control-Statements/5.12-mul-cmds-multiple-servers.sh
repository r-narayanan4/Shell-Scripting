#!/bin/bash

<< my_com
echo "The date command output on the server: 192.168.29.8"
sshpass -f pass ssh -o StrictHostKeyChecking=No rln@192.168.29.8 "date"
echo "-------------------------------------------------------"
echo "The uptime command output on the server: 192.168.29.8"
sshpass -f pass ssh -o StrictHostKeyChecking=No 192.168.29.8 "uptime"
echo "-------------------------------------------------------"
echo "The free -m command output on the server: 192.168.29.8"
sshpass -f pass ssh -o StrictHostKeyChecking=No 192.168.29.8 "free -m"
echo "-------------------------------------------------------"
my_com


for each_ser in $(cat remote_servers.txt) #(you create a file and have multiple server ip in remote_server.txt)
do
  echo "Executing cmds on $each_ser"
  echo "============================" 
  for each_cmd in date uptime "free -m"
  do
    echo "The $each_md command output on the server: $each_ser"
    #sshpass -f pass ssh -o StrictHostKeyChecking=No automation@$each_ser "$each_cmd" #(password authentication)
    ssh -o StrictHostKeyChecking=No automation@$each_ser "$each_cmd" #passwdless authentication
    echo "-------------------------------------------------------"
  done

done 
