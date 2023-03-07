#!/bin/bash
#ls
# break statemet example
<< mcom
for each_file in $(ls)
do 
    echo "$each_file"
done
mcom

<< scom

cnt=1
for each_file in $(ls *.txt)
do
    if [[ $cnt -eq 1 ]]
    then    
        echo "$each_file"
        ((cnt++))
    fi
done
scom

echo "starting for loop"
cnt=1
for each_file in $(ls *.txt)
do
	if [[ $cnt -eq 1 ]]
	then
        echo "$each_file"
	    break
	fi
done
echo "for loop is over"
