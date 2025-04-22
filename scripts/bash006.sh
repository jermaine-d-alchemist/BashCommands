#!/bin/bash
cd "$(dirname "$0")"

while read line
do
  echo $line
done < ../text/t001.txt

echo "lets try that again"

# This will read the last line of the files
while read line || [ -n "$line" ]; do echo $line; done < ../text/t001.txt