#!/bin/bash
#if you want to give input from your cmd line while run the shell script .

#echo "$0" This is the script file name index position
echo "$1"
echo "$2"
echo "$3"
echo "${10}" #whenever we try to print two digit or greter then one digit you have to use curly braces {}


echo "The number of cmd line arguments are: $#" #To know how many cmd line arguments you are passing in the script
echo " The all command line arguments are: $@" # To print the cmd line argmts that you passed in the script.
echo "The all command line arguments are : $*" # there is a difference in this you will see in loop concept for now it will print same as above. 
#This are called cmd line arguments or postional argument.