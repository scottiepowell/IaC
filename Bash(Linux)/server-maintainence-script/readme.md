# Ubuntu Server 20.04 Update and Configuration Script

This is a Bash script for updating and configuring a Ubuntu Server 20.04 to be NIST 800-53 compliant.

## Purpose

The purpose of this script is to automate the process of updating and configuring a Ubuntu Server 20.04 for NIST 800-53 compliance. It includes functions for setting the timezone, creating a user, configuring SSH, updating the system, and enabling the firewall.

## Possible Use Cases

This script can be useful for anyone who wants to set up a Ubuntu Server 20.04 for NIST 800-53 compliance. It can be used in production environments or for personal projects.

## Execution

To execute the script, simply run the following command:

`sudo bash ubuntu-server-20-04-update-config-script.sh`

## How to Use

1.  Clone the repository:

`git clone https://github.com/username/repo.git`

2.  Navigate to the script directory:


`cd repo/scripts/`

3.  Create a `.env` file with the following variables:

`user1=k3s-user user2=admin-user password=Your_Password`

4.  Run the script:

`sudo bash ubuntu-server-20-04-update-config-script.sh`

5.  Follow the prompts to complete the installation.

## License

This script is licensed under the [MIT License](https://opensource.org/licenses/MIT).