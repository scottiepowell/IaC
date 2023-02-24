# Overview

This bash script installs Docker and Docker Compose on a Linux system, along with a tool called `dockerd-rootless-setuptool.sh`. The script installs Docker Compose, checks its version, and restarts the Docker service.

# Installation and Usage

To use this script, simply save the code to a file, make the file executable using the command `chmod +x <filename>`, and then run the file using the command `./<filename>`.

For example, if you save the code to a file named `install-docker.sh`, you can make the file executable with the command `chmod +x install-docker.sh`. Then you can run the script with the command `./install-docker.sh`.

Please note that the script requires that you have root access to the system to install Docker and Docker Compose. It's also worth noting that the script is designed for Linux systems and has only been tested on Ubuntu, so it may not work on other distributions.

We hope this script is helpful in getting Docker and Docker Compose up and running quickly and easily. Please feel free to modify and extend it to suit your needs!