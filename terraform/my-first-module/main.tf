# terraform configuration
terraform {
  required_providers {
    my_cloud_provider {
        version = ""
        source = ""
    }
  }
  backend "" {
    remote_backend = {

    }
  }
}

# provider configuration
provider "" {
  
}

# local module
module "consul" {
  source = "./child-module"
}

# remote module
module "look_for_moudle_at: https://registry.terraform.io/browse/modules" {

}