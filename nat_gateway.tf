resource "aws_eip" "nat_eip" {
    domain  = "vpc"

    tags = {
        Name = "NAT elastic IP"
    }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnet_public.id

  tags = {
    Name = "gw NAT"
  }
}