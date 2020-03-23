#!/bin/bash

# verify user is root or not
ID=$(id -u)

if [ $ID -ne 0 ]; then
   echo "Run this script as a root user"
   exit 5
fi   
# Install web server
echo "Install a web server"

# Install App server