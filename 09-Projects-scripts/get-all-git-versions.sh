#!/bin/bash
#Simple shell script to get all available git versions from offical git website.
#To understand the usage of sed cut awk and arrays .

which wget 1>/dev/null 2>/dev/null
if [ $? -ne 0 ]
then
    echo "Please install wget and retry"
    exit 1
fi
if [ -e "index.html" ]
then
    echo "Removing old index.html"
    rm -rf index.html
fi

url="https://mirrors.edge.kernel.org/pub/software/scm/git/"
wget $url
if [ $? -ne o ]
then
    echo "Unable to download git info from $url"
    exit 2
fi
declare -a git_vers
echo "******************* Please wait collecting all git versions from official website of git-scm****************************"
while read line
do
    
    git_vers+=($(echo $line | sed -n '/git-\([0-9]\+\.\)\+tar.gz/p' | awk -F '"' '{ print $2 }' | cut -c 5- | awk -F '.tar.gz' '{ print $1 }'))

done < index.html

echo "The all available git versions are: "
cnt=0
no_ver=${#git_vers[*]}
width=20
for each_ver in ${git_vers[*]}
do 
   #echo -e "\t\t ${git_vers[$cnt]} \\t ${git_vers[$((cnt+1))]} \\t ${git_vers[$((cnt+2))]}"
    printf "%-*s %-*s %-*s %-*s %-*s %-*s\n" $width ${git_vers[$cnt]} $width ${git_vers[$((cnt+1))]} $width ${git_vers[$((cnt+2))]} $width ${git_vers[$((cnt+3))]} $width ${git_vers[$((cnt+4))]} $width ${git_vers[$((cnt+5))]}
    cnt=$((cnt+6))
    if [ $cnt -ge $no_ver ]
    then
        break
    fi
done
echo "Total git versions from official website of git-scm are:" $no_ver