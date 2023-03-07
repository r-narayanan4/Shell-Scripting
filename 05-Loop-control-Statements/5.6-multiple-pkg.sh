#!/bin/bash
#Author: RLN
#Installing multiple pkags

if [[ $# -eq 0 ]]
then
    echo "Usage: $0 pkg1 pkg2 ...."
    exit 1
fi

if [[ $(id -u) -ne 0 ]]
then
    echo "please run from root user or with sudo privilage"
    exit 2
fi

for each_pkg in "$@"
do 
    if which $each_pkg &> /dev/null
    then
        echo "Alteady $each_pkg is installed"
    else
        echo "Installing $each_pkg ...."
        yum install $each_pkg -y &> /dev/null
        if [[ $? -eq 0 ]]
        then
            echo "successfully installled $each_pkg"
        else
            echo "unable to install $each_pkg"
        fi
    fi
done