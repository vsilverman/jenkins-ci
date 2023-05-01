# ------------------------------------------------------------------------------
# OPTIONS FOR DYNAMIC CONFIGURATION
# ------------------------------------------------------------------------------
# you may declare variables in this section, then
# provide var values in e.g. "variables.tfvar" file
# and pass name of the file in terraform command:
#  --->  terraform plan -var-file=variables.tfvars

# variable "region" {}
# variable "shared_credentials_files" {}
# variable "profile" {}
# variable "key_name" {}
# variable "my_ami" {}

# ------------------------------------------------------------------------------
# In our case we configure all variables in default "variables.tf" file
# ------------------------------------------------------------------------------
provider "aws" {
  region = "${var.aws_region}"
  shared_credentials_files = "${var.shared_credentials_files}" 
  profile                  = "default"
}

resource "aws_key_pair" "my_key_pair" {
  key_name   = var.key_name
  public_key = file("/path/to/your/public_key")
}

resource "aws_instance" "web" {
  ami		= "ami-027386b91d3c0bf78"
  instance_type = "t1.micro"
  key_name = aws_key_pair.my_key_pair.key_name  
  tags = {
    Name = "mylabs"
  }
}

