#!/bin/bash


echo "What is your first name?"

read name

# option 1
echo "$name" | tr '[:upper:]' '[:lower:]'

echo "What is your last name?"

read last
# option 2
echo "$last" | awk '{print tolower($0)}'

echo "What do you want get off your chest"

read chest
# option 3
echo $chest | tr '[A-Z]' '[a-z]'

