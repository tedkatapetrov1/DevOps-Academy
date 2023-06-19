resource "aws_route_table" "my_route_table1" {
  vpc_id = aws_vpc.my_vpc_01.id

  tags = {
    Name = "my-route-table1"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw_01.id
  }
}

resource "aws_route_table" "my_route_table2" {
  vpc_id = aws_vpc.my_vpc_01.id

  tags = {
    Name = "my-route-table2"
  }

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_nat1.id
  }
}

resource "aws_route_table" "my_route_table3" {
  vpc_id = aws_vpc.my_vpc_01.id

  tags = {
    Name = "my-route-table3"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw_01.id
  }
}

resource "aws_route_table" "my_route_table4" {
  vpc_id = aws_vpc.my_vpc_01.id

  tags = {
    Name = "my-route-table4"
  }
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_nat2.id
  }
}

resource "aws_route_table_association" "my_subnet_assoc1" {
  subnet_id      = aws_subnet.my_subnet_01.id
  route_table_id = aws_route_table.my_route_table1.id
}

resource "aws_route_table_association" "my_subnet_assoc2" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.my_route_table2.id
}

resource "aws_route_table_association" "my_subnet_assoc3" {
  subnet_id      = aws_subnet.my_subnet_02.id
  route_table_id = aws_route_table.my_route_table3.id
}

resource "aws_route_table_association" "my_subnet_assoc4" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.my_route_table4.id
}
