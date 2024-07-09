resource "aws_vpc" "custom" {
    cidr_block = var.vpc_cidr_block
    tags = var.vpc_tags
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.custom.id
    cidr_block = var.subnet_cidr_block
    availability_zone = var.az
    map_public_ip_on_launch = var.public_ip
    tags = var.subnet_tags
    
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.custom.id
    tags = {
        Name = "internet"
    }
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.custom.id

    tags = {
        Name = "public-route"
    }
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id

    }
}

resource "aws_route_table_association" "attach" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.rt.id
}