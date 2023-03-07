#!/bin/bash
#basin for loop
<< com
if [[ -x 5.1-intro-loops.sh ]]
then
    echo "5.1-intro-loops.sh is having execution permission"
else
    echo "5.1-intro-loops.sh is not having execution permission"
fi

if [[ -x 5.2-check-ex-per.sh ]]
then
    echo "5.2-check-ex-per.sh is having execution permission"
else
    echo "5.1-check-ex-per.sh is not having execution permission"
fi
com

#using for loop concept

#for file in  5.1-intro-loops.sh 5.2-check-ex-per.sh
for file in $(ls)
do
    if [[ -x $file ]]
    then
        echo "$file is having execution permission"
    else
        echo "$file is not having execution permission"
    fi
done

