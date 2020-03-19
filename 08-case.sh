#!/bin/bash

action=$1

case $action in
start)
      echo "Performing start action"
      ;;
stop)
      echo "Performing stop action"
      ;;
esac

echo "Hello"