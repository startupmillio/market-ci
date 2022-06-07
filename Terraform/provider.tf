terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "market-user-ms-s3-terraform"
    key    = "terraform/market-user-ms/dev/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "${var.project_region}"
}