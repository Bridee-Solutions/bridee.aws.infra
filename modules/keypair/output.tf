output "key_pair_name" {
  value       = aws_key_pair.key_pair.key_name
  sensitive   = true
  description = "description"
  depends_on  = []
}
