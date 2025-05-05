variable "name" {
  type = string
}

variable "delay_seconds" {
  type    = number
  default = 0
}

variable "visibility_timeout_seconds" {
  type    = number
  default = 30
}

variable "message_retention_seconds" {
  type    = number
  default = 345600
}

variable "receive_wait_time_seconds" {
  type    = number
  default = 0
}

variable "batch_size" {
  type    = number
  default = 10
}

variable "lambda_arn" {
  type        = string
  description = "ARN da função Lambda que irá processar a fila"
}
