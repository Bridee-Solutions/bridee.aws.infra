resource "aws_secretsmanager_secret" "bridee_secrets_manager" {
  name        = "bridee-secrets-manager"
  description = "Secret manager for bridee applications"

  tags = {
    IAC = true
  }
}