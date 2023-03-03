#!/bin/bash

# To print Docker Version

DockerVersion=$(docker -v | cut -d " " -f 3 | tr -d ",")
echo "Docker version : $DockerVersion"
# To print Docker Status

DockerStatus=$(systemctl status docker | awk '/Active/ {print $3}' | tr -d "[()]")
echo "Docker Status : $DockerStatus"