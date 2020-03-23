#!/bin/bash

# verify user is root or not

Error () {
    echo -e "\e[1;31m\n$1\n\e[0m"
}
ID=$(id -u)

if [ $ID -ne 0 ]; then
   Error "Run this script as a root user"
   exit 5
fi   
# Install web server
echo "Install a web server"

# Install App server