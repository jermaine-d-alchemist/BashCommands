#!/bin/bash

i=1
# surprisingly the comparison operator flags
# work in these brackets while it loops
while [[ $i -le 10 ]] ; do
   echo "$i"
  (( i += 1 ))
done