variable "vpc_cidr_block" {
    type = string
}

variable "vpc_tags" {
    type = map(string)
  
}

variable "subnet_cidr_block" {
    type = string 
}

variable "az" {
    type = string
}

variable "public_ip" {
    type = bool

}

variable "subnet_tags" {
    type = map(string)
}


