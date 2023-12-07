variable "vpc_cidr" {
    type = string
    description = "CIDR block for the VPC" 
}

variable "subnet_cidr" {
    type = map(string)
    description = "CIDR blocks for public and private subnets"
}

variable "allow_ssh_sg_cidr" {
    type = string
    description = "CIDR block from where to allow SSH inconming traffic"  
}