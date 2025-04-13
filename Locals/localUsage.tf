
provider "aws" {
  region     = "us-east-1"
  access_key = "<your-access-key>"
  secret_key = "<your-secret-key>"
}

locals
{
    name = "Prathvi"
}

resource "aws_instance" "my_instance" {
  ami             = "<ami-id>"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.my_key.key_name
  tags = {
    Name = "${local.name}-EC2-instance"
  }
}