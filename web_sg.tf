resource "aws_security_group" "web_security_group" {
  name        = "web server security group"
  description = "Allows inbound http/https/SSH access and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "http access"
    from_port   = 80
    protocol = "tcp"
    to_port     = 80
    cidr_blocks  = ["0.0.0.0/0"]
  }

   ingress {
    description = "https access"
    from_port   = 443
    protocol = "tcp"
    to_port     = 443
    cidr_blocks  = ["0.0.0.0/0"]
  }

   ingress {
    description = "ssh access"
    from_port   = 22
    protocol = "tcp"
    to_port     = 22
    cidr_blocks  = ["0.0.0.0/0"]
  }

  egress {
    description = "allow all outbound traffic"
    from_port   = 0
    protocol = "-1" # semantically equivalent to all ports
    to_port     = 0
    cidr_blocks  = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web security group"
  }
}

