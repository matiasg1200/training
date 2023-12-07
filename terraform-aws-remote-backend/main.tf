resource "aws_s3_bucket" "remote_backend" {
  bucket = "tfstate-remote-s3-bucket-lab"

  tags = {
    Name        = "Terraform"
    Environment = "Dev"
  }
}