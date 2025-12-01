data "rancher2_cluster_v2" "cluster" {
  name            = var.target_cluster_name
  fleet_namespace = "fleet-default"
}

data "rancher2_project" "project" {
  name       = var.project_name
  cluster_id = data.rancher2_cluster_v2.cluster.cluster_v1_id
}


resource "rancher2_namespace" "namespace" {
  name       = var.namespace_name
  project_id = data.rancher2_project.project.id
  resource_quota {
    limit {
      limits_cpu      = var.namespace_limits_cpu
      limits_memory   = var.namespace_limits_memory
      requests_cpu    = var.namespace_requests_cpu
      requests_memory = var.namespace_requests_memory
    }
  }
}
