# terraform configuration
terraform {
    required_providers {
      aws = {
        version = "~>5.25.0"
        source  = "hashicorp/aws"
      }
    }
    required_version = "~>1.6.4"

    backend "s3" {
      bucket = "tfstate-remote-s3-bucket-lab"
      key = "global/terraform.tfstate"
      region = "us-west-1"
    }

}

