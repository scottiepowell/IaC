#!/bin/bash

# update package manager
sudo apt -y update

# install nginx
sudo apt install nginx

# create self-signed SSL certificate
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

# create SSL configuration file
sudo bash -c 'cat > /etc/nginx/snippets/self-signed.conf <<EOF
ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
EOF'

# update nginx configuration to use SSL
sudo sed -i 's/http {/http {\n\n    include snippets\/self-signed.conf;\n    server_tokens off;/g' /etc/nginx/nginx.conf

# enable nginx to start on boot
sudo systemctl enable nginx

# start nginx
sudo systemctl start nginx
