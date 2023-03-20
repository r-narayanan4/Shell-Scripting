#!/bin/awk -f
: '
awk option'BEGIN { } pattern/condition { } END { }' filename
command | awk option  'BEGIN {} patterm/condition {} '
============================================================
awk ' pattern/condition { } END { }' filename
command | awk  ' patterm/condition {} '
============================================================
awk 'BEGIN { } pattern/condition { } END { }' filename
command | awk  'BEGIN {} patterm/condition {} '

==============================================================

command | awk '{ print "a=" , "b=",}'
echo "2 6" | awk '{ print "a=" $1 , "b=" $2 }'

awk '{ print "a=" $1 , "b=" $2 ,}'  ab.txt

awk '{ a=$1 ; b=$2 ; print a,b }' ab.txt
awk '{ a=$1 ; b+$2 ; print "a="a, "b="b}' ab.txt

'


BEGIN {
    print "finding a and b values for ab.txt"
}

{
    a=$1
    b=$2
    print "a="a,"b="b
}

END {
    print "completed reading  a and b value"
}

: '
 we have the content in ab.txt
 (i.e) 1 2
       3 5
we can run the awk script as follows 
awk -f display-a-b.awk ab.txt

display-a-b.awk is logic
ab.txt is input
'

