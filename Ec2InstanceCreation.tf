provider "aws"
{
    region = "us=east-1",
    access_key = "",
    secret_key = ""
}

resource "aws_instance" "my_instance"
{
    ami = "",
    instance_type = "t2.micro",
    aws_key = "",
    tags = {
        name = "TFInstance"
    }
}

resource "aws_security_group" "main"
{
    egress = {
        [
            from_port = ,
            to_port = ,
            cidr_block = [],
            ipv6_cidr_block = [],
            self= true,
            prefix_list_ids =[],
            security_group= [],
            description =""
        ]
    }

    ingress = {
        [
            from_port = ,
            to_port = ,
            cidr_block = [],
            ipv6_cidr_block = [],
            self= true,
            prefix_list_ids =[],
            security_group= [],
            description =""
        ]
    }
}

resource "aws_key" "my_key"
{
    name = "my_key",
    public_key = file()
}