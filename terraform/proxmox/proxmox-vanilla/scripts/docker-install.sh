#!/bin/bash

curl -fsSL https://get.docker.com -o get-docker.sh

sleep 100

sh get-docker.sh

sleep 100

sudo apt-get install -y uidmap

sleep 60

dockerd-rootless-setuptool.sh install
