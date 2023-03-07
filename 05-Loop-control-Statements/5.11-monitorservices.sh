#!/usr/bin/env bash

myservices=(docker nginx)
for eachvalue in ${myservices[@]}
do
    systemctl status $eachvalue 1>/dev/null 2>/dev/null
    if [[ $? -ne 0 ]]
    then
        echo "The service $eachvalue is not running"
        echo "The service $eachvalue is not running on $(hostname -s)" | /usr/bin/mail -s "status of $eachvalue" "mindinboogy@gmail.com"
    fi

done