resource "helm_release" "contour_ingress_controller" {
  name       = "contour-ingress-controller"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "contour"
}