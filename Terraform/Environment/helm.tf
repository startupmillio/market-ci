resource "helm_release" "contour_ingress_controller" {
  name       = "contour-ingress-controller"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "contour"
  force_update = true
  depends_on = [module.eks]
}

resource "helm_release" "contour_ingress_configure" {
  name       = "contour-ingress-configure"
  chart      = "../../Helm/ingress-chart"
  depends_on = [helm_release.contour_ingress_controller]

  set {
    name = "domain"
    value = "${data.aws_route53_zone.market_zone.name}"
  }
  set {
    name = "env"
    value = "${var.project_env}"
  }
}