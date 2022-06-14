data "kubernetes_service" "contour" {
  metadata {
    name = "contour-ingress-controller-envoy"
  }
}

data "aws_route53_zone" "market_zone" {
  name         = "${var.route53_zone}"
}

resource "aws_route53_record" "prod" {
  zone_id = data.aws_route53_zone.market_zone.zone_id
  name    = "prod.${var.project_name}.${data.aws_route53_zone.market_zone.name}"
  type    = "A"
  ttl     = "300"
  records = [data.kubernetes_service.contour.status.0.load_balancer.0.ingress.0.hostname]
}

resource "aws_route53_record" "dev" {
  zone_id = data.aws_route53_zone.market_zone.zone_id
  name    = "dev.${var.project_name}.${data.aws_route53_zone.market_zone.name}"
  type    = "A"
  ttl     = "300"
  records = [data.kubernetes_service.contour.status.0.load_balancer.0.ingress.0.hostname]
}

resource "aws_route53_record" "qa" {
  zone_id = data.aws_route53_zone.market_zone.zone_id
  name    = "qa.${var.project_name}.${data.aws_route53_zone.market_zone.name}"
  type    = "A"
  ttl     = "300"
  records = [data.kubernetes_service.contour.status.0.load_balancer.0.ingress.0.hostname]
}