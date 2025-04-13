provider "aws" {
  region     = "us-east-1"
  access_key = "<your-access-key>"
  secret_key = "<your-secret-key>"
}

resource "aws_instance" "my_instance" {
  ami             = "<ami-id>"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.my_key.key_name
  tags = {
    name = "TFInstance"
  }
}

resource "aws_security_group" "main" {
  egress = [
    {
      from_port         = 0
      to_port           = 0
      cidr_blocks      = ["0.0.0.0/0"]   # Allow all outbound traffic
      ipv6_cidr_blocks = []
      self              = false
      prefix_list_ids   = []
      security_groups   = []
      description       = "Allow all outbound traffic"
    }
  ]

  ingress = [
    {
      from_port         = 22
      to_port           = 22
      cidr_blocks      = ["0.0.0.0/0"]   # Allow SSH access from anywhere
      ipv6_cidr_blocks = []
      self              = false
      prefix_list_ids   = []
      security_groups   = []
      description       = "Allow SSH access"
    }
  ]
}

resource "aws_key_pair" "my_key" {
  key_name   = "my_key"
  public_key = file("<path-to-your-public-key>")
}
