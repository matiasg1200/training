output "user" {
  value = random_string.username.result
}

output "pwd" {
  value = random_string.password.result
}

output "public_ip" {
  value = aws_instance.lab_instance.public_ip
}