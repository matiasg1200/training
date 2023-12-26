#module "gcp" {
#    source = "./gcp-module/compute-engine" 
#
#
#}



module "vpc" {
    source = "./gcp-module/vpc" 
    vpc_firewall_rules = {
        protocol = {
            http = "tcp"
            ssh = "tcp"
        }
        ports = {
          http = 80
          ssh = 22
        }
        source_range = "0.0.0.0/0"
    }
    vpc_subnet_cidr = "10.10.0.0/16"
    vpc_subnet_name = "name"
    vpc_name = "vpc"
}