#!/bin/bash

#simple usage 

echo "the line is wonderful"

# Advanced usage
#EScape Cjaracters: 
#new line \n
echo -e "The Bash Shell scripting\nThis Scripting is powerfull"

#Horizontal tab \t
echo -e "The Bash Shell scripting\tThis Scripting is powerfull"

#Vertical Tab \v
echo -e "The Bash Shell scripting\vThis Scripting is powerfull"

#Backspace \b
echo -e "The Bash Shell scripting\bThis Scripting is powerfull"

#Carriage Return \r
echo -e "The Bash Shell scripting\rThis Scripting is powerfull"

#Escape Character \
echo -e "The Bash \"Shell scripting\" This Scripting is powerfull"

#Color codes
echo -e "\033[0;33mThis is script working in color color_Off='\033[0m'"

# -n option

echo -e "This is first line\nThis is Second line"
echo -n "This is Third line "
echo "this is forth line"