# terraform configuration
terraform {
  required_providers {
    aws = {
      version = "~>5.25.0"
      source  = "hashicorp/aws"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">4.0.1"
    }
    local = {
      source  = "hashicorp/local"
      version = ">2.3.0"
    }
  }
  required_version = "~>1.6.4"

  backend "s3" {
    bucket = "tfstate-remote-s3-bucket-lab"
    key    = "global/terraform.tfstate"
    region = "us-west-1"
  }

}

