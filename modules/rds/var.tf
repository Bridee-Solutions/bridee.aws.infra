variable "db_username" {
  default = ""
  description = "Database main user"
  type = string
}

variable "db_password" {
  default = ""
  description = "Database main password"
  type = string
}

variable "private_subnet_id" {
  default = ""
  description = "private subnet id"
  type = string
}