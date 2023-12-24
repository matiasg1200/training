terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>5.8.0"
    }
  }
  required_version = "~>1.3.0"
}

provider "google" {
  project = "terraform-with-gcp-401622"
  region  = "us-esast1"
}
