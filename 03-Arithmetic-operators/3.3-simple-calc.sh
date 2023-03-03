#!/bin/bash
clear
read -p "Enter Num1: " a
read -p "Enter Num2: " b
read -p "Enter your option(1.Addition,2.Sub,3.Mul,4.Div): " opt
case $opt in
    1)
        echo "You selected Addition"
        echo "The Additon of $a and $b is: $((a+b))"
        ;;
    2)
        echo "You selected Sub"
        echo "The Sub of $a and $b is: $((a-b))"
        ;;
    3)
        echo "You selected MUL"
        echo "The Mul of $a and $b is: $((a*b))"
        ;;
    4)
        echo "You selected div"
        echo "The div of $a and $b is: $((a/b))"
        ;;
    *)
       echo "you selected invalid option"
       ;; 
esac