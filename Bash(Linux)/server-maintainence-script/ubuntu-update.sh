#!/bin/bash

# Functions Section

# Define a countdown function
countdown() {
  # Get the argument passed to the function
  local count=$1

  # Use a while loop to decrement the counter and display the count
  # -gt is a comparison perator to determine value on left side is greater than value on right
  # for each count, the sleep count is run for 30 seconds
  while [ $count -gt 0 ]; do
    echo "Countdown: $count seconds remaining"
    count=$((count-30))
    sleep 30
  done

  # Display message after countdown is complete
  echo "Countdown complete!"
}

# Call the countdown function
sleep 10

# Set the timezone to Denver, CO
echo "setting time to denver $(sudo timedatectl set-timezone America/Denver)"

echo "load and echo all the variables in .env file"
source /tmp/scripts/.env

# Echo all variables in the /tmp/scripts/.env file to the command line
for var in $(cat /tmp/scripts/.env | awk -F= '{print $1}'); do
  echo "$var=${!var}"
done
sleep 3

echo "User setup section of the script, setting up $user1"
sleep 10

# Create user1 
user1=$user1
user2=$user2
password=$password
echo "adding user $user1 to server $(sudo useradd -m $user1)"
# Set password for k3s-user to secret
echo "$user1:$password" | sudo chpasswd
# Add k3s-user to sudo group
echo "add $user1 to sudo group $(sudo usermod -aG sudo $user1)"
# Create an environment file to store the password
echo "adding environment file to store password $(sudo -u root bash -c 'echo "K3S_PASSWORD=$password" >> /etc/environment')"
# make the home directory for users
sudo mkdir /home/$user1
sudo chown $user1:$user1 /home/$user1
sudo chsh -s /bin/bash $user1

##########
echo "SSH setup section of the script"
echo "SSH setup of $user1, $user2"
sleep 10

# Copy public SSH keys from /home/user2 to /home/$user1
sudo mkdir /home/$user1/.ssh
sudo cp /home/$user2/.ssh/authorized_keys /home/$user1/.ssh/
sudo chown -R $user1:$user1 /home/$user1/.ssh
sudo chmod 700 /home/$user1/.ssh
sudo chmod 600 /home/$user1/.ssh/authorized_keys

# Create a group called sshusers and add users root, user2, and $user1 to the group
sudo groupadd sshusers
sudo usermod -aG sshusers root
sudo usermod -aG sshusers $user2
sudo usermod -aG sshusers $user1

# Add the sshusers group to /etc/ssh/sshd_config
# must use sudo sh -c to run the echo and append command as superuser
sudo sh -c 'echo "AllowGroups sshusers" >> /etc/ssh/sshd_config'

# Verify the changes to /etc/ssh/sshd_config
grep "AllowGroups sshusers" /etc/ssh/sshd_config
if [ $? -eq 0 ]; then
  echo "Changes to /etc/ssh/sshd_config successful"
else
  echo "Changes to /etc/ssh/sshd_config failed"
fi

# Restart the ssh service to apply changes
sudo systemctl restart ssh

##########
echo "System updates and upgrades"

sudo apt-get -y update 2> /dev/null
sleep 10
sudo apt-get -y upgrade 2> /dev/null
countdown 100
sudo apt install unattended-upgrades
sleep 5
sudo apt install update-notifier-common
sleep 5 

echo "finished the apt update and upgrades"

# Backup the original file
sudo cp /etc/apt/apt.conf.d/50unattended-upgrades /etc/apt/apt.conf.d/50unattended-upgrades.bak

# Location of the config file for 50unattended-upgrades
CONFIG_FILE="/etc/apt/apt.conf.d/50unattended-upgrades"

# Use sed to uncomment and change the line
sudo sed -i 's/^#\(Unattended-Upgrade::Automatic-Reboot "\)false\(";\)$/\1true\2/' "$CONFIG_FILE"

# Print the updated line to confirm the change
sudo grep '^Unattended-Upgrade::Automatic-Reboot' "$CONFIG_FILE"

###########
echo "Firewall Section of the script"
sleep 5
# Enable ufw firewall and pipe 'yes' to the follow on question to enable the firewall
#echo "enabling firewall $(yes | sudo ufw enable)"

# Allow incoming traffic on ports 22, 80, and 443
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443

# Allow all outgoing traffic
echo "allow outbound traffic on firewall $(sudo ufw default allow outgoing)"
#
echo "finished the firewall install"

echo "SSH setup section of the script"
sleep 5

echo "finished the install script"

# verify that distro_id lines for distro code name and security are uncommented
# verify that automatic-Reboot "false" is uncommented and turned to "True"
# verify that automatic-upgrade:Automatic-Reboot-Time is uncommented and time is set to your liking
 '//Unattended-Upgrade::Automatic-Reboot "false";' remove the '//' comments and change to "true"
 '//Unattended-Upgrade::Automatic-Reboot-Time "02:00"; remove the '//' and set the time to "02:00"





