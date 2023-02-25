# Helm Charts for Certmanager and Traefik

This Terraform script provides two Helm charts for deploying Certmanager and Traefik onto your Kubernetes cluster. With these resources, you can use Certmanager to automatically generate and manage SSL/TLS certificates, while Traefik can serve as your ingress controller for routing incoming traffic to different services running on your cluster.

## Certmanager

Certmanager is a Kubernetes add-on that automates the management and issuance of TLS/SSL certificates. This Helm chart will deploy Certmanager onto your cluster, and install the necessary CRDs required for managing certificates and issuing them via supported certificate authorities.

### Installation

To install Certmanager, you can run the following command:


`terraform apply -target=helm_release.certmanager`

### Usage

Once Certmanager has been installed on your cluster, you can define a certificate issuer and certificate manifests to generate and manage SSL/TLS certificates. Here's an example:

`apiVersion: cert-manager.io/v1 kind: ClusterIssuer metadata:   name: letsencrypt-staging spec:   acme:     server: https://acme-staging-v02.api.letsencrypt.org/directory     email: user@example.com     privateKeySecretRef:       name: letsencrypt-staging     solvers:     - http01:         ingress:           class: traefik  --- apiVersion: cert-manager.io/v1 kind: Certificate metadata:   name: example-com spec:   secretName: example-com-tls   issuerRef:     name: letsencrypt-staging     kind: ClusterIssuer   commonName: example.com   dnsNames:   - example.com   - www.example.com`

## Traefik

Traefik is a modern, dynamic, and flexible reverse-proxy and load-balancing tool. It is also a cloud-native edge router that allows you to route incoming traffic to different services running on your Kubernetes cluster. This Helm chart will deploy Traefik onto your cluster, and set it as the default ingress controller.

### Installation

To install Traefik, you can run the following command:
`terraform apply -target=helm_release.traefik`

### Usage

Once Traefik has been installed on your cluster, you can configure it to route incoming traffic to different services running on your cluster. Here's an example:


`apiVersion: networking.k8s.io/v1beta1 kind: Ingress metadata:   name: whoami   annotations:     kubernetes.io/ingress.class: traefik spec:   rules:   - host: whoami.example.com     http:       paths:       - path: /         backend:           serviceName: whoami           servicePort: 80`

This will route incoming traffic for `whoami.example.com` to the `whoami` service running on port 80.

Note that you need to have a DNS record pointing to the IP address of your Kubernetes cluster for this to work.

I hope that helps! Let me know if you have any questions.

Cheers, Scottie
