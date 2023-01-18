
output "k8s-cluster-id" {
  value = oci_containerengine_cluster.k8s_cluster.id
}
output "public_subnet_id" {
  value = oci_core_subnet.vcn_public_subnet.id
}
output "node_pool_id" {
  value = oci_containerengine_node_pool.k8s_node_pool.id
}
output "free_load_balancer_public_ip" {
    value = [for ip in oci_network_load_balancer_network_load_balancer.free_nlb.ip_addresses : ip if ip.is_public == true]
}