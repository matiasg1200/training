variable "labels" {
  type        = map(string)
  description = "standard labels"

}

variable "machine_type" {
  type        = map(string)
  description = "Machine type to use"
}

variable "firewall_rules" {
  type = object({
    protocol     = map(string)
    ports        = map(number)
    source_range = string
  })
}