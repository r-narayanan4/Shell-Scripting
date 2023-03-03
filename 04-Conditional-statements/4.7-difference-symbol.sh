#/usr/bin/env bash

read -p "do you want to start docker ? say Yes or NO: " usrcnf
#if [ "$usrcnf" = "yes" ]
#if [ $usrcnf = yes -o $usrcnf = y ]
#if [[ $usrcnf = yes || $usrcnf = y]]
if [[ $usrcnf =~ "y||yes" ]]
then
    echo "starting docker.."
    sudo Systemctl start docker
else
    echo "skipping..."
fi