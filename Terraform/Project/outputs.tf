output "project_vpc_id"{
    value = module.vpc.vpc_id
}

output "project_vpc_private_subnets"{
    value = module.vpc.private_subnets
}