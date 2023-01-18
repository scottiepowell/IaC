# Source from https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/containerengine_cluster
resource "kubernetes_namespace" "free_namespace" {
  metadata {
    name = "nginx-lb"
  }
}
resource "oci_containerengine_cluster" "oke-cluster" {
    # Required
    compartment_id = oci_identity_compartment.tf-compartment.id
    kubernetes_version = "v1.24.1"
    name = "kube-test"
    vcn_id = module.vcn.vcn_id

    endpoint_config {
        is_public_ip_enabled = true
        subnet_id            = oci_core_subnet.vcn-public-subnet.id
    }
    # Optional
    options {
        add_ons{
            is_kubernetes_dashboard_enabled = false
            is_tiller_enabled = false
        }
        kubernetes_network_config {
            pods_cidr = "10.244.0.0/16"
            services_cidr = "10.96.0.0/16"
        }
        service_lb_subnet_ids = [oci_core_subnet.vcn-public-subnet.id]
    }  
}
resource "kubernetes_deployment" "nginx_deployment" {
  metadata {
    name = "nginx"
    labels = {
      app = "nginx"
    }
    namespace = kubernetes_namespace.free_namespace.id
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "nginx"
      }
    }
    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }
      spec {
        container {
          image = "nginx"
          name  = "nginx"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

