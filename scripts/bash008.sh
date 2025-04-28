#!/bin/bash

cd "$(dirname "$0")"

echo "I'm inserting text into this file" > ../text/t002.txt

echo "I'm appending text into this file" >> ../text/t002.txt