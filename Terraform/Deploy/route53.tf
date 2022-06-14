data "kubernetes_service" "contour" {
  metadata {
    name = "contour-ingress-controller-envoy"
  }
}

data "aws_route53_zone" "market_zone" {
  name         = "${var.route53_zone}"
}

resource "aws_route53_record" "dev" {
  zone_id = data.aws_route53_zone.market_zone.zone_id
  name    = "dev.${var.project_name}.${data.aws_route53_zone.market_zone.name}"
  type    = "A"

  //records = [data.kubernetes_service.contour.status.0.load_balancer.0.ingress.0.hostname]

  alias {
    name                   = data.kubernetes_service.contour.status.0.load_balancer.0.ingress.0.hostname
    zone_id                = data.kubernetes_service.contour.status.0.load_balancer.0.ingress.0.zone_id
    evaluate_target_health = true
  }
}
