#!/bin/bash

echo "How much do you weigh in pounds?"

read weight

# converts the weight of pounds to kilos
kg=$(bc <<< "$weight/2.2046" )

# the -lt is the less than operator
if [["$weight" -lt 150 ]];then
 echo "You're pretty skinny for $kg kilos"

 elif [["$weight"  -lt 180 ]]; then
 echo " That's $kg kilos, seem to be normal weight ... if you're a man"
 else
 echo "You are $kg kilos, you are either slightly chubby or a complete fat ass"

# I'm assuming you have to end every if statement with a fi
# more testing is needed
fi
