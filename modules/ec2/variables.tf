variable vpc_id {
  type        = string
  default     = ""
  description = "Id da vpc"
}

variable public_subnet_id {
  type        = string
  default     = ""
  description = "Id da sub-rede pública"
}

variable private_subnet_id {
  type        = string
  default     = ""
  description = "Id da sub-rede privada"
}

variable key_pair_name {
  type        = string
  default     = ""
  description = "Nome do par de chaves, utilizado para acessar a EC2 na subnet pública"
}