variable "compartment_id" {
  type        = string
  description = "The compartment to create the resources in"
  #default="ocid1.tenancy.oc1..aaaaaaaao6x7uwzfuasfh5ia5qz4zhw4j7oxl6hkhxq4vc7vdqchyxde3una"
}

variable "region" {
  type        = string
  description = "The region to provision the resources in"
  #default="us-phoenix-1"
}

variable "ssh_public_key" {
  type        = string
  description = "The SSH public key to use for connecting to the worker nodes"
  #default="/root/.oci/oci_api_key_public.pem"
}
# export TF_VAR_compartment_id="ocid1.tenancy.oc1..aaaaaaaao6x7uwzfuasfh5ia5qz4zhw4j7oxl6hkhxq4vc7vdqchyxde3una"
# export TF_VAR_region="us-phoenix-1"
# export TF_VAR_ssh_public_key="/home/scott/.ssh/keys/id_rsa.pub"
