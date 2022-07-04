output "k8s_cluster_endpoint"{
    value = data.aws_eks_cluster.market-cluster.endpoint
}

output "k8_cluster_cert"{
    value = data.aws_eks_cluster.market-cluster.certificate_authority.0.data
}

output "k8s_cluster_name" {
    value = data.aws_eks_cluster.market-cluster.name
}

output "k8s_cluster_token" {
    value = data.aws_eks_cluster_auth.market-cluster.token
}