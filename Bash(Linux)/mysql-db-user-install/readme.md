# MySQL Installation and Setup Script

This script installs and sets up a MySQL server on a Ubuntu-based Linux distribution, creates users, and grants them privileges.

## Purpose and Possible Use Cases

The script is intended to automate the setup of a MySQL server and the creation of users and databases. You might use this script if you need to install a MySQL server, create users, and grant them privileges on a single machine or a set of machines.

## Execution

You can run the script in a terminal by running the following command:

`./mysql-setup.sh`

The script will prompt you for the MySQL root password. It will then proceed to install MySQL, set up root authentication method, create users, and grant them privileges.

## How to Use

To use the script, you will need to:

1.  Copy the `mysql-setup.sh` file to your Ubuntu-based machine.
    
2.  Open the terminal on your Ubuntu-based machine and navigate to the folder where you saved the `mysql-setup.sh` file.
    
3.  Run the command `chmod +x mysql-setup.sh` to make the file executable.
    
4.  Create a `.env` file in the same folder as the `mysql-setup.sh` file. In this file, define the following variables:
    
    `password="your_password_here" user1="k3s_internal" user2="k3s_external" database1="k3s_db"`
    
    Replace the values `your_password_here`, `k3s_internal`, `k3s_external`, and `k3s_db` with your own password, username, and database names.
    
5.  Run the command `./mysql-setup.sh`. The script will prompt you for the MySQL root password. Enter the root password and press Enter.
    

The script will then proceed to install MySQL, set up root authentication method, create users, and grant them privileges.

Note: This script assumes that you are running it on a Ubuntu-based machine. It might not work on other distributions or operating systems.