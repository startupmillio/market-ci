output "project_vpc_id"{
    value = module.vpc.vpc_id
}

locals {
  vpc_private_subnets = format("['%s']", join("','", module.vpc.private_subnets))
}

output "project_vpc_private_subnets"{
    value = local.vpc_private_subnets
}