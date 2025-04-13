resource "aws_instance" "ec2_example" {
  count = 3
  ami = "ami-0767046d1677be5a0"
  instance_type = "t2.micro"
  tags = {
    Name = "test-t2-micro"
  }
}

resource "aws_iam_access_key" "example" {
  user = aws_iam_user.example.name
}

output "access_key" {
  value = nonsensitive(aws_iam_access_key.example.id)
}

output "list_of_instance"
{
    value = ["${aws_instance.ec2_example.*.public_ip}"]
}