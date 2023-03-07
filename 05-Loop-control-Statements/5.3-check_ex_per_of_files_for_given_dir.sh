#!/bin/bash
#basic for loop
if [[ $# -ne 1 ]]
then
    echo "Usage: $0 <any_pathe>"
    exit
    
fi

given_path=$1
for file in $(ls $given_path)
do
    if [[ -x $file ]]
    then
        echo "$file is having execution permission"
    else
        echo "$file is not having execution permission"
    fi
done

