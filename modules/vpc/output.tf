output "private_subnet_id" {
  value = aws_subnet.bridee_private_subnet.id
  description = "private subnet id"
  sensitive = false
}

output "public_subnet_id" {
  value = aws_subnet.bridee_public_subnet.id
  description = "public subnet id"
  sensitive = false
}