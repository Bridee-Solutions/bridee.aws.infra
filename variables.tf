variable "region" {
  type        = string
  default     = "us-east"
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
