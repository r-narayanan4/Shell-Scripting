#!/bin/bash
read -p "enter a value:" a
read -p "enter b value:" b
read -p "enter the option(1.Add, 2.sub, 3.Multiply 4.Division):" opt

case $opt in
    1)
        echo "You selected Addition"
        awk -v a=$a -v b=$b 'BEGIN { print a+b }' 
        ;;
    2)
        echo "You selected Sub"
        awk -v a=$a -v b=$b 'BEGIN { print a-b } '
        ;;
    3)
        echo "You selected MUL"
        awk -v a=$a -v b=$b 'BEGIN { print a*b } '
        ;;
    4)
        echo "You selected div"
        awk -v a=$a -v b=$b 'BEGIN { print a/b } '
        ;;
    *)
       echo "you selected invalid option"
       ;; 
esac


#echo "$a $b" | awk '{ x=$1 ; y=$2 ; print "sum="a+b }'
#awk -v a=$a -v b=$b 'BEGIN { print a+b } '