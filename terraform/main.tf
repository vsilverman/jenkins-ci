variable "region" {}

variable "shared_credentials_file" {}

variable "profile" {}

variable "key_name" {}

variable "my_ami" {}

provider "aws" {
  region = "${var.region}"
  shared_credentials_file = "${var.shared_credentials_file}" 
  profile                 = "${var.profile}"
}

resource "aws_instance" "web" {
  ami		= "ami-027386b91d3c0bf78"
  instance_type = "t1.micro"
  key_name = "${var.key_name}"  
  tags = {
    Name = "mylabs"
  }
}

