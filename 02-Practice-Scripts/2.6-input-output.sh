#!/bin/bash
#my_name="lakshmi narayanan"
#my_name_up=${my_name^^}
#echo "Your name is upper cas is: $my_name_up"

#To ask the user to enter the input we use read "my_name"
: '
read -p "Enter your name:" my_name
my_name_up=${my_name^^}
echo "Your name is upper cas is: $my_name_up"
'
# The Default variable for read command is REPLY

read -p "Enter Your Name :"
echo "$REPLY"