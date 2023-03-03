#!/bin/bash
echo "The user is : $USER"
echo "The Home for this user is: $HOME"

# Another way

echo "
The user is : $USER
echo The Home for this user is: $HOME
"

#Using Heredoc

cat << EOF
echo The user is : $USER
echo The Home for this user is: $HOME
EOF

cat << RLN
echo The user is : $USER
echo The Home for this user is: $HOME
RLN

#This can be redirected to another file
cat << RLN > heredoc.txt
echo The user is : $USER
echo The Home for this user is: $HOME
RLN

#This can given to output
cat << RLN | grep "this"
echo The user is : $USER
echo The Home for this user is: $HOME
RLN