variable "private_security_group_id" {
  type        = string
  default     = ""
  description = "Id do grupo de segurança dos recursos da subnet privada"
}

variable "private_subnet_id" {
  type        = string
  default     = ""
  description = "Id da subnet privada"
}

variable "wedding_job_image_uri" {
  type        = string
  default     = ""
  description = "Uri da imagem do job na ECR"
}

variable "upload_function_image_uri" {
  type        = string
  default     = ""
  description = "Uri da imagem da função de upload"
}
