resource "aws_s3_bucket" "s3_user" {
  bucket = "bridee_user_bucket"

  tags = {
    Name = "bridee_user",
    IAC = true
  }
}