#!/usr/bin/env bash
# To verify the shell script running user is root or not
#userID=$(id -u)
#[[ $userID -eq 0 ]] && echo " YOU ARE ROOT" || echo "YOU ARE NOT ROOT"

#[[ $(id -u) -eq 0 ]]  && echo " YOU ARE ROOT" || echo "YOU ARE NOT ROOT"

#using If-else-statement
if [[ $(id -u) -eq 0 ]]
then
    echo " YOU ARE ROOT"
else
    echo "YOU ARE NOT ROOT"
fi