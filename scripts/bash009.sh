#!/bin/bash

echo "How much do you weigh in pounds?"

read weight

# converts the weight of pounds to kilos
kg=$(bc <<< "$weight/2.2046" )

# the less than operator only works if the comparison is wrapped in two  curly brackets
if (( "$weight" < 150 || $weight > 199));then
 echo "You're pretty skinny for $kg kilos"

 elif (("$weight"  < 180)); then
 echo " That's $kg kilos, seem to be normal weight ... if you're a man"
 else
 echo "You are $kg kilos, you are either slightly chubby or a complete fat ass"

fi
