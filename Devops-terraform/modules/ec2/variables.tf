variable "ami_id" {
    type = string
}

variable "instance_type" {
    type = string
}

variable "key_name" {
    type = string


}

variable "instance_tags" {
    type = map(string)
}