resource "aws_eip" "my_elastic_ip_01" {
  domain = "vpc"
}

resource "aws_eip" "my_elastic_ip_02" {
  domain = "vpc"
}

resource "aws_nat_gateway" "my_nat1" {
  allocation_id = aws_eip.my_elastic_ip_01.id
  subnet_id     = aws_subnet.my_subnet_01.id
}

resource "aws_nat_gateway" "my_nat2" {
  allocation_id = aws_eip.my_elastic_ip_02.id
  subnet_id     = aws_subnet.my_subnet_02.id
}