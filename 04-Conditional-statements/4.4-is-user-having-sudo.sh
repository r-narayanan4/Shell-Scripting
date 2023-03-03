#!/usr/bin/env bash
#To find user having sudo privilages or not
#[[ $(sudo -v) -eq 0 ]] && echo "The user has sudo privilages" || echo "The user has no sudo privilages"

#sudo -v 2>&1  1>/dev/null && echo "The user $(id -un) is having sudo privilages" || echo "The user (id -un) not having sudo privilages on this host $(hostname)"

#using if else statement

if sudo -v 2>&1 1>/dev/null
then
    echo "The user $(id -un) is having sudo privilages"
else
    echo "The user (id -un) not having sudo privilages on this host $(hostname)"
fi