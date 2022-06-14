data "aws_elb" "contour_elb" {
  tags = {
      "kubernetes.io/cluster/${var.project_name}" = "owned"
  }
  ## it's maybe required to write here some dependencies from ecs cluster and helm charts creation steps
}

data "aws_route53_zone" "market_zone" {
  name         = "${var.route53_zone}."
  private_zone = true
}

resource "aws_route53_record" "prod" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "prod.${project_name}.${data.aws_route53_zone.market_zone.name}"
  type    = "A"
  ttl     = "300"
  records = [data.aws_elb.dns_name]
}

resource "aws_route53_record" "dev" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "dev.${project_name}.${data.aws_route53_zone.market_zone.name}"
  type    = "A"
  ttl     = "300"
  records = [data.aws_elb.dns_name]
}

resource "aws_route53_record" "qa" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "qa.${project_name}.${data.aws_route53_zone.market_zone.name}"
  type    = "A"
  ttl     = "300"
  records = [data.aws_elb.dns_name]
}