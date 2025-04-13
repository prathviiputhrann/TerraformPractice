provider "aws" {
  region     = "us-east-1"
  access_key = "<your-access-key>"
  secret_key = "<your-secret-key>"
}

resource "aws_key_pair" "my_key" {
  key_name   = "my_key"
  public_key = file("<path-to-your-public-key>")  # e.g., ~/.ssh/id_rsa.pub
}

resource "aws_security_group" "main" {
  name        = "tf-sg"
  description = "Allow SSH"

  ingress = [
    {
      from_port         = 22
      to_port           = 22
      protocol          = "tcp"
      cidr_blocks       = ["0.0.0.0/0"]
      ipv6_cidr_blocks  = []
      self              = false
      prefix_list_ids   = []
      security_groups   = []
      description       = "Allow SSH access"
    }
  ]

  egress = [
    {
      from_port         = 0
      to_port           = 0
      protocol          = "-1"  # -1 means all protocols
      cidr_blocks       = ["0.0.0.0/0"]
      ipv6_cidr_blocks  = []
      self              = false
      prefix_list_ids   = []
      security_groups   = []
      description       = "Allow all outbound traffic"
    }
  ]
}

resource "aws_instance" "my_instance" {
  ami             = "<ami-id>"  # e.g., ami-0c55b159cbfafe1f0 for Amazon Linux 2
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.main.id]

  tags = {
    Name = "TFInstance"
  }

  provisioner "file" {
    source      = "<local-path-to-your-script>"        # e.g., ./startup.sh
    destination = "/home/ec2-user/asd.sh"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"                          # Amazon Linux default user
    host        = self.public_ip
    private_key = file("<path-to-private-key>")       # e.g., ~/.ssh/id_rsa
    timeout     = "4m"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ec2-user/asd.sh",
      "/home/ec2-user/asd.sh"
    ]
  }
}
