#!/bin/bash
SECRET_PATH="../../.secrets"
# Load Docker username from a file
DOCKER_USERNAME=$(cat "$SECRET_PATH/DOCKER_USERNAME")

# Path to the file containing Docker password
DOCKER_PASSWORD_FILE="$SECRET_PATH/DOCKER_PASSWORD"

# Perform Docker login using --password-stdin
echo "Docker login..."
cat ${DOCKER_PASSWORD_FILE} | docker login -u ${DOCKER_USERNAME} --password-stdin

# Check if login was successful
if [ $? -ne 0 ]; then
  echo "Docker login failed."
  exit 1
fi
