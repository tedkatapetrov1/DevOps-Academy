resource "aws_vpc" "my_vpc_01" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my_vpc_01"
  }
}

resource "aws_internet_gateway" "my_igw_01" {
  vpc_id = aws_vpc.my_vpc_01.id
  tags = {
    Name = "my_igw_01"
  }
}

resource "aws_subnet" "my_subnet_01" {
  vpc_id            = aws_vpc.my_vpc_01.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "my_subnet_01"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.my_vpc_01.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "Private-1"
  }
}

resource "aws_subnet" "my_subnet_02" {
  vpc_id            = aws_vpc.my_vpc_01.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Name = "my_subnet_02"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.my_vpc_01.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Name = "Private-2"
  }
}