#!/usr/bin/env bash
<< com
for eachvalue in docker nginx
do
    echo "the service is : $eachvalue"
done
com

myservice=(docker nginx)
for eachvalue in ${myservice[@]}
do
    echo " The service is: $eachvalue"
done
