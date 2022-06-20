data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source                 = "terraform-aws-modules/vpc/aws"
  cidr                   = "${var.vpc_cidr}"
  private_subnets        = ["${cidrsubnet("${var.vpc_cidr}", 8, 1)}", "${cidrsubnet("${var.vpc_cidr}", 8, 2)}", "${cidrsubnet("${var.vpc_cidr}", 8, 3)}"] # Fix hardcoded values later!
  public_subnets         = ["${cidrsubnet("${var.vpc_cidr}", 8, 101)}", "${cidrsubnet("${var.vpc_cidr}", 8, 102)}", "${cidrsubnet("${var.vpc_cidr}", 8, 103)}"] # Fix hardcoded values later!

  azs                    = data.aws_availability_zones.available.names
  enable_nat_gateway     = true
  single_nat_gateway     = true
  enable_dns_hostnames   = true
  tags                   = {
    "kubernetes.io/cluster/${var.env_eks_name}" = "shared"
  }
}

