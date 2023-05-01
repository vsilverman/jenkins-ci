variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "shared_credentials_files" {
  description = "list of cred files"
  type        = list
  default     = ["/path/to/credentials/file"]
}

variable "key_name" {
  description = "value of key_name"
  type        = string
  default     = "default"
}

variable "my_ami" {
  description = "value of my_ami"
  type        = string
  default     = "ami-027386b91d3c0bf78"
}
