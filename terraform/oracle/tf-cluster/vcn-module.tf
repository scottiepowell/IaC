module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "3.1.0"

  compartment_id = oci_identity_compartment.tf-compartment.id
  region = "us-phoenix-1"

  internet_gateway_route_rules = null
  local_peering_gateways = null
  nat_gateway_route_rules = null

  vcn_name = "kube-net"
  vcn_dns_label = "kube"
  vcn_cidrs = ["10.0.0.0/16"]
  
  create_internet_gateway = true
  create_nat_gateway = true
  create_service_gateway = true  
}

