provider "aws" {
  region     = "us-east-1"          # AWS region
  access_key = "AKIAEXAMPLEKEY"      # Your AWS access key
  secret_key = "EXAMPLESECRETKEY"    # Your AWS secret key
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0c55b159cbfafe1f0"   # Ubuntu 20.04 AMI ID for us-east-1
  instance_type = "t2.micro"                 # EC2 instance type (t2.micro is eligible for the free tier)
  count         = 1                          # Number of EC2 instances to create

  tags = var.set_environment
}

resource "aws_iam_user" "users" {
  count = length(var.exampleUser)
  name  = var.exampleUser[count.index]
}

variable "set_environment" {
  description = "Environment tags for the instance"
  type        = map(string)
  default = {
    project     = "project-alpha"  # Project name
    environment = "dev"            # Environment name (dev)
  }
}

variable "exampleUser" {
  description = "IAM usernames"
  type        = list(string)
  default     = ["ab", "ac", "ad"]  # Dummy IAM user names
}
