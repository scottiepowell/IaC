# CIVO Terraform Resources

This repository contains terraform resources that can be used to deploy a kubernetes cluster or linux servers on Civo cloud. These resources have been created for learning purposes and are not intended for production environments.

## Usage

To use these resources, you need to have a Civo API token. This token can be generated on the Civo dashboard.

### Kubernetes Cluster

Use the following resources to create a new kubernetes cluster on Civo.

-   `civo_kubernetes_cluster`: Creates a new kubernetes cluster on Civo.
    
-   `time_sleep`: Sleeps for a few seconds after cluster deployment.
    

Use the `data.civo_size` and `data.civo_disk_image` resources to query instance sizes and disk images respectively.

### Linux Server

Use the following resources to create a new linux server on Civo.

-   `civo_instance`: Creates a new linux server on Civo.

Use the `data.civo_size`, `data.civo_disk_image` and `data.civo_ssh_key` resources to query instance sizes, disk images and ssh keys respectively.

### SSH Keys

Use the following resources to create or query ssh keys on Civo.

-   `civo_ssh_key`: Creates a new ssh key on Civo.
    
-   `data.civo_ssh_key`: Queries an existing ssh key on Civo.
    

## Installation

1.  Clone this repository to your local machine.
    
    `git clone https://github.com/<your-username>/civo-terraform-resources.git`
    
2.  Navigate to the cloned repository.
    
    `cd civo-terraform-resources`
    
3.  Install the `civo` provider.
    
    `terraform init`
    
4.  Create a new `terraform.tfvars` file and add your `civo_token`.
    
    `civo_token = "your_civo_token_here"`
    
5.  Run the `terraform apply` command to create the desired resource.
    
    `terraform apply`
    

## Conclusion

These resources serve as a good starting point for deploying a kubernetes cluster or linux servers on Civo cloud using terraform. For more information on the Civo provider, visit the official [documentation](https://registry.terraform.io/providers/civo/civo/latest/docs).