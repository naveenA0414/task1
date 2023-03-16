provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my_ec2_instance" {
  ami                    = "ami-0caf778a172362f1c"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  tags = {
    Name = "My EC2 Instance"
  }

  # Use default VPC
}

resource "aws_security_group" "my_sg" {
  name        = "my_sg"
  description = "Allow SSH access from anywhere"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

