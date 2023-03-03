#!/usr/bin/env bash

if [[ $# -ne 2 ]]
then
    echo "hey admin, Please run the script as follows"
    echo "Usage:$0 <ServiceName> <ServiceAction>"
    echo "valid ActionToExectuiononService are: start stop restart status"
    exit 1
fi

serviceName=$1
serviceAction=$2
sudo systemctl $serviceAction $serviceName