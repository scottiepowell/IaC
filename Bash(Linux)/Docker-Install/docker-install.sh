#!/bin/bash

#This script is used to install and configure Docker and Docker Compose. The script downloads the script to install Docker, 
#installs uidmap package,
#installs Docker rootless setup tool, installs Docker Compose, checks its version, and finally restarts the Docker service.
#To use this script, save the script as a .sh file and run it in your terminal by executing bash scriptname.sh or ./scriptname.sh. 
#Before running, make sure to set the appropriate permissions for the file using the command chmod +x scriptname.sh to make it executable.

# Download the script to install Docker
curl -fsSL https://get.docker.com -o get-docker.sh

# Wait for 100 seconds before running the script
sleep 100

# Run the script to install Docker
sh get-docker.sh

# Wait for 100 seconds before continuing
sleep 100

# Install the uidmap package, which is required for running Docker in rootless mode
sudo apt-get install -y uidmap

# Wait for 60 seconds
sleep 60

# Install the Docker rootless setup tool
dockerd-rootless-setuptool.sh install

# Wait for 10 seconds
sleep 10

# Install Docker Compose
sudo apt -y install docker-compose

# Check the version of Docker Compose
docker-compose --version

# Restart the Docker service
service docker restart



