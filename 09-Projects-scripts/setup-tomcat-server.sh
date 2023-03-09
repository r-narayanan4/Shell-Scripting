#!/usr/bin/env bash

#Author: RLN
#Script to install any tomcat version

#update and get wget install in your host

yum update -y &>/dev/null
yum install wget -y 1>/dev/null 2>/dev/null

#Error Handling

if [[ $# -ne 1 ]]
then
    echo "hey admin please run the script as follows"
    echo "setup-tomcat-server.sh tomcat_version"
    exit 1
fi

# cmd to install tomcat on your host. 
#variables
req_tom_ver=$1
tom_m_ver=$(echo $req_tom_ver | cut -c 1)
url="https://dlcdn.apache.org/tomcat/tomcat-${tom_m_ver}/v${req_tom_ver}/bin/apache-tomcat-${req_tom_ver}.tar.gz"

# Create tomcat directory
cd /opt
wget $url &>/dev/null
tar -xvzf apache-tomcat-${req_tom_ver}.tar.gz &>/dev/null
mv apache-tomcat-${req_tom_ver} tomcat${tom_m_ver} 
rm -rf apache-tomcat-${req_tom_ver}.tar.gz
if [[ $? -eq 0 ]]
then 
    echo "tomcat is installed successfully"
fi

#create link files for tomcat startup.sh and shutdown.sh
ln -s /opt/tomcat${tom_m_ver}/bin/startup.sh /usr/local/bin/tomcatup
ln -s /opt/tomcat${tom_m_ver}/bin/shutdown.sh /usr/local/bin/tomcatdown

#we need to update manualluly the port number in server.xml and /opt/tomcat/webapps/host-manager/META-INF/context.xml and /opt/tomcat/webapps/manager/META-INF/context.xml

# we need to update the user information in user.xml in /conf