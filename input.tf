variable "ami_id" {
    type = string
    description = "assign ami id"

}

variable "instance_type" {
    type = string
    description = "assign instance type"

}

variable "key_name" {
    type = string 
    description = "assign key name"

}


variable "instance_tags" {
    type = map(string)
    description = "assign name for intance"

}

variable "vpc_cidr_block" {
    type = string
    description = "assign vpc cidr block"


}

variable "public_subnet_cidr" {
    type = string
    description = "assign subnet cidr block"


}

variable "private_subnet_cidr" {
    type = string

}

variable "public_ip" {
    type = bool

}

variable "vpc_tags" {
    type = map(string)

}

variable "public_subnet_tags" {
    type = map(string)

}

variable "private_subnet_tags" {
    type = map(string)

}

variable "az" {
    type = list(string)

}

variable "aws_route_table_tags" {
    type = list(string)

}
