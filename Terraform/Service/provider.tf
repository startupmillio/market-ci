terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.5.1"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.11.0"
    }
  }
  #variables like ${github.var} are being replaced using sed command in pipeline. 
  #We are not able to parse terraform variables to backend parameters due to terraform's limitations
  backend "s3" { 
    bucket = "${github.bucket_name}"
    key    = "${github.bucket_key}"
    region = "${github.region}"
  }
}

  provider "aws" {
    region = "${var.project_region}"
  }


provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.market-cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.market-cluster.certificate_authority.0.data)
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.market-cluster.name]
      command     = "aws"
    }
  }
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.market-cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.market-cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.market-cluster.token
  #load_config_file       = false
}