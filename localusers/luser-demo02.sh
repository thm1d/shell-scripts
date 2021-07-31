#!/bin/bash

# Display the UID and username of the user executing this script.
# Display if the user is the root user or not.

# Display the UID
echo "Your uid is ${UID}"

# Display the username
USER_NAME=$(id -un)
echo "Your username is ${USER_NAME}"

# Display if the user is the root or not
if [[ "${UID}" -eq 0 ]] 
then
echo 'You are root'
else
echo 'You are not root'
fi
