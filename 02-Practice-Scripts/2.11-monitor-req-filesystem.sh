#!/bin/bash 
id="mindinboogy@gmail.com"

FU=$(df -H | grep /dev/mapper/ | awk '{print $5}' | tr -d "%")

if [[ $FU -gt 80 ]]
then
    echo "The file system /dev/mapper is : $FU" | /usr/bin/mail -s "File system utilization alert" "$id"
fi