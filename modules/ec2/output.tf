output "private_security_group_id" {
  value       = aws_security_group.bridee_private_security_group.id
  sensitive   = true
  description = "description"
  depends_on  = []
}

output "public_security_group_id" {
  value       = aws_security_group.bridee_public_security_group.id
  sensitive   = true
  description = "description"
  depends_on  = []
}
