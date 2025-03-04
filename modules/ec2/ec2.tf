resource "aws_security_group" "bridee_public_security_group"{
    vpc_id = var.vpc_id
    description = "Grupo de seguranca para os recursos da rede publica"

    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        IAC = true
    }
}

resource "aws_instance" "api_gateway_instance"{
    ami = "ami-007855ac798b5175e"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    key_name = var.key_pair_name
    tenancy = "default"
    subnet_id = var.public_subnet_id
    security_groups = ["${aws_security_group.bridee_public_security_group.id}"]

    tags = {
        IAC = true
    }
}

resource "aws_security_group" "bridee_private_security_group"{
    vpc_id = var.vpc_id
    description = "Grupo de seguranca para os recursos da rede privada"

    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress{
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        IAC = true
    }
}

resource "aws_instance" "application_instance"{
    ami = "ami-007855ac798b5175e"
    instance_type = "t2.micro"
    availability_zone = "us-east-1b"
    tenancy = "default"
    subnet_id = var.private_subnet_id
    security_groups = ["${aws_security_group.bridee_public_security_group.id}"]

    tags = {
        IAC = true
    }
}