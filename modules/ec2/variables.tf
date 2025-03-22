variable "vpc_id" {
  type        = string
  default     = ""
  description = "Id da vpc"
}

variable "public_subnet_id" {
  type        = string
  default     = ""
  description = "Id da sub-rede pública"
}

variable "private_subnet_id" {
  type        = string
  default     = ""
  description = "Id da sub-rede privada"
}

variable "key_pair_name" {
  type        = string
  default     = ""
  description = "Nome do par de chaves, utilizado para acessar a EC2 na subnet pública"
}

variable "public_subnet_cidr_block" {
  type        = string
  default     = ""
  description = "Endereço de Ip e Cidr_block"
}

variable "public_security_group_ingress_rules" {
  type = map(any)
  default = {
    "ssh" : {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    "http" : {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    "https" : {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
  description = "description"
}

variable "public_security_group_egress_rules" {
  type = map(any)
  default = {
    "ssh" : {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    "http" : {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    "https" : {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
  description = "description"
}

variable "private_security_group_ingress_rules" {
  type = map(any)
  default = {
    "ssh" : {
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
    },
    "http" : {
      from_port = 80
      to_port   = 80
      protocol  = "tcp"
    },
    "https" : {
      from_port = 443
      to_port   = 443
      protocol  = "tcp"
    }

  }
  description = "description"
}

variable "private_security_group_egress_rules" {
  type = map(any)
  default = {
    "ssh" : {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [null]
    },
    "http" : {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp",
      cidr_blocks = ["0.0.0.0/0"]
    },
    "https" : {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
  description = "description"
}