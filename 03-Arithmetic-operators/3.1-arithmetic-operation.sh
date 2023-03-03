#!/bin/bash

x=4
y=64
((sum=x+y))
echo "The Additon of $x and $y is: $sum"

result=$(bc <<< "scale=3;$y/$x")
echo "the division of $y and $x is: $result"