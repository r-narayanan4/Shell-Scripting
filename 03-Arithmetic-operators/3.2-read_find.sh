#!/bin/bash

read -p "Enter your first number: " a
read -p "Enter your Second number: " b

#ADD
#((sum=a+b))
add=$(bc<<<"scale=3;$a+$b")
echo  "The additon of $a and $b is : $add"

#SUB
#((sub=a-b))
sub=$(bc<<<"scale=3;$a+$b")
echo "The subtraction of $a and $b is : $sub"

#MUL
#((mul=a*b))
mul=$(bc<<<"scale=3;$a+$b")
echo "The multiplication of $a and $b is : $mul"

#DIV
div=$(bc <<< "scale=3;$a/$b")
echo "The division of $a and $b is : $div"

#REM
rem=$(bc<<<"scale=3;$a+$b")
echo "The reminder of $a and $b is : $rem"
