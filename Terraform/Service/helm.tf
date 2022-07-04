resource "helm_release" "market-service" {
  name       = "${var.service_name}-${var.project_env}"
  chart      = "../../Helm/service-chart"
  force_update = true

  set {
    name = "replicaCount"
    value = "${var.service_replica_count}"
  }
  set {
    name = "Env"
    value = "${var.project_env}"
  }
  set {
    name = "ServiceName"
    value = "${var.service_name}"
  }
  set {
    name = "Image"
    value = "${var.service_image}"
  }
  
}