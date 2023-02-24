
provider "kubernetes" {
  config_path = "~/.kube/free-k8s-config"
}

resource "kubernetes_namespace" "free_namespace" {
  metadata {
    name = "free-ns"
  }
}

data "oci_containerengine_node_pool" "free_k8s_np" {
  node_pool_id = var.node_pool_id
}
# the NLB needs to filter out non-active nodes and point to active nodes in the node pool
locals {
  active_nodes = [for node in data.oci_containerengine_node_pool.free_k8s_np.nodes : node if node.state == "ACTIVE"]
}

// ...previous things are omitted for simplicity

resource "oci_network_load_balancer_network_load_balancer" "free_nlb" {
  compartment_id = var.compartment_id
  display_name   = "free-k8s-nlb"
  subnet_id      = var.public_subnet_id

  is_private                     = false
  is_preserve_source_destination = false
}

resource "oci_network_load_balancer_backend_set" "free_nlb_backend_set" {
  health_checker {
    protocol = "TCP"
    port     = 10256
  }
  name                     = "free-k8s-backend-set"
  network_load_balancer_id = oci_network_load_balancer_network_load_balancer.free_nlb.id
  policy                   = "FIVE_TUPLE"

  is_preserve_source = false
}

resource "oci_network_load_balancer_backend" "free_nlb_backend" {
  count                    = length(local.active_nodes)
  backend_set_name         = oci_network_load_balancer_backend_set.free_nlb_backend_set.name
  network_load_balancer_id = oci_network_load_balancer_network_load_balancer.free_nlb.id
  port                     = 31600
  target_id                = local.active_nodes[count.index].id
}

resource "oci_network_load_balancer_listener" "free_nlb_listener" {
  default_backend_set_name = oci_network_load_balancer_backend_set.free_nlb_backend_set.name
  name                     = "free-k8s-nlb-listener"
  network_load_balancer_id = oci_network_load_balancer_network_load_balancer.free_nlb.id
  port                     = "80"
  protocol                 = "TCP"
}