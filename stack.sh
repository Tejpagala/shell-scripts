#!/bin/bash

# verify user is root or not

Error () {
    echo -e "\e[1;31m\n$1\n\e[0m"
}

Success () {
    echo -e "\e[31m $1  -  SUCCESS\e[0m"
}

Failure () {
    echo -e "\e[32m $1  -  FAILURE\e[0m"
}

Stat () {
    if [ $2 -eq 0 ]; then
        Success "$1"
    else
        Failure "$1"
        Error "Refer log file $LOG for more information"
        exit 2
}
ID=$(id -u)

if [ $ID -ne 0 ]; then
   Error "Run this script as a root user"
   exit 5
fi   

LOG=\tmp\stack.log
rm -f \tmp\stack.log

# Install web server
echo "Install a web server"
yum install httpd -y &>>/tmp/stack.log

# Install App server