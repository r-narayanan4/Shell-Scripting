#!/usr/bin/env bash
#which docker && { echo "docker is installed on the host" ; echo "the Docker version is : $(docker  -v)" ; }
: '
if which docker 2>&1 >/dev/null
then
    echo "docker is installed on the host"
    echo "The Docker version is : $(docker  -v)"
fi

#another Logic

whcih docker
if [[ $? -eq 0 ]]
then
    echo "docker is installed on the host"
    echo "The Docker version is : $(docker  -v)"
fi
'

if true
then 
    echo "Always execute"
fi

if false
then
    echo "It wont execute"
fi
