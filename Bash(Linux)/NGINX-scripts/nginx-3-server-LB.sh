#!/bin/bash

# Disable UFW firewall
sudo ufw disable

# Update the package index
sudo apt update

# Install nginx
sudo apt install nginx -y

# Stop nginx service
sudo systemctl stop nginx

# Start nginx service
sudo systemctl start nginx

# Enable nginx service to start on boot
sudo systemctl enable nginx

# Create nginx configuration file
sudo bash -c "cat > /etc/nginx/sites-available/load_balancer <<EOF
upstream backend {
  least_conn;
  server 192.168.2.30:6443 weight=1;
  server 192.168.2.31:6443 weight=1;
  server 192.168.2.32:6443 weight=1;
}

server {
  listen 6443;

  location / {
      proxy_pass http://backend;
  }

  location /health {
    # Return HTTP status code 200 if the load balancer is healthy
    return 200;
  }
}
EOF
"

# Create symbolic link of the configuration file in the sites-enabled directory
sudo ln -s /etc/nginx/sites-available/load_balancer /etc/nginx/sites-enabled/

# Stop nginx service
sudo systemctl stop nginx

# Start nginx service
sudo systemctl start nginx

# Wait for 30 seconds for the server to start
sleep 30

# Check if the upstream backend can reach the servers on port 6443
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

# Check the health of the load balancer using a health check endpoint
response=$(curl -s -o /dev/null -w "%{http_code}" http://192.168.2.40:6443/health)
if [ "$response" == "200" ]; then
  # Set the "healthy" variable to 1 if the load balancer is healthy
  sudo bash -c "echo 'set \$healthy 1;' >> /etc/nginx/sites-available/load_balancer"
else
  # Set the "healthy" variable to 0 if the load balancer is not healthy
  sudo bash -c "echo 'set \$healthy 0;' >> /etc/nginx/sites-available/load_balancer"
fi


