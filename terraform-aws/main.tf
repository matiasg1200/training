# Create VPC
resource "aws_vpc" "lab" {
  cidr_block = var.vpc_cidr
  
  tags = {
    Name = "vpc_lab"
  }
}

# Create public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.lab.id
  cidr_block = var.subnet_cidr.public
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_lab"
  }
}

# Create private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.lab.id
  cidr_block = var.subnet_cidr.private

  tags = {
    Name = "private_subnet_lab"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.lab.id

  tags = {
    Name = "igw_lab"
  }
}

# Create route table to route general trafic
resource "aws_route_table" "route" {
  vpc_id = aws_vpc.lab.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "route_table_lab"
  }
}

# Create association beteween route table and public subnet
resource "aws_route_table_association" "rt-public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route.id
}

# Create security group to allow ssh traffic 
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.lab.id

  ingress {
    description      = "Allow SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.allow_ssh_sg_cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

# Create RSA key of size 4096 bits for EC2 instance
resource "tls_private_key" "ec2_lab_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save private key to a file
resource "local_file" "private_key_file" {
  content  = tls_private_key.ec2_lab_key.private_key_openssh
  filename = "ec2_lab_key.pem"
}

# Upload public key to AWS   
resource "aws_key_pair" "ec2_lab_key" {
  key_name   = "ec2_lab_key"
  public_key = tls_private_key.ec2_lab_key.public_key_openssh
}

# Create EC2 instance
resource "aws_instance" "lab_instance" {
  ami = data.aws_ami.amazon_image.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
  subnet_id = aws_subnet.public_subnet.id
  key_name = "ec2_lab_key"
  depends_on = [aws_internet_gateway.igw, aws_key_pair.ec2_lab_key]
}
