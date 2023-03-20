#!/bin/bash
read -p "enter a value:" a
read -p "enter b value:" b

echo "$a $b" | awk '{ x=$1 ; y=$2 ; print "x="x,"y="y }'

