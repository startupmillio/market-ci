resource "helm_release" "contour_ingress_controller" {
  name       = "contour-ingress-controller"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "contour"
}

resource "helm_release" "contour_ingress_configure" {
  name       = "contour-ingress-controller"
  chart      = "../../Helm/ingress-chart"
  depends_on = [helm_release.contour_ingress_controller]
}