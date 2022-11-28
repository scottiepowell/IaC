variable "compartment_id" {
  type        = string
  description = "The compartment to create the resources in"
  #default="ocid1.tenancy.oc1..aaaaaaaao6x7uwzfuasfh5ia5qz4zhw4j7oxl6hkhxq4vc7vdqchyxde3una"
}
variable "public_subnet_id" {
  type = string
  description = "The public subnet's OCID"
}
variable "node_pool_id" {
  type = string
  description = "The OCID of the Node Pool where the compute instances reside"
}
variable "region" {
  type        = string
  description = "The region to provision the resources in"
}
variable "ssh_public_key" {
  type        = string
  description = "The SSH public key to use for connecting to the worker nodes"
}
