resource "aws_security_group" "bridee_public_security_group" {
  vpc_id      = var.vpc_id
  description = "Grupo de seguranca para os recursos da rede publica"

  dynamic "ingress" {
    for_each = var.public_security_group_ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.public_security_group_egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    IAC = true
  }
}

resource "aws_instance" "api_gateway_instance" {
  ami               = "ami-007855ac798b5175e"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = var.key_pair_name
  tenancy           = "default"
  subnet_id         = var.public_subnet_id
  security_groups   = ["${aws_security_group.bridee_public_security_group.id}"]

  tags = {
    IAC = true
  }
}

resource "aws_security_group" "bridee_private_security_group" {
  vpc_id      = var.vpc_id
  description = "Grupo de seguranca para os recursos da rede privada"

  dynamic "ingress" {
    for_each = var.private_security_group_ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = [var.public_subnet_cidr_block]
    }
  }

  dynamic "egress" {
    for_each = var.private_security_group_egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks[0] == null ? [var.public_subnet_cidr_block] : egress.value.cidr_blocks
    }
  }

  tags = {
    IAC = true
  }
}

resource "aws_instance" "application_instance" {
  ami               = "ami-007855ac798b5175e"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1b"
  tenancy           = "default"
  key_name          = var.key_pair_name
  subnet_id         = var.private_subnet_id
  security_groups   = ["${aws_security_group.bridee_private_security_group.id}"]

  tags = {
    IAC = true
  }
}