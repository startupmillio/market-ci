data "kubernetes_service" "contour" {
  metadata {
    name = "contour-ingress-controller-envoy"
  }
}

data "aws_elb_hosted_zone_id" "main" {}

data "aws_route53_zone" "market_zone" {
  name         = "${var.route53_zone}"
}

resource "aws_route53_record" "market_user_ms" {
  zone_id = data.aws_route53_zone.market_zone.zone_id
  name    = "${var.project_env}.market-user-ms.${data.aws_route53_zone.market_zone.name}"
  type    = "A"

  alias {
    name                   = data.kubernetes_service.contour.status.0.load_balancer.0.ingress.0.hostname
    zone_id                = data.aws_elb_hosted_zone_id.main.id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "market_product_ms" {
  zone_id = data.aws_route53_zone.market_zone.zone_id
  name    = "${var.project_env}.market-product-ms.${data.aws_route53_zone.market_zone.name}"
  type    = "A"

  alias {
    name                   = data.kubernetes_service.contour.status.0.load_balancer.0.ingress.0.hostname
    zone_id                = data.aws_elb_hosted_zone_id.main.id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "market_media_ms" {
  zone_id = data.aws_route53_zone.market_zone.zone_id
  name    = "${var.project_env}.market-media-ms.${data.aws_route53_zone.market_zone.name}"
  type    = "A"

  alias {
    name                   = data.kubernetes_service.contour.status.0.load_balancer.0.ingress.0.hostname
    zone_id                = data.aws_elb_hosted_zone_id.main.id
    evaluate_target_health = true
  }
}


