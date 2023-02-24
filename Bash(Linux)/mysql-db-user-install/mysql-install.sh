#!/bin/bash

# Load the environment variables from the .env file
source .env

# the -n option prevents a newline character from being added to the end of the string
password_base64=$(echo -n "$MYSQL_PASSWORD" | base64)
hostname=$(hostname -I)
user1="k3s_internal"
user2="k3s_external"
database1="k3s_db"
echo "$hostname"
echo "$password_base64"

# Create an environment file to store the password
echo "adding environment file to store password $(sudo -u root bash -c 'sudo echo "MYSQL__PASSWORD=$MYSQL_PASSWORD" >> /etc/environment')"

# STEP 1: Installing MySQL
if dpkg-query -W mysql-server; then
  echo "MySQL Server is already installed, skipping installation."
else
  echo "Installing mysql Server"
  sudo apt update
  sudo apt install mysql-server -y
  sudo systemctl start mysql.service
fi

# STEP 2: Set password using mysql_native_password method
echo "set mysql_native_password authentication method" 
sudo mysql --user=root --password=$password_base64 2>/dev/null <<EOF > output_mysql.txt
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$password_base64';
EOF
# STEP 2.1: Delete Anonymous Users
echo "Delete Anonymous users..."
sudo mysql --user=root --password=$password_base64 2>/dev/null <<EOF >> output_mysql.txt
DELETE FROM mysql.user WHERE User='';
# "Ensure the root user can not log in remotely"
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
# "Remove the test database "
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED WITH auth_socket;
EOF
echo "Finish Step 2: Security setup"

echo "Step 3: MySQL User Setup and Granting Privileges"
if sudo mysql --user=$user1 --password=$password_base64 2>/dev/null <<EOF; then
CREATE USER '$user1'@'localhost' IDENTIFIED WITH caching_sha2_password BY '$password_base64';
CREATE USER '$user2'@'localhost' IDENTIFIED WITH caching_sha2_password BY '$password_base64';
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, INDEX, DELETE, SELECT, REFERENCES, RELOAD on *.* TO '$user1'@'localhost' WITH GRANT OPTION;
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, INDEX, DELETE, SELECT, REFERENCES, RELOAD on *.* TO '$user2'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF
echo "mysql users setup complete"
else
  echo "all the mysql users already exists, skipping setup"
fi
# Execute the SQL query to retrieve user privileges
sudo mysql --user="$user1" --password="$password_base64" -e "SHOW GRANTS FOR '$user1'@'localhost';" 2>/dev/null
sudo mysql --user="$user2" --password="$password_base64" -e "SHOW GRANTS FOR '$user2'@'localhost';" 2>/dev/null
echo "Finished with mysql server installation"

echo "Create the K3s database"
if sudo mysql -u "$user1" -p"$password_base64" -e "CREATE DATABASE $database1;" 2>/dev/null; then
 


