#!/bin/bash

# Display if the UID and username of the user executing this script
# Display if the user is the vagrant user or not


# Display the UID
echo "Your UID is ${UID}"

# Display the UID if it does not match 1000
CHECK_UID='1000'
if [[ "${UID}" -ne "${CHECK_UID}" ]]
then
  echo "Your UID does not match ${CHECK_UID}"
  exit 1
fi

# Display the username
USER_NAME=$(id -un)

# Test if the command succeded
if [[ "${?}" -ne 0 ]]
then
  echo 'The id command did not execute successfully.'
  exit 1
fi
echo "Your username is ${USER_NAME}"

# Use a string test conditional
TEST_USER_NAME='vagrant'
if [[ "${USER_NAME}" = "${TEST_USER_NAME}" ]]
then
  echo "Your username matches ${TEST_USER_NAME}"
fi

# Test for != for the string
if [[ "${USER_NAME}" != "${TEST_USER_NAME}" ]]
then
  echo "Your username does not match ${TEST_USER_NAME}"
  exit 1
fi

exit 0
