#!/usr/bin/env bash
##{ ls ; pwd ; date }

#which docker && { echo "docker is installed on the host" ; echo "the Docker version is : $(docker  -v)" ; }

which httpd 2>&1 1>/dev/null && { echo "Apache(httpd) is installed" ; echo "httpd version is: $(httpd -v)" ;} || echo "apche is not installed"