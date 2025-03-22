output "private_subnet_id" {
  value       = aws_subnet.bridee_private_subnet.id
  description = "private subnet id"
  sensitive   = false
}

output "public_subnet_id" {
  value       = aws_subnet.bridee_public_subnet.id
  description = "public subnet id"
  sensitive   = false
}

output "vpc_id" {
  value       = aws_vpc.bridee_vpc.id
  sensitive   = false
  description = "vpc id"
}


output "public_subnet_cidr_block" {
  value       = aws_subnet.bridee_public_subnet.cidr_block
  sensitive   = false
  description = "Public Subnet cidr_block"
}