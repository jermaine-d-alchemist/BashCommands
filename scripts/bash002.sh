#!/bin/bash


echo "Hold are you?"

read age

let "age_left=78 - $age" 

echo "You have $age_left years left before you hit 78"
