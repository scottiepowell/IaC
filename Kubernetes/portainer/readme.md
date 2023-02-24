## Overview

This is an example ingress YAML file for Portainer. It allows you to access Portainer via a URL, instead of using a NodePort. This is useful if you want to access Portainer from a remote location, or if you want to use a load balancer to distribute traffic to multiple nodes.

## Possible Use Cases

-   Accessing Portainer from a remote location
-   Load balancing traffic to Portainer across multiple nodes
-   Providing a URL for accessing Portainer, instead of a NodePort

## Execution

To use this ingress YAML file, you'll need to have a running Kubernetes cluster and have the Portainer service already deployed.

1.  Create a `values.yaml` file with the desired values. The `values.yaml` file should contain any custom values you want to use when deploying the ingress.

`host: "portainer.your-domain.com" port: "9000"`

2.  Use Helm to install the ingress. Make sure you have Helm installed on your machine before running this command.

`helm install portainer-ingress ./portainer-ingress --values values.yaml`

## How to Use

Once the ingress is installed, you can access Portainer via the URL specified in the `values.yaml` file. In this case, you would navigate to `portainer.your-domain.com` to access the Portainer UI.

If you need to update the ingress later on, simply modify the `values.yaml` file and run the upgrade command:

`helm upgrade portainer-ingress ./portainer-ingress --values values.yaml`