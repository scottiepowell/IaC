# Kubernetes Resources Overview

This repository contains a collection of Kubernetes resources that can be used to deploy and run different types of applications on Kubernetes.

## MySQL Deployment

The MySQL Deployment YAML file defines a single replica of a MySQL database. This file is useful when you want to store data in a MySQL database and access it from your application. The purpose of this file is to make it easy to deploy a MySQL database on Kubernetes. The possible use case of this resource is to provide a persistent data store for your application. The execution of this resource involves deploying a single replica of the MySQL image and mounting a secret to it that provides the root password for the MySQL database. To use this file, you can apply it to your Kubernetes cluster by running `kubectl apply -f mysql-deployment.yaml`.

## Nginx HTTP ConfigMap

The Nginx HTTP ConfigMap YAML file defines the Nginx server configuration for serving HTTP traffic. This file is useful when you want to serve a static website or web application over HTTP. The purpose of this file is to make it easy to deploy an Nginx server on Kubernetes that serves HTTP traffic. The possible use case of this resource is to serve a static website or web application. The execution of this resource involves creating a ConfigMap that contains the Nginx server configuration file and deploying a single replica of the Nginx image that mounts the ConfigMap as a volume. To use this file, you can apply it to your Kubernetes cluster by running `kubectl apply -f nginx-http-cm.yaml`.

## Nginx HTTP Deployment

The Nginx HTTP Deployment YAML file defines a single replica of an Nginx server that serves HTTP traffic. This file is useful when you want to serve a static website or web application over HTTP. The purpose of this file is to make it easy to deploy an Nginx server on Kubernetes that serves HTTP traffic. The possible use case of this resource is to serve a static website or web application. The execution of this resource involves deploying a single replica of the Nginx image and mounting the Nginx HTTP ConfigMap as a volume. To use this file, you can apply it to your Kubernetes cluster by running `kubectl apply -f nginx-http-deployment.yaml`.

## Nginx HTTP Service

The Nginx HTTP Service YAML file defines a Kubernetes service for the Nginx HTTP Deployment. This file is useful when you want to expose the Nginx HTTP Deployment to the outside world. The purpose of this file is to make it easy to expose the Nginx HTTP Deployment to the outside world. The possible use case of this resource is to expose a static website or web application to the internet. The execution of this resource involves creating a Kubernetes service that points to the Nginx HTTP Deployment. To use this file, you can apply it to your Kubernetes cluster by running `kubectl apply -f nginx-http-svc.yaml`.

## Nginx HTTPS ConfigMap

The Nginx HTTPS ConfigMap YAML file defines the Nginx server configuration for serving HTTPS traffic. This file is useful when you want to serve a secure static website or web application over HTTPS. The purpose of this file is to make it easy to deploy an Nginx server on Kubernetes that serves HTTPS traffic. The possible use case of this resource is to serve a secure static website or web application. The execution of this resource involves creating a ConfigMap that contains the Nginx server configuration file and deploying a single replica of the Nginx image that mounts the ConfigMap and a secret as a volume. To use this file, you can apply it to your Kubernetes cluster by running `kubectl apply -f nginx-https-cm.yaml`.

## Nginx HTTPS Secret 

The Nginx HTTPS Secret YAML file defines a Kubernetes secret object that holds the SSL/TLS certificate and private key used to encrypt HTTPS traffic for the `nginx-https` deployment. The certificate and key are stored as strings in the secret's `data` field, and are base64-encoded for security.

This secret is used by the `nginx-https` deployment to serve HTTPS traffic. The `nginx-https` deployment is configured to look for the certificate and key in the `/etc/nginx/ssl` directory of the container, which is mounted as a volume using this secret.

To use this secret, you must replace the dummy certificate and key data with your own certificate and key data. To do this, you can replace the values of the `server-cert.pem` and `server-key.pem` keys in the `data` field with the base64-encoded contents of your own certificate and key files.

Once you have updated the `nginx-https-secret.yaml` file, you can create the secret object in your cluster by running the following command:

`kubectl apply -f nginx-https-secret.yaml`

You can then deploy the `nginx-https` deployment and `nginx-https-svc` service using the same process described above.

## Nginx HTTPS ConfigMap 

The Nginx HTTPS ConfigMap YAML file defines a Kubernetes configmap object that holds the Nginx configuration used by the `nginx-https` deployment. The configuration specifies that Nginx should listen on port 80 and 443, and that it should use the SSL/TLS certificate and key stored in the `nginx-https-secret` secret for HTTPS traffic.

This configmap is used by the `nginx-https` deployment to configure the Nginx server. The `nginx-https` deployment is configured to look for the Nginx configuration in the `/etc/nginx` directory of the container, which is mounted as a volume using this configmap.

To use this configmap, you can update the `nginx.conf` key in the `data` field with your own Nginx configuration. Once you have updated the `nginx-https-cm.yaml` file, you can create the configmap object in your cluster by running the following command:

`kubectl apply -f nginx-https-cm.yaml`

You can then deploy the `nginx-https` deployment and `nginx-https-svc` service using the same process described above.