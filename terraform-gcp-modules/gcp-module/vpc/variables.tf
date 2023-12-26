variable "vpc_name" {
  type = string
}

variable "vpc_firewall_rules" {
  type = object({
    protocol     = map(string)
    ports        = map(number)
    source_range = string
  })
}

variable "vpc_subnet_cidr" {
  type = string
}

variable "vpc_subnet_name" {
  type = string
}
