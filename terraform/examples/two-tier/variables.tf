# ---------------------------------------------------------------------------------------------------------------------
# PUBLIC_KEY_PATH VARIABLE
# Defines the path to the public_key
# ---------------------------------------------------------------------------------------------------------------------
variable "public_key_path" {
  description = <<DESCRIPTION
Path to the SSH public key to be used for authentication.
Ensure this keypair is added to your local SSH agent so provisioners can
connect.
Example: ~/.ssh/terraform.pub
DESCRIPTION
  default = "~/.ssh/terraform_rsa.pub"
}

# ---------------------------------------------------------------------------------------------------------------------
# AWS_KEY_PAIR_NAME VARIABLE
# Defines the name of AWS key pair
# ---------------------------------------------------------------------------------------------------------------------
variable "key_name" {
  description = "Desired name of AWS key pair"
  default = "~/.ssh/terraform_rsa"
}

# ---------------------------------------------------------------------------------------------------------------------
# AWS_REGION VARIABLE
# Defines default region
# ---------------------------------------------------------------------------------------------------------------------
variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-west-2"
}

# ---------------------------------------------------------------------------------------------------------------------
# REGION/AMI MAP VARIABLE
# Defines association between regions and AMIs
# ---------------------------------------------------------------------------------------------------------------------
# Ubuntu Precise 12.04 LTS (x64)
variable "aws_amis" {
  default = {
    eu-west-1 = "ami-674cbc1e"
    us-east-1 = "ami-1d4e7a66"
    us-west-1 = "ami-969ab1f6"
    us-west-2 = "ami-8803e0f0"
  }
}