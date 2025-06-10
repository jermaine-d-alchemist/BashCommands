#!/bin/bash

cd "$(dirname "$0")"
current_time=$(date +%A, %B %d %Y)
echo "Today is $current_time" >> ../text/t003.txt