data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source                 = "terraform-aws-modules/vpc/aws"
  cidr                   = "${var.vpc_cidr}"
  private_subnets        = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets         = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  azs                    = data.aws_availability_zones.available.names
  enable_nat_gateway     = true
  single_nat_gateway     = true
  enable_dns_hostnames   = true
  tags                   = {
    "kubernetes.io/cluster/${var.env_eks_name}" = "shared"
  }
}

