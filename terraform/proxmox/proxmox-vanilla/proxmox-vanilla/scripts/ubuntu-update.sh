#!/bin/bash
# Set the timezone to Denver, CO
echo "setting time to denver $(sudo timedatectl set-timezone America/Denver)"

# Enable ufw firewall and pipe 'yes' to the follow on question to enable the firewall
#echo "enabling firewall $(yes | sudo ufw enable)"

# Allow incoming traffic on ports 22, 80, and 443
#sudo ufw allow 22
#sudo ufw allow 80
#sudo ufw allow 443

# Allow all outgoing traffic
#echo "allow outbound traffic on firewall $(sudo ufw default allow outgoing)"
#
echo "finished the firewall install"
sudo apt -y update
sleep 30
#sudo apt -y upgrade
#sleep 180
sudo apt install unattented-upgrades
#sleep 10
sudo apt install update-notifier-common
sleep 10 

echo "finished the apt update and upgrades"

# Backup the original file
sudo cp /etc/apt/apt.conf.d/50unattended-upgrades /etc/apt/apt.conf.d/50unattended-upgrades.bak

# Location of the config file for 50unattended-upgrades
CONFIG_FILE="/etc/apt/apt.conf.d/50unattended-upgrades"

# Use sed to uncomment and change the line
sudo sed -i 's/^#\(Unattended-Upgrade::Automatic-Reboot "\)false\(";\)$/\1true\2/' "$CONFIG_FILE"

# Print the updated line to confirm the change
sudo grep '^Unattended-Upgrade::Automatic-Reboot' "$CONFIG_FILE"

echo "finished the install script"

# verify that distro_id lines for distro code name and security are uncommented
# verify that automatic-Reboot "false" is uncommented and turned to "True"
# verify that automatic-upgrade:Automatic-Reboot-Time is uncommented and time is set to your liking
# '//Unattended-Upgrade::Automatic-Reboot "false";' remove the '//' comments and change to "true"
# '//Unattended-Upgrade::Automatic-Reboot-Time "02:00"; remove the '//' and set the time to "02:00"

#sudo nano 20auto-upgrades
# make sure the lines are both set to "1" for enabled




