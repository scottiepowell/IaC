# Kubernetes Resources for Web Deployment

This is a set of Kubernetes resources that can be used to deploy and run a web server on a Kubernetes cluster. It includes Persistent Volume Claims and Deployments for various types of storage classes.

## Civo

Civo is a cloud computing platform that provides scalable, high-performance and cost-effective cloud infrastructure for developers, startups and small businesses. The platform is built on top of Kubernetes, making it a great choice for teams that are already familiar with the technology. Civo also provides easy-to-use tools and integrations that allow developers to quickly deploy and manage their applications.

### Persistent Volume Claim

The `Civo` Persistent Volume Claim YAML file defines a 1Gi storage claim using the `civo-volume` storage class for the Civo cloud provider.

### Deployment

The `Civo-Web` Deployment YAML file defines a Deployment of the `nginx` image that creates a single replica of a containerized web server, mounts the `Civo` PVC to store HTML content, and exposes it via a LoadBalancer service.

## Local Storage

### Deployment

The `Local-Web` Deployment YAML file defines a Deployment of the `nginx` image that creates a single replica of a containerized web server, mounts a host path `/var/nginxserver` to store HTML content, and exposes it via a LoadBalancer service.

## NFS

### Persistent Volume

The `NFS` Persistent Volume YAML file defines a 500Mi storage volume using the `nfs` storage class. It specifies an NFS server IP address and path to be used as the NFS storage.

### Persistent Volume Claim

The `NFS` Persistent Volume Claim YAML file defines a 100Mi storage claim using the `nfs` storage class.

### Deployment

The `NFS-Web` Deployment YAML file defines a Deployment of the `nginx` image that creates a single replica of a containerized web server, mounts the `NFS` PVC to store HTML content, and exposes it via a LoadBalancer service.

To use these resources, follow these steps:

1.  Create the necessary Kubernetes resources by running the `kubectl apply` command.

`kubectl apply -f civo-pvc.yaml kubectl apply -f civo-deployment.yaml kubectl apply -f local-deployment.yaml kubectl apply -f nfs-pv.yaml kubectl apply -f nfs-pvc.yaml kubectl apply -f nfs-deployment.yaml`

2.  Verify that the resources are created and running using the `kubectl get` command.

`kubectl get pvc kubectl get pv kubectl get deployments kubectl get services`

That's it! You should now have a running web server on your Kubernetes cluster.