#!/bin/bash 

# Install Docker on centos
yum update -y
yum install wget -y
yum install curl -y
yum install net-tools -y

curl -fsSL https://test.docker.com -o test-docker.sh
sudo sh test-docker.sh
# Starting Docker on boot time
sudo service docker start
sudo service docker enable

# To install nginx on centos
#Adding the EPEL Software Repository
sudo yum install epel-release -y
sudo yum install nginx -y

# Starting Nginx
sudo systemctl start nginx
sudo systemctl status nginx

# Allow HTTP and HTTPS traffic
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload