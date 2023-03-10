#!/usr/bin/env bash
#Author: RLN
#Script to install any tomcat version and confgiure the server 
#(note: if the script failed please check the line number under tomcat-files-configuration with orinalfile in your system)

#Update and get wget install in your host
if ! [[ $(yum update -y) || ! $(yum install wget -y) ]]
then
    yum update -y &> /dev/null
    yum install wget -y &> /dev/null
fi

#To install Java  
yum install fontconfig java-11-openjdk -y  &> /dev/null

#Error Handling
if [[ $# -ne 1 ]]
then
    echo "hey admin please run the script as follows"
    echo "setup-tomcat-server.sh tomcat_version"
    exit 1
fi

#Cmd to install tomcat on your host. 
#Variables
req_tom_ver=$1
tom_m_ver=$(echo $req_tom_ver | cut -c 1)
url="https://dlcdn.apache.org/tomcat/tomcat-${tom_m_ver}/v${req_tom_ver}/bin/apache-tomcat-${req_tom_ver}.tar.gz"

#Create tomcat directory
cd /opt
wget $url &>/dev/null
tar -xvzf apache-tomcat-${req_tom_ver}.tar.gz &>/dev/null
mv apache-tomcat-${req_tom_ver} tomcat${tom_m_ver} 
rm -rf apache-tomcat-${req_tom_ver}.tar.gz
if [[ $? -eq 0 ]]
then 
    echo "tomcat is installed successfully"
fi

#Create link files for tomcat startup.sh and shutdown.sh
ln -s /opt/tomcat${tom_m_ver}/bin/startup.sh /usr/local/bin/tomcatup
ln -s /opt/tomcat${tom_m_ver}/bin/shutdown.sh /usr/local/bin/tomcatdown

#-----------------------------------------TomCat-Files-Configuration----------------------------------------------------

#To change the port number  8080 to 8089 (access tomcat application from browser on prot 8090)
sed -i '69s/8080/8089/' /opt/tomcat${tom_m_ver}/conf/server.xml

#To modify this restriction you'll need to edit the Manager's context.xml file. (under webapps dir)
#We need to  find context.xml and  comment () Valve ClassName under host-manager and manager.

sed -i '21s/^/<!-- /' /opt/tomcat${tom_m_ver}/webapps/host-manager/META-INF/context.xml
sed -i '22s/$/ -->/' /opt/tomcat${tom_m_ver}/webapps/host-manager/META-INF/context.xml
sed -i '21s/^/<!-- /' /opt/tomcat${tom_m_ver}/webapps/manager/META-INF/context.xml
sed -i '22s/$/ -->/' /opt/tomcat${tom_m_ver}/webapps/manager/META-INF/context.xml

#We need to update the user information in users.xml in /conf
line_number=48  # Replace with the line number where you want to add the content
file_path=/opt/tomcat${tom_m_ver}/conf/tomcat-users.xml  # Replace with the path to your file

#Use sed to insert the content after the specified line number
sed -i "${line_number}a\\
<role rolename=\"manager-gui\"/>\\
<role rolename=\"manager-script\"/>\\
<role rolename=\"manager-jmx\"/>\\
<role rolename=\"manager-status\"/>\\
<user username=\"admin\" password=\"admin\" roles=\"manager-gui, manager-script, manager-jmx, manager-status\"/>\\
<user username=\"deployer\" password=\"deployer\" roles=\"manager-script\"/>\\
<user username=\"tomcat\" password=\"s3cret\" roles=\"manager-gui\"/>" "${file_path}"

#Restart the tomcat
tomcatdown &>/dev/null
tomcatup &>/dev/null

#Message after completing configuration
echo "Tomcat server configuration completed..."
echo "Access Tomcat server using password with hostIp:port no"  # if this shows error in browser check the firewall and allow port no.
