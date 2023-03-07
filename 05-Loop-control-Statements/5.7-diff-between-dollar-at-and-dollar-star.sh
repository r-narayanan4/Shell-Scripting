#!/bin/bash
#difference_between_$@_and$* 
#echo "$@"
#echo "$*" #in general we get same output but in for loop we get different output
echo "The below output is for \$*"
for each in "$*"
do
  echo $each
done

echo "The below output is for \$@"
for each in "$@"
do
  echo $each
done

# $* -print entire cmd line argument as a single line and it will not consider a string.(it print the cmd line argument horizontally)

# $@ -print cmd line argument in seprate line and consider the sting.(it prints vertical)

#example
: '
-cmd- bash 5.7-diff-between-dollar-at-and-dollar-star.sh 1 23 34 55 "str" "steddd sdfg "
-output-
The below output is for $*
1 23 34 55 str steddd sdfg
The below output is for $@
1
23
34
55
str
steddd sdfg
'
