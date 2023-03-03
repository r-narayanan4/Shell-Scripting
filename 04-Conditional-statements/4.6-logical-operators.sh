#/usr/bin/env bash
<<logical-and
read -p "Enter your number: " num

#if [[ $num -ge 10 && $um -le 100 ]]
if [ $num -ge 10 -a $num -le 100 ]
then
    echo "$numb is the rage of 10 - 100"
else
    echo "$num is not in the range of 10 - 100"
fi
logical-and

read -p "Enter your confirmation to start docker:(say yes or no):" cnf
#if [[ $cnf == "yes" || $cnf == "y" ]]
if [ $cnf == "yes" -o  $cnf == "y" ]
then
    echo "starting docker...."
    sudo systemctl start docker
else
    echo "skipping...."
fi

# logicl NOT or !

# [[ ! 3 -gt 1 ]]
# [ ! 3 -gt 1 ] 

# here we can use both single squre bracket and double squre bracket for Not operator it prints reverse of the result.