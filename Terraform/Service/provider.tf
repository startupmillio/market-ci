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
    host                   = "${var.k8s_cluster_endpoint}"
    cluster_ca_certificate = "${var.k8s_cluster_cert}"
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["eks", "get-token", "--cluster-name", "${var.k8s_cluster_name}"]
      command     = "aws"
    }
  }
}

provider "kubernetes" {
  host                   = "${var.k8s_cluster_endpoint}"
  cluster_ca_certificate = "${var.k8s_cluster_cert}"
  token                  = "${var.k8s_cluster_token}"
  #load_config_file       = false
}