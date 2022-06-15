data "kubernetes_service" "contour" {
  metadata {
    name = "contour-ingress-controller-envoy"
  }
}

data "aws_elb_hosted_zone_id" "main" {}

data "aws_route53_zone" "market_zone" {
  name         = "${var.route53_zone}"
}

resource "aws_route53_record" "dev" {
  zone_id = data.aws_route53_zone.market_zone.zone_id
  name    = "dev.${var.project_name}.${data.aws_route53_zone.market_zone.name}"
  type    = "A"

  alias {
    name                   = data.kubernetes_service.contour.status.0.load_balancer.0.ingress.0.hostname
    zone_id                = data.aws_elb_hosted_zone_id.main.id
    evaluate_target_health = true
  }
}
