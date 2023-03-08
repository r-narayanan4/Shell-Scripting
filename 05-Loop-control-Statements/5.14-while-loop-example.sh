#!/bin/bash
#infinity while loop
<< mycom1
while :
do
    echo "pk"
    echo ",...,..,"
done
mycom1

#infinty while loop with cmd
<< mycom2
while datee &> /dev/null
do
    echo "date command is executing with while loop"
done
mycom2

<<mycom3
start=1
while [[ $start -le 10 ]]
do
    echo "$start"
    ((start++))
done
mycom3

<<mycom4
file_name="5.14-while-loop-example.sh"
while read each_line
do
    echo "$each_line"
done < $file_name
mycom4

#cat 5.14-while-loop-example.sh | while read line
ls -lrt | while read line
do
    echo "$line"
    echo "...."
done


