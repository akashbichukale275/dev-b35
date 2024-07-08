resource "aws_instance" "vm" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  tags = var.instance_tags
}

resource "aws_vpc" "custom" {
  cidr_block = var.vpc_cidr_block
  tags = var.vpc_tags
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.custom.id
  cidr_block = var.public_subnet_cidr
  availability_zone = var.az[0]
  tags = var.public_subnet_tags
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.custom.id
  cidr_block = var.private_subnet_cidr
  availability_zone = var.az[1]
  tags = var.private_subnet_tags
}

