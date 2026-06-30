

resource "aws_default_vpc" "default" {}

resource "aws_security_group" "devops_sg" {

  name = "devops-security-group"

  vpc_id = aws_default_vpc.default.id

  ingress {

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port = 80

    to_port = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port = 443

    to_port = 443

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port = 8080

    to_port = 8080

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

}

resource "aws_instance" "server" {

  ami = "ami-0f918f7e67a3323f0"

  instance_type = var.instance_type

  key_name = var.key_name

  vpc_security_group_ids = [

    aws_security_group.devops_sg.id

  ]

  tags = {

    Name = var.instance_name

  }

}
