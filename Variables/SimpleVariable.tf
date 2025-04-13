provider "aws" {
  region     = "us-east-1"
  access_key = "<your-access-key>"
  secret_key = "<your-secret-key>"
}

resource "aws_instance" "my_ec2" {
  ami                         = var.ami
  count                       = var.instance_count
  associate_public_ip_address = var.pub_ip
  instance_type               = "t2.micro"
  key_name                    = "my_key"
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0abcdef1234567890" #  Dummy default
}

variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 1
}

variable "pub_ip" {
  description = "Whether to assign a public IP"
  type        = bool
  default     = true
}
