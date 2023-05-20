#!/usr/bin/env bash
# Author: R L Narayanan
# Script to install and configure Tomcat server

# Update and install wget
if ! (yum update -y && yum install wget -y); then
    echo "Failed to update or install wget. Please check your system configuration." >&2
    exit 1
fi

# Install Java
if ! yum install fontconfig java-11-openjdk -y &> /dev/null; then
    echo "Failed to install Java." >&2
    exit 1
fi

# Check if Tomcat is already installed
if [[ -d "/opt/tomcat${tom_m_ver}" ]]; then
    read -p "Tomcat is already installed. Do you want to reinstall? [y/n]: " reinstall
    if [[ $reinstall != "y" ]]; then
        echo "Script terminated by user."
        exit 0
    fi
    rm -rf "/opt/tomcat${tom_m_ver}"
fi

# Get user input for Tomcat version and port number
read -p "Enter Tomcat version to install (e.g., 9.0.48): " req_tom_ver
read -p "Enter the desired port number (default: 8089): " port_number

# Set default port if not provided by the user
port_number=${port_number:-8089}

# Download and install Tomcat
tom_m_ver=$(echo "$req_tom_ver" | cut -c 1)
url="https://dlcdn.apache.org/tomcat/tomcat-${tom_m_ver}/v${req_tom_ver}/bin/apache-tomcat-${req_tom_ver}.tar.gz"

cd /opt
if ! wget "$url" &>/dev/null; then
    echo "Failed to download Tomcat archive. Please check the Tomcat version and your network connection." >&2
    exit 1
fi

if ! tar -xvzf "apache-tomcat-${req_tom_ver}.tar.gz" &>/dev/null; then
    echo "Failed to extract Tomcat archive." >&2
    exit 1
fi

mv "apache-tomcat-${req_tom_ver}" "tomcat${tom_m_ver}"
rm -rf "apache-tomcat-${req_tom_ver}.tar.gz"

# Create symbolic links for startup and shutdown scripts
if ! ln -s "/opt/tomcat${tom_m_ver}/bin/startup.sh" "/usr/local/bin/tomcatup"; then
    echo "Failed to create symbolic link for startup.sh." >&2
    exit 1
fi

if ! ln -s "/opt/tomcat${tom_m_ver}/bin/shutdown.sh" "/usr/local/bin/tomcatdown"; then
    echo "Failed to create symbolic link for shutdown.sh." >&2
    exit 1
fi

# Update Tomcat configuration files
if ! sed -i "s/8080/$port_number/" "/opt/tomcat${tom_m_ver}/conf/server.xml"; then
    echo "Failed to update server.xml." >&2
    exit 1
fi

if ! sed -i '21s/^/<!-- /' "/opt/tomcat${tom_m_ver}/webapps/host-manager/META-INF/context.xml"; then
    echo "Failed to update host-manager context.xml." >&2
    exit 1
fi

if ! sed -i '22s/$/ -->/' "/opt/tomcat${tom_m_ver}/webapps/host-manager/META-INF/context.xml"; then
    echo "Failed to update host-manager context.xml." >&2
    exit 1
fi

if ! sed -i '21s/^/<!-- /' "/opt/tomcat${tom_m_ver}/webapps/manager/META-INF/context.xml"; then
    echo "Failed to update manager context.xml." >&2
    exit 1
fi

if ! sed -i '22s/$/ -->/' "/opt/tomcat${tom_m_ver}/webapps/manager/META-INF/context.xml"; then
    echo "Failed to update manager context.xml." >&2
    exit 1
fi

line_number=48
file_path="/opt/tomcat${tom_m_ver}/conf/tomcat-users.xml"
user_info="<role rolename=\"manager-gui\"/>\n<role rolename=\"manager-script\"/>\n<role rolename=\"manager-jmx\"/>\n<role rolename=\"manager-status\"/>\n<user username=\"admin\" password=\"admin\" roles=\"manager-gui, manager-script, manager-jmx, manager-status\"/>\n<user username=\"deployer\" password=\"deployer\" roles=\"manager-script\"/>\n<user username=\"tomcat\" password=\"s3cret\" roles=\"manager-gui\"/>"

if ! sed -i "${line_number}a\\$user_info" "$file_path"; then
    echo "Failed to update tomcat-users.xml." >&2
    exit 1
fi

# Restart Tomcat
tomcatdown &>/dev/null
tomcatup &>/dev/null

# Get host IP
host_ip=$(hostname -I | awk '{print $1}')

# Print completion message
echo "Tomcat server configuration completed."
echo "Access Tomcat server using the following URL:"
echo "http://${host_ip}:${port_number}"
