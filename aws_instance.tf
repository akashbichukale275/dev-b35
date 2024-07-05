provider "aws" {
  region  = "us-east-1"
  profile = "tf-user"

}


resource "aws_instance" "instance" {
  ami                    = "ami-01b799c439fd5516a"
  instance_type          = "t2.micro"
  key_name               = "akash"
  vpc_security_group_ids = [aws_security_group.security.id]

  tags = {
    Name = "terraform-instance"
  }

}

resource "aws_security_group" "security" {
  name   = "tf-sg"
  vpc_id = "vpc-034ab80cd2af3daf9"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}

output "public_ip" {
  value = aws_instance.instance.public_ip
}

output "private_ip" {
  value = aws_instance.instance.private_ip
}
