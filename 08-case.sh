#!/bin/bash

action=$1

case $action in
    start)
      echo "Performing start action"
      exit 0
      ;;
    stop)
      echo "Performing stop action"
      ;;
    *)   
       echo "Input action needed start/stop"
       exit 1
esac

echo "Hello"