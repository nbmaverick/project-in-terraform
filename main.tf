resource "aws_vpc" "main" {
  cidr_block = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "VPC"
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.123.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-west-2a"

  tags = {
    Name = "Public subnet"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "IG"
  }
}

