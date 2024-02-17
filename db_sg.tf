resource "aws_security_group" "db_security_group" {
  name        = "db server security group"
  description = "Allows MySQL access"
  vpc_id      = aws_vpc.main.id

   ingress {
    description = "MySQL access"
    from_port   = 3306
    protocol = "tcp"
    to_port     = 3306
    security_groups = ["${aws_security_group.app_security_group.id}"]
  }

  egress {
    description = "allow all outbound traffic"
    from_port   = 0
    protocol = "-1" # semantically equivalent to all ports
    to_port     = 0
    cidr_blocks  = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db security group"
  }
}
