provider "aws" {
  region     = "us-east-1"
  access_key = "<your-access-key>"
  secret_key = "<your-secret-key>"
}

locals
{
    instance_details = "${var.details}-Prathvi"      # From variable
}

resource "aws_instance" "my_instance" {
  ami             = "<ami-id>"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.my_key.key_name
  tags = {
    Name = "${local.instance_details}-instance"       # From local
  }
}

variable "details" {
  description = "For the EC2 instance"
  type        = string
  default     = "us-east-1" #  Dummy default
}