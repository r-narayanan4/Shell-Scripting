#!/bin/bash
#infinite loop
echo " This is a for loop"
cnt=1
for((;;))
do
    echo "this is infinite loop"
    ((cnt++))
    sleep 1
    if [[ $cnt -eq 10 ]]
    then
        break
    fi
done

echo "out of loop"