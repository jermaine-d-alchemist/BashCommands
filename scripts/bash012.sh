#!/bin/bash

max=10

# the seq command allows you to add a variable as either the beginning or end of the for loop
# you can use or you could have a predefined range in the for loop
# like this : for i in {1..5}
for i in $(seq 1 $max)
do
   if test $i -gt 1; then

     echo "$i monkeys"

    else 

      echo "$i monkey"

   fi

done

echo "Are jumping on the bed"
