#!/bin/bash

echo "What age are you?"

read age

let "dogYears = $age * 6"


echo "You'll be $dogYears in dog years"
