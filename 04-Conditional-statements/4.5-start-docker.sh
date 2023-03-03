#!/usr/bin/env bash

# To START the Docker Service

if [[ $(id -u) -eq 0 ]]
then
    if systemctl status docker 2>&1 1>/dev/nul 
    then
        echo "Already the docker service is started"
    else
        echo "Starting Docker...."
        systemctl start docker
        echo "successfully started docker service"
    fi
else
    if sudo -v 1>/dev/null 2>/dev/null
    then
        if systemctl status docker 2>&1 1>/dev/nul 
        then
        echo "Already the docker service is started"
        else
        echo "Starting Docker...."
        sudo systemctl start docker
        echo "successfully started docker service"
        fi
    else
        echo "sorry you premission denied.You not allowed to start docker serve,because you don't have sudo previlages to start the docker service"
    fi
fi