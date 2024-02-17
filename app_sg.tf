resource "aws_security_group" "app_security_group" {
  name        = "app server security group"
  description = "Allows SSH"
  vpc_id      = aws_vpc.main.id

   ingress {
    description = "ssh access"
    from_port   = 22
    protocol = "tcp"
    to_port     = 22
    security_groups = ["${aws_security_group.web_security_group.id}"]
  }

  ingress {
    from_port       = 80
    protocol        = "tcp"
    to_port         = 80
    security_groups = ["${aws_security_group.web_security_group.id}"]
  }

  ingress {
    from_port       = 443
    protocol        = "tcp"
    to_port         = 443
    security_groups = ["${aws_security_group.web_security_group.id}"]
  }

  egress {
    description = "allow all outbound traffic"
    from_port   = 0
    protocol = "-1" # semantically equivalent to all ports
    to_port     = 0
    cidr_blocks  = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app security group"
  }
}
