#/bin/bash
#which httpd 2>&1 1>/dev/null && { echo "Apache(httpd) is installed" ; echo "httpd version is: $(httpd -v)" ;} || echo "apche is not installed"

if which httpd 2>&1 1>/dev/null
then
    echo "Apache(httpd) is installed"  
    echo "httpd version is: $(httpd -v)"
else
    echo "apche is not installed"
fi