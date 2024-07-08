ami_id = "ami-06c68f701d8090592"
instance_type = "t2.micro"
key_name = "akash"
instance_tags = {
    Name = "instance"
}

vpc_cidr_block = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"
public_ip = true
vpc_tags = {
  "Name" = "custom-vpc"
}
public_subnet_tags = {
  "Name" = "pub-sub"
}

private_subnet_tags = {
  "Name" = "pri-sub"
}

az = ["us-east-1a","us-east-1b"]
