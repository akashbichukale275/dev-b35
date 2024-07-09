module "ec2" {
    source = "./modules/ec2"
    ami_id = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    instance_tags = var.instance_tags
}

module "vpc" {
    source = "./modules/vpc"
    vpc_cidr_block = var.vpc_cidr_block
    vpc_tags = var.vpc_tags
    subnet_cidr_block = var.subnet_cidr_block
    subnet_tags = var.subnet_tags
    az = var.az
    public_ip = var.public_ip
}