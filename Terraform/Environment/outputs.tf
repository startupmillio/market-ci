output "k8s_cluster_endpoint"{
    value = data.aws_eks_cluster.market-cluster.endpoint
    sensitive   = true
}

output "k8s_cluster_cert"{
    value = data.aws_eks_cluster.market-cluster.certificate_authority.0.data
    sensitive   = true
}

output "k8s_cluster_name" {
    value = data.aws_eks_cluster.market-cluster.name
    sensitive   = true
}

output "k8s_cluster_token" {
    value = data.aws_eks_cluster_auth.market-cluster.token
    sensitive   = true
}