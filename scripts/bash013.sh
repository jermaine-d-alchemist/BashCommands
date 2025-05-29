#!/bin/bash


echo "What job do you have?"

read job

# this is how you lowercase string values
job=$(echo "$job" | tr '[:upper:]' '[:lower:]')

case $job in 
    "knight")
      echo "Then you should you have a sword"
    ;;

    "mage")
    echo "Then you should have a staff"
    ;;

    "archer")
    echo "Then you should have a bow"
    ;;

    *)
    echo "Sir, we're in a medieval fantasy"
  ;;
esac