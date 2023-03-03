#!/bin/bash

# To print docker version and nginx version
DockerVersion=$(docker -v | cut -d " " -f 3 | tr "," " ")
NginxVersion=$(nginx -v 2>&1 | cut -d " " -f 3 | cut -d "/" -f 2)
OSname=$(uname)

cat <<EOF | /usr/bin/mail -s "$(date '+%d_%m_%y'): REPORT on $(hostname)" "mindinboogy@gmail.com"
Docker Version : $DockerVersion
Nginx Version : $NginxVersion
OS-Name : $OSname
Thanks 
DevOps TEAM
EOF
