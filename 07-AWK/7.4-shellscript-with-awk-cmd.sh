#!/bin/bash
pwd
date
a=$(awk 'BEGIN { print "hi" }' )
b=$(awk -f hi.awk)

echo "a value is :$a"
echo "b value is :$b"
