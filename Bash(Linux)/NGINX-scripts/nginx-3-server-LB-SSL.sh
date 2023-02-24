#!/bin/bash

sudo ufw disable

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

# Create nginx configuration file
sudo bash -c "cat > /etc/nginx/sites-available/load_balancer <<EOF
upstream backend {
  least_conn;
  server 192.168.2.30:6443 weight=1;
  server 192.168.2.31:6443 weight=1;
  server 192.168.2.32:6443 weight=1;
}
server {
  listen 6443 ssl;

  location / {
      proxy_pass http://backend;
    }
  location /health {
    return 200;
  }
}
EOF
"

# Create symbolic link of the configuration file in the sites-enabled directory
sudo ln -s /etc/nginx/sites-available/load_balancer /etc/nginx/sites-enabled/

# enable nginx to start on boot
sudo systemctl enable nginx

# start nginx
sudo systemctl start nginx

sleep 30

echo "Verifying if the upstream backend can reach the servers on port 6443..."
servers=(192.168.2.30 192.168.2.31 192.168.2.32)
for j in {1..30}; do
  for i in "${!servers[@]}"; do
    server=${servers[i]}
    if nc -w 1 $server 6443; then
      echo "Server $server is reachable on port 6443."
      break 2
    else
      echo "Error: Server $server is not reachable on port 6443."
    fi
    if [ $i -eq $(( ${#servers[@]} - 1 )) ]; then
      i=-1
    fi
  done
done

response=$(curl -s -o /dev/null -w "%{http_code}" https://192.168.2.40:6443/health --insecure)
if [ "$response" == "200" ]; then
  sudo bash -c "echo 'set \$healthy 1;' >> /etc/nginx/sites-available/load_balancer"
else
  sudo bash -c "echo 'set \$healthy 0;' >> /etc/nginx/sites-available/load_balancer"
fi

# stop and start nginx to apply the new configuration
sudo systemctl stop nginx
sudo systemctl start nginx
