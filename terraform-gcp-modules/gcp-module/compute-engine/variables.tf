variable "instance_name" {
  type = string
}

variable "instance_machine_type" {
  type = string
}

variable "instance_vpc" {
  type = string
}

variable "instance_image" {
  type = string
}

variable "instance_labels" {
  type = map(string)
}

variable "instance_subnet" {
  type = string
}
