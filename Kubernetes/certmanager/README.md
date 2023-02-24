# Installation

## Deployment

To install Cert-Manager, the first step is to add the Helm repository and update it. This can be done with the following command:

`helm repo add jetstack https://charts.jetstack.io  helm repo update`

After this, you can proceed to install Cert-Manager with Helm and CRDs using the following command:

`helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --set installCRDs=true`

This will deploy the necessary resources in your cluster to run Cert-Manager.

## Configuration

Once Cert-Manager is deployed, you can start adding your Issuer or ClusterIssuer Objects, Credentials, and Certificates. You can refer to the official Cert-Manager documentation for more information on how to do this.

# Best Practices and Post-Installation

## Troubleshooting

In case you face any issues with Cert-Manager, you can troubleshoot them and inspect log entries for the Certificate Objects using the `kubectl describe` command. The official Cert-Manager troubleshooting guide can help you with this.

# Additional References

You can refer to the official Cert-Manager documentation for more information on how to deploy and configure Cert-Manager in your cluster.