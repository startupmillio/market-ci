resource "helm_release" "market-service" {
  name       = "contour-ingress-configure"
  chart      = "../../Helm/service-chart"

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
    name = "ServiceName"
    value = "${var.service_name}"
  }
  set {
    name = "Image"
    value = "${var.service_image}"
  }
  
}