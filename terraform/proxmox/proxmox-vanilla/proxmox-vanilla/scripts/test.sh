#!/bin/bash

# create a file with some test information
echo "This is a test file" > test.txt

# move and rename the file to the current user's home directory
mv test.txt ~/test-move.txt

