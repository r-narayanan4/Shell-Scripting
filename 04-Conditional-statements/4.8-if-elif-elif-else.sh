#!/usr/bin/env bash
# Docker cmds option start,stop,restart,status,version.

if [[ $(id -u) -ne 0 ]]
then
    echo "you are not allowed to run this script"
    exit 1
fi

read -p "Enter the Docker option:" opt

if [[ $opt == start ]]
then
    echo "starting Docker....."
    systemctl start docker
elif [[ $opt == stop ]]
then
    echo "stoping Docker...."
    systemctl stop docker
elif [[ $opt == restart ]]
then
    echo "restarting docker...."
    systemctl restart docker
elif [[ $opt == status ]]
then
    status=$(systemctl status docker | awk '/Active/ {print $3}' | tr -d "()")
    echo "Docker status is : $status"
elif [[ $opt == version ]]
then
    version=$(docker -v | awk '{print $3}' | tr -d ",")
    echo "The docker version is: $version"
else
    echo "you entered invalid option"
fi
