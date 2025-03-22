variable "region" {
  type        = string
  default     = "us-east-1"
  description = "Região da aws"
}

variable "access_key" {
  type        = string
  default     = ""
  description = "Chave de acesso da aws"
}

variable "secret_key" {
  type        = string
  default     = ""
  description = "Secret Key da AWS"
}

variable "session_token" {
  type        = string
  default     = ""
  description = "Token de sessão da aws"
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
