data "aws_ami" "amazon_image" {
  most_recent      = true
  owners           = ["amazon"]
  name_regex  = "^.*amzn2-ami-hvm.*"

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}