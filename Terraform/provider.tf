terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  #variables like ${github.var} are being replaced using sed command in pipeline. 
  #We are not able to parse terraform variables to backend parameters
  backend "s3" { 
    bucket = "${github.project_name}-s3-terraform"
    key    = "${github.project_name}/terraform/${github.project_env}/terraform.tfstate"
    region = "${github.region}"
  }
}

provider "aws" {
  region = "${var.project_region}"
}