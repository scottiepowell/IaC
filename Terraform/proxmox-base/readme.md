# Provision Virtual Machines on a Proxmox Cluster

This Terraform script allows you to provision virtual machines on a Proxmox cluster using full-cloning. This way, you can quickly spin up multiple VMs that have the same configuration as your base template.

## Purpose

The purpose of this script is to make it easier to create and manage VMs on a Proxmox cluster. By using full-cloning, you can save time and effort by not having to configure each VM individually.

## Possible Use Cases

Some of the possible use cases for this script include:

-   Setting up a test environment for DevOps tools and technologies like Terraform
-   Creating a lab environment for testing different software configurations
-   Spinning up multiple VMs for load testing

## How to Install and Use

How to Install and Use

Clone the repository to your local machine.

Create a credentials.auto.tfvars file and set the following variables with your Proxmox API credentials and other configurations:

`proxmox_api_url = "https://your.proxmox.server" proxmox_api_token_id = "your_token_id" proxmox_api_token_secret = "your_token_secret" ssh_user = "your_ssh_user" ssh_public_key = "your_ssh_public_key" ssh_private_key = "your_ssh_private_key" root_password = "your_vm_root_password" vm_count = "your_vm_count" vm_name = "your_vm_name" vm_desc = "your_vm_description" public_ip = ["your_vm_0_ip_address", "your_vm_1_ip_address", ...] vmid = ["your_vm_0_id", "your_vm_1_id", ...]`

Run terraform init to initialize the provider and modules.

Run terraform plan to see what resources will be created.

Run terraform apply to provision the virtual machines.

Once the virtual machines are provisioned, you can access them using SSH and the IP addresses provided in the outputs.

Once the virtual machines are provisioned, you can access them using SSH and the IP addresses provided in the outputs.

## Using Proxmox as a Development Environment

Proxmox can be a powerful tool for setting up a development environment to test DevOps tools and technologies like Terraform. By using full-cloning, you can quickly create multiple VMs with different configurations to test your code in different environments.

For example, you can create a base template with a specific Linux distribution and pre-installed software. Then, you can use Terraform to provision multiple VMs that have the same configuration as your base template but with different versions of the software. This way, you can test your code in different environments without having to set up each environment manually.

Overall, Proxmox can be a valuable tool for developers and DevOps professionals who need to create and manage virtual machines quickly and easily.

Cheers, Scottie