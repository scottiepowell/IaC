# Cloudflare Terraform Resources

This Terraform module provides resources to interact with the Cloudflare API to manage your DNS records.

## Prerequisites

Before using these resources, you need to have a Cloudflare account and API key. You should also have an understanding of how to use Terraform.

## Usage

To use this module, you need to specify the email address and API key for your Cloudflare account. You can then use the `cloudflare_record` resource to manage your DNS records.

For example, to create an A record, you can use the following code:

`resource "cloudflare_record" "your-dns-record-name" {     zone_id = "your-zone-id"     name = "your-public-dns-value"     value =  "your-public-ip-address"     type = "A"     proxied = false  # set to true, to hide public IP }`

## Resources

### Cloudflare Credentials

These are the credential variables needed to authenticate with the Cloudflare API.

#### `cloudflare_email`

The email address for your Cloudflare account.

#### `cloudflare_api_key`

The API key for your Cloudflare account.

### Cloudflare DNS

These resources allow you to manage your DNS records on Cloudflare.

#### `cloudflare_record`

Creates a new DNS record.

Example usage:

`resource "cloudflare_record" "your-dns-record-name" {     zone_id = "your-zone-id"     name = "your-public-dns-value"     value =  "your-public-ip-address"     type = "A"     proxied = false  # set to true, to hide public IP }`

#### `cloudflare_proxied_record`

Creates a new proxied DNS record.

Example usage:

`resource "cloudflare_proxied_record" "your-dns-record-name" {     zone_id = "your-zone-id"     name = "your-public-dns-value"     value =  "your-public-ip-address"     type = "A" }`

### Cloudflare Provider

These resources are used to configure the Cloudflare provider.

#### `cloudflare_provider`

Initial configuration for the Cloudflare provider.

Example usage:

`terraform {   required_providers {     cloudflare = {       source  = "cloudflare/cloudflare"       version = "~> 3.0"     }   } }  provider "cloudflare" {   email   = var.cloudflare_email   api_key = var.cloudflare_api_key }`

## Conclusion

That's it! With these resources, you can manage your DNS records on Cloudflare using Terraform. Let me know if you have any questions!