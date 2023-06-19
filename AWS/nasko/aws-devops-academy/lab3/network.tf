# Create a VPC ----------------------------------------------------------------
resource "aws_vpc" "my_vpc_01" {
  cidr_block = "10.0.0.0/16"
}

# Create a IGW ----------------------------------------------------------------
resource "aws_internet_gateway" "my_igw_01" {
  vpc_id = aws_vpc.my_vpc_01.id
}

# Create 4 Subnets ------------------------------------------------------------
resource "aws_subnet" "my_public_subnet_01" {
  vpc_id            = aws_vpc.my_vpc_01.id
  cidr_block        = lookup(var.cidr_ranges, "public1")
  availability_zone = lookup(var.regions, "first_zone")
  tags = {
    name = "${lookup(var.subnet_type, "public")}-subnet"
  }
}

resource "aws_subnet" "my_private_subnet_01" {
  vpc_id            = aws_vpc.my_vpc_01.id
  cidr_block        = lookup(var.cidr_ranges, "private1")
  availability_zone = lookup(var.regions, "first_zone")
  tags = {
    name = lookup(var.subnet_type, "private")
  }
}

resource "aws_subnet" "my_public_subnet_02" {
  vpc_id            = aws_vpc.my_vpc_01.id
  cidr_block        = lookup(var.cidr_ranges, "public2")
  availability_zone = lookup(var.regions, "second_zone")
  tags = {
    name = "${lookup(var.subnet_type, "public")}--subnet"
  }
}

resource "aws_subnet" "my_private_subnet_02" {
  vpc_id            = aws_vpc.my_vpc_01.id
  cidr_block        = lookup(var.cidr_ranges, "private2")
  availability_zone = lookup(var.regions, "second_zone")
  tags = {
    name = lookup(var.subnet_type, "private")
  }
}

# Create 2 ElasticIP ---------------------------------------------------------
resource "aws_eip" "my_elastic_ip_01" {
  domain = "vpc"
}

resource "aws_eip" "my_elastic_ip_02" {
  domain = "vpc"
}

# Create 2 NAT Gateway --------------------------------------------------------
resource "aws_nat_gateway" "my_nat_01" {
  allocation_id = aws_eip.my_elastic_ip_01.id
  subnet_id     = aws_subnet.my_public_subnet_01.id
}

resource "aws_nat_gateway" "my_nat_02" {
  allocation_id = aws_eip.my_elastic_ip_02.id
  subnet_id     = aws_subnet.my_public_subnet_02.id
}

# Create 4 Routing Tables -----------------------------------------------------
resource "aws_route_table" "my_route_table_01" {
  vpc_id = aws_vpc.my_vpc_01.id
  route {
    cidr_block = var.allow_traffic_cidr_block
    gateway_id = aws_internet_gateway.my_igw_01.id
  }
}

resource "aws_route_table" "my_route_table_02" {
  vpc_id = aws_vpc.my_vpc_01.id
  route {
    cidr_block     = var.allow_traffic_cidr_block
    nat_gateway_id = aws_nat_gateway.my_nat_01.id
  }
}

resource "aws_route_table" "my_route_table_03" {
  vpc_id = aws_vpc.my_vpc_01.id
  route {
    cidr_block = var.allow_traffic_cidr_block
    gateway_id = aws_internet_gateway.my_igw_01.id
  }
}

resource "aws_route_table" "my_route_table_04" {
  vpc_id = aws_vpc.my_vpc_01.id
  route {
    cidr_block     = var.allow_traffic_cidr_block
    nat_gateway_id = aws_nat_gateway.my_nat_02.id
  }
}

# Assosiate Routing Tables ----------------------------------------------------
resource "aws_route_table_association" "my_subnet_assoc_01" {
  subnet_id      = aws_subnet.my_public_subnet_01.id
  route_table_id = aws_route_table.my_route_table_01.id
}

resource "aws_route_table_association" "my_subnet_assoc_02" {
  subnet_id      = aws_subnet.my_private_subnet_01.id
  route_table_id = aws_route_table.my_route_table_02.id
}

resource "aws_route_table_association" "my_subnet_assoc_03" {
  subnet_id      = aws_subnet.my_public_subnet_02.id
  route_table_id = aws_route_table.my_route_table_03.id
}

resource "aws_route_table_association" "my_subnet_assoc_04" {
  subnet_id      = aws_subnet.my_private_subnet_02.id
  route_table_id = aws_route_table.my_route_table_04.id
}
