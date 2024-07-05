provider "aws" {
  region  = "us-east-1"
  profile = "tf-user"

}

resource "aws_iam_user" "demo" {
  name = "roman"
}

resource "aws_iam_user" "demo1" {
  name = "seth"
}

resource "aws_iam_user" "demo2" {
  name = "cody"
}

resource "aws_iam_group" "grp" {
  name = "wwe"
}

resource "aws_iam_group_membership" "members" {
  name = "tf-testing-group"

  users = [
    aws_iam_user.demo.name,
    aws_iam_user.demo1.name,
    aws_iam_user.demo2.name
  ]

  group = aws_iam_group.grp.name
}

resource "aws_s3_bucket" "bucket" {
  bucket = "akashb275"

  tags = {
    Name        = "ak-bucket"
    Environment = "Dev"

  }
}
