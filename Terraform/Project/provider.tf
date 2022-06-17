terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
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