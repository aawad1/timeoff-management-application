resource "aws_route_table" "awad-public-route-table" {
  vpc_id = aws_vpc.awad-vpc-tf.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "awad-public-route-table"
  }
}

resource "aws_route_table" "awad-private-route-table" {
  vpc_id = aws_vpc.awad-vpc-tf.id

  tags = {
    Name = "awad-private-route-table"
  }
}

resource "aws_route_table_association" "private-route-table-association" {
  subnet_id = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.awad-private-route-table.id
}

resource "aws_route_table_association" "public-route-table-association" {
  subnet_id = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.awad-public-route-table.id
}
