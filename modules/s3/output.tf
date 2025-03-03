output website_bucket_id {
  value       = aws_s3_bucket.s3_website.id
  sensitive   = true
  description = "Id do bucket para hospedar o front-end"
  depends_on  = []
}

output website_bucket_domain_name {
  value       = aws_s3_bucket.s3_website.bucket_domain_name
  sensitive   = true
  description = "description"
  depends_on  = []
}

