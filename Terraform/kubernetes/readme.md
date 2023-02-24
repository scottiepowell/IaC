# Kubernetes Terraform Resources

This repository provides Terraform resources for deploying a Kubernetes infrastructure. It includes resources for deploying a Kubernetes deployment, a Kubernetes ingress, a Kubernetes secret, and a Kubernetes service.

## Deployment

The Kubernetes deployment resource deploys a containerized application. It creates a deployment resource and a pod template. The resource includes a container that runs a specified image and exposes a specified port.

## Ingress

The Kubernetes ingress resource creates an ingress object that exposes the HTTP and HTTPS routes from outside the cluster to services within the cluster. It allows external traffic to access the cluster services. The resource includes a set of rules for routing HTTP and HTTPS traffic.

## Secret

The Kubernetes secret resource provides a way to store and manage sensitive data such as passwords, tokens, and API keys. The secret resource creates a secret object and stores the sensitive data within it.

## Service

The Kubernetes service resource creates a service object that enables communication between different pods within the cluster. It provides a stable IP address and DNS name that other pods can use to communicate with the service.

## Installation

1.  Clone the repository to your local machine.
2.  Create a Kubernetes namespace.
3.  Modify the variables in the `terraform.tfvars` file to match your desired configuration.
4.  Run `terraform init` to initialize the project.
5.  Run `terraform apply` to create the Kubernetes resources.

## Usage

1.  Access the Kubernetes deployment by running `kubectl port-forward deployment/your-deployment 8080:80`.
2.  Access the Kubernetes service by running `kubectl port-forward service/your-service 8080:80`.
3.  Access the Kubernetes ingress by running `kubectl port-forward deployment/your-ingress 8080:80`.
4.  Access the Kubernetes secret by running `kubectl get secret/cloudflare-api-key-secret -o jsonpath='{.data.api-key}' | base64 --decode`.

## Conclusion

this repository provides Terraform templates for Kubernetes resources and Cloudflare DNS configuration that help simplify the process of provisioning and managing cloud infrastructure. The templates enable a modular approach to building infrastructure that can be adapted to different use cases. They provide the flexibility to choose resources based on user needs, enabling a custom approach to building infrastructure. With the use of these templates, developers and infrastructure engineers can reduce the time required for infrastructure setup and configuration. The templates offer an opportunity to reduce human error and increase the efficiency and speed of infrastructure deployment. Overall, these templates provide a valuable tool for those looking to provision and manage Kubernetes resources and DNS records in a cloud infrastructure.