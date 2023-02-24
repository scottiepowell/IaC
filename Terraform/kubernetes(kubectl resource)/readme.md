# Terraform Kubectl Provider

This Terraform module provides the ability to use `kubectl` to apply manifests to Kubernetes. The `kubectl_manifest` resource allows you to apply a Kubernetes manifest file, which can be used to manage deployments, services, ingress rules, secrets, and more.

## `kubectl_manifest` Resource

The `kubectl_manifest` resource allows you to specify a Kubernetes manifest file to be applied to your cluster. You can put your manifest file content directly into the `yaml_body` attribute, or reference the manifest file using the `file()` function. This resource is useful when you need to deploy a resource that is not supported by other Terraform resources.

## Kubectl Provider

The `kubectl` provider allows Terraform to interact with a Kubernetes cluster using the `kubectl` command-line tool. This provider requires that `kubectl` is installed on the machine running Terraform.

To use the `kubectl` provider, you must first configure the provider block with the `host`, `client_certificate`, `client_key`, and `cluster_ca_certificate` attributes, which define the endpoint and security credentials for your Kubernetes cluster.

Once the provider is configured, you can use the `kubectl` command to manage Kubernetes resources using Terraform. This includes creating and deleting resources, as well as applying changes to existing resources.

## Conclusion

This Terraform module provides a convenient way to manage Kubernetes resources using `kubectl`. By using the `kubectl_manifest` resource and the `kubectl` provider, you can easily deploy any Kubernetes resource that is not supported by other Terraform resources. The `kubectl` provider is also useful when you need fine-grained control over the configuration of your Kubernetes cluster.