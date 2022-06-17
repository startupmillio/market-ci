data "aws_eks_cluster" "market-cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "market-cluster" {
  name = module.eks.cluster_id
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name    = "${var.env_eks_name}"
  cluster_version = "1.21"

  vpc_id     = "${var.project_vpc_id}"
  subnet_ids = "${var.project_vpc_private_subnets}"

  eks_managed_node_groups = {
    market-node-1 = {
      min_size     = 1
      max_size     = 3
      desired_size = 1

      instance_types = ["t2.small"]
      capacity_type  = "SPOT"
    }
  }

}