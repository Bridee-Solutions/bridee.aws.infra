variable "db_username" {
  default     = "bridee"
  description = "Database main user"
  type        = string
}

variable "db_password" {
  default     = "bridee1234"
  description = "Database main password"
  type        = string
}

variable "private_subnet_id" {
  default     = ""
  description = "private subnet id"
  type        = string
}

variable "public_subnet_id" {
  default     = ""
  description = "public subnet id"
}