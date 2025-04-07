#!/bin/bash

echo "Sorry to be intrusive, but how much do you weigh?"

read weight

 # let kg=$weight/2.2046
#  kg=$(bc <<< "$weight/2.2046" )
 kg=$(expr $weight + 10 )

echo "You'll weigh about $kg kilograms in england!"

