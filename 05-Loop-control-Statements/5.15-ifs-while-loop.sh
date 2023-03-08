#!/bin/bash
<<com1
while read line
do
    echo "$line"
done < servers-info.sh
com1

<<com2
while read f1 f2 f3 f4 f5              # by default the while loop consider the sapce as a field seprator
do                             
    echo "$f1" "$f2"
done < servers-info.sh
com2

<<mycom3
OLD_IFS=$IFS
while IFS="," read f1 f2 f3 f4 f5      #if field seprator other then a sapce (i.e , - etc) you have mention in the loop 
do
    echo "$f3"
done < servers-csv
IFS=$OLD_IFS
mycom3
OLD_IFS=$IFS
cat servers-csv | awk 'NR!=1 {print}' | while IFS="," read f1 f2 f3 f4 f5
do
    echo "$f2"
done
IFS=$OLD_IFS
