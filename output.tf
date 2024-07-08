output "public_ip" {
    value = aws_instance.vm.public_ip
}

output "vpc_id" {
  value = aws_vpc.custom.id
}
