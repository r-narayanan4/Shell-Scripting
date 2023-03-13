#!/usr/bin/env bash
#Script to install jenkins (Long Term Support release)
sudo yum update -y
sudo yum install wget -y

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
# Add required dependencies for the jenkins package
sudo yum install java-11-openjdk -y
sudo yum install jenkins -y
sudo systemctl daemon-reload -y
sudo systemctl enable jenkins
sudo systemctl start jenkins

#Allow port 8080
YOURPORT=8080
PERM="--permanent"
SERV="$PERM --service=jenkins"

#Firewall permission(note: it will not work in amazon linux because it will use iptables by default)
sudo firewall-cmd $PERM --new-service=jenkins
sudo firewall-cmd $SERV --set-short="Jenkins ports"
sudo firewall-cmd $SERV --set-description="Jenkins port exceptions"
sudo firewall-cmd $SERV --add-port=$YOURPORT/tcp
sudo firewall-cmd $PERM --add-service=jenkins
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --reload

#InstallApache Maven 3.9.0
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.0/binaries/apache-maven-3.9.0-bin.tar.gz --no-check-certificate
sudo tar -xvzf apache-maven-3.9.0-bin.tar.gz
sudo rm -rf apache-maven-3.9.0-bin.tar.gz
sudo mv apache-maven-3.9.0 maven-3.9.0
sudo echo -e "export M2_HOME=/maven\nexport PATH=${M2_HOME}/bin:${PATH}" > /etc/profile.d/maven.sh
