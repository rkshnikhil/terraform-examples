provider "aws" {
  access_key = "ACCESS_KEY_HERE"
  secret_key = "SECRET_KEY_HERE"
  region     = "us-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0bdb828fd58c52235"
  instance_type = "t2.micro"
}