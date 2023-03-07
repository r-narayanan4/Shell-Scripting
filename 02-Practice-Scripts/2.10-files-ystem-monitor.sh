echo -e "The file system utilization on $(hostname -s) is : \n $(df -H | grep -Ev 'udev|tmpfs')" | /usr/bin/mail -s "File system utilization"  "mindinboogy@gmail.com"
