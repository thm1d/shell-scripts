#!/bin/bash

# This script creares a new user on the local system.
# You will be prompted to enter the username (login), the person name and a password
# The username, password and the host for the account will be displayed.

# Make sure the script is being executed with superuser privileges.
if [[ "${UID}" -ne 0 ]]
then
  echo 'Please run with sudo or as root'
  exit 1
fi

# Get the username.
read -p 'Enter the username: ' USER_NAME

# Get the full name.
read -p 'Enter your full name: ' COMMENT

# Get the password.
read -p 'Enter the password: ' PASSWORD

# Create the account.
useradd -c "${COMMENT}" -m ${USER_NAME}

# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn't been.
if [[ "${?}" -ne 0 ]]
then
  echo 'The account could not be created'
  exit 1
fi

# Set the password.
echo ${PASSWORD} |passwd --stdin ${USER_NAME}

if [[ ${?} -ne 0 ]]
then
  echo 'The password could not be set'
  exit 1
fi

# Force password change on first login.
passwd -e ${USER_NAME}

# Display the username, password and the host where the user was created.
echo
echo 'username:'
echo "${USER_NAME}"
echo
echo 'password:'
echo ${PASSWORD}
echo
echo 'host:'
echo "${HOSTNAME}"
exit 0
