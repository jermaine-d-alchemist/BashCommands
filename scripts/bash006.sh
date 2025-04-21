#!/bin/bash
cd "$(dirname "$0")"

while read line
do
  echo $line
done < ../text/t001.txt