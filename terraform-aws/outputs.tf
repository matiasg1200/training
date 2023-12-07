output "AMI" {
  value = data.aws_ami.amazon_image.id
}

output "public_ip" {
  value = aws_instance.lab_instance.public_ip
}