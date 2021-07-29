#!/bin/bash

# This script displays various information to the screen

# Display 'Hello'
echo 'Hello'

# Assign a value to a variable
WORD='script'

# Display that value using the variable.
echo "$WORD"

# Combine a variable with text 
echo "This is a shell $WORD"

# Append text to the variable
echo "${WORD}ing is fun!"

# Create another variable
ENDING='ed'

# Combine two variable
echo "This is ${WORD}${ENDING}"

# Change the value in a variable
ENDING='ing'
echo "${WORD}${ENDING} is fun"

# End
