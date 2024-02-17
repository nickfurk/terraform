resource "aws_subnet" "subnet_public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.availability_zone_one
  map_public_ip_on_launch = true

  tags = {
    Name = "public subnet web layer"
  }
}

resource "aws_subnet" "subnet_private_app" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = var.availability_zone_two
  map_public_ip_on_launch = false

  tags = {
    Name = "private subnet app layer"
  }
}

resource "aws_subnet" "subnet_private_db" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  availability_zone = var.availability_zone_two
  map_public_ip_on_launch = false

  tags = {
    Name = "private subnet db layer"
  }
}

resource "aws_subnet" "subnet_private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.4.0/24"
  availability_zone = var.availability_zone_one
  map_public_ip_on_launch = false

  tags = {
    Name = "private subnet layer"
  }
}

