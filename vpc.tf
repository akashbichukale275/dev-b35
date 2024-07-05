provider "aws" {
  region  = "us-east-1"
  profile = "tf-user"

}

resource "aws_vpc" "custom" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "custom-vpc"
  }

}

resource "aws_subnet" "public-sub" {
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  vpc_id                  = aws_vpc.custom.id
  map_public_ip_on_launch = "true"

  tags = {
    Name = "pub-subnet"
  }
}

resource "aws_subnet" "private-sub" {
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  vpc_id                  = aws_vpc.custom.id
  map_public_ip_on_launch = "false"

  tags = {
    Name = "priv-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.custom.id

  tags = {
    Name = "internet"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.custom.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "pub-route"
  }

}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.custom.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "priv-route"
  }
}

resource "aws_route_table_association" "attach" {
  subnet_id      = aws_subnet.public-sub.id
  route_table_id = aws_route_table.public-rt.id

}

resource "aws_route_table_association" "attach2" {
  subnet_id      = aws_subnet.private-sub.id
  route_table_id = aws_route_table.private-rt.id

}

resource "aws_eip" "elastic" {
  domain = "vpc"

}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.elastic.id
  subnet_id     = aws_subnet.public-sub.id

  tags = {
    Name = "nat-gateway"
  }
}

output "vpc_id" {
  value = aws_vpc.custom.owner_id

}
