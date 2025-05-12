#!/bin/bash

echo "How much do you weigh in pounds?"

read weight

# converts the weight of pounds to kilos
kg=$(bc <<< "$weight/2.2046" )

# apparently using the test keyword will allow the -lt to be recognized
if test "$weight" -lt 150 ;then
 echo "You're pretty skinny for $kg kilos"

 elif test "$weight"  -lt 180 ; then
 echo " That's $kg kilos, seem to be normal weight ... if you're a man"
 elif test $weight -ge 200 -o $weight -le 250; then
  echo "You are one beefy {$kg}kg boy"
 else
 echo "You are $kg kilos, you are either slightly chubby or a complete fat ass"

fi