resource "aws_instance" "web" {
  ami                     = "ami-01e82af4e524a0aa3"
  instance_type           = "t2.micro"
  subnet_id               = aws_subnet.subnet_public.id
  security_groups         = [aws_security_group.web_security_group.id]

  tags = {
    Name = "web server"
  }
}

resource "aws_instance" "app" {
  ami                     = "ami-01e82af4e524a0aa3"
  instance_type           = "t2.micro"
  subnet_id               = aws_subnet.subnet_private_app.id
  security_groups         = [aws_security_group.app_security_group.id]

  tags = {
    Name = "app server"
  }
}
