##### ROUTE TABLES #####

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "Private Route Table"
  }
}


##### ROUTE TABLE ASSOCIATION #####

resource "aws_route_table_association" "public-subnet-route-table-association" {
  subnet_id      = aws_subnet.subnet_public.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "app-nat-route-table-association" {
  subnet_id      = aws_subnet.subnet_private_app.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "db-nat-route-table-association" {
  subnet_id      = aws_subnet.subnet_private_db.id
  route_table_id = aws_route_table.private-route-table.id
}