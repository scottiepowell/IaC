#!/bin/bash

sleep 20

curl -fsSL https://get.docker.com -o get-docker.sh

sleep 180

sh get-docker.sh

sleep 600

sudo apt-get install -y uidmap

sleep 20

dockerd-rootless-setuptool.sh install
