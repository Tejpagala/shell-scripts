#!/bin/bash

# special variables are 0-n,*,@,$,#

echo "script name = $0"
echo "first argument = $1"

echo "all values parsed = $* / $@"

echo "PID of the script = $$"
