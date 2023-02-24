# Terraform for Kubernetes on Oracle Cloud Infrastructure

This repository contains Terraform files to provision a Kubernetes cluster on Oracle Cloud Infrastructure (OCI).

The Terraform scripts create a Virtual Cloud Network (VCN) with a public and private subnet, an Internet Gateway (IGW), a NAT Gateway, and a Service Gateway.

The Terraform scripts also provision a Kubernetes cluster and a node pool in the private subnet, with the Kubernetes API endpoint exposed via an OCI Network Load Balancer.

## Purpose

The purpose of this project is to simplify the creation of a Kubernetes cluster on OCI by providing Terraform scripts to automate the process. The scripts create all the necessary resources to run a Kubernetes cluster, including VCN, subnets, gateways, and Kubernetes nodes.

## Use Cases

This Terraform script can be used to create a Kubernetes cluster on OCI. The script can be used to deploy and manage workloads on the cluster. This can be useful for:

-   Running containerized workloads in a scalable and highly available manner
-   Deploying microservices-based architectures
-   Developing and testing applications in a production-like environment

## Execution

1.  Clone the repository
2.  Update the variables in `variables.tf` with your own values
3.  Run `terraform init` to initialize the project
4.  Run `terraform plan` to see what resources will be created
5.  Run `terraform apply` to create the resources

## How to Use

1.  After the cluster is created, update the Kubernetes config file with the cluster endpoint and credentials. This is usually located at `~/.kube/config`.
2.  Verify that the cluster is up and running by running `kubectl get nodes`.
3.  Deploy workloads to the cluster using `kubectl apply`.

## Conclusion

With this Terraform script, it's easy to create a Kubernetes cluster on Oracle Cloud Infrastructure. The script creates all the necessary resources and provisions a highly available and scalable Kubernetes cluster.