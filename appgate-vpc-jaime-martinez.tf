resource "aws_vpc" "vpc-appgate" {
  cidr_block = "10.1.96.0/24"

  tags = {
    Name = "vpc-appgate"
  }
}

resource "aws_subnet" "subnet1-private-appgate" {
  vpc_id            = aws_vpc.vpc-appgate.id
  cidr_block        = "10.1.96.0/28"
  availability_zone = "us-west-2a"

  tags = {
    Name = "subnet1-private-appgate"
  }
}

resource "aws_subnet" "subnet2-private-appgate" {
  vpc_id            = aws_vpc.vpc-appgate.id
  cidr_block        = "10.1.96.16/28"
  availability_zone = "us-west-2b"

  tags = {
    Name = "subnet2-private-appgate"
  }
}

resource "aws_subnet" "subnet3-private-appgate" {
  vpc_id            = aws_vpc.vpc-appgate.id
  cidr_block        = "10.1.96.32/28"
  availability_zone = "us-west-2c"

  tags = {
    Name = "subnet3-private-appgate"
  }
}

resource "aws_subnet" "subnet4-public-appgate" {
  vpc_id            = aws_vpc.vpc-appgate.id
  cidr_block        = "10.1.96.48/28"
  availability_zone = "us-west-2d"

  tags = {
    Name = "subnet4-public-appgate"
  }
}

resource "aws_subnet" "subnet5-public-appgate" {
  vpc_id            = aws_vpc.vpc-appgate.id
  cidr_block        = "10.1.96.64/28"
  availability_zone = "us-west-2a"

  tags = {
    Name = "subnet5-public-appgate"
  }
}

resource "aws_network_interface" "network-appgate" {
  subnet_id   = aws_subnet.subnet1-appgate.id
  private_ips = ["10.1.96.10"]

  tags = {
    Name = "network-appgate"
  }
}