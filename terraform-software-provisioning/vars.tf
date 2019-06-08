variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION"{
    default = "eu-west-1"
}
variable "AMIS" {
    type = "map"
    default = {
    us-east-1 = "ami-0ff8a91507f77f867"
    us-west-2 = "ami-a0cfeed8"
    eu-west-1 = "ami-047bb4163c506cd98"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "ec2webserverkey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "ec2webserverkey.pub"
}
variable "INSTANCE_USERNAME" {
  default = "ec2-user"
}