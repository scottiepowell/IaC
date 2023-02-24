# Nginx Kubernetes Resources

This repository contains three Kubernetes resources to deploy an Nginx web server in a Kubernetes cluster. The resources are a ConfigMap for Nginx configuration, a Deployment to run the Nginx container, and a Service to expose the Nginx container to the internet.

## Purpose and Possible Use Cases

These resources are designed to help you deploy an Nginx web server in a Kubernetes cluster. The resources can be modified to suit your specific use case.

## Execution

To use these resources, you need to run the following command:

`kubectl apply -f nginx-resources.yaml`

## Description of the Resources

### ConfigMap

The ConfigMap is used to store the Nginx configuration. The configuration is specified in the `nginx.conf` file. You can modify the configuration to suit your specific use case.

### Deployment

The Deployment is used to run the Nginx container. The container is based on the official Nginx image. The container is configured to use the configuration specified in the ConfigMap. The container is also configured to use a volume to store the HTML files that will be served by the web server. The volume is specified in the Deployment YAML file.

### Service

The Service is used to expose the Nginx container to the internet. The Service is configured to use a LoadBalancer. The LoadBalancer is used to route traffic to the Nginx container.

## How to Use

To use these resources, you need to run the following command:

`kubectl apply -f nginx-resources.yaml`

Once the resources are applied, you can access the web server by visiting the IP address of the LoadBalancer. The IP address can be obtained by running the following command:

`kubectl get services nginx-http-svc`

This will return the IP address of the LoadBalancer. You can then visit the IP address in your web browser to access the Nginx web server.