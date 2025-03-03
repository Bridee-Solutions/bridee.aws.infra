resource "aws_s3_bucket" "s3_user" {
  bucket = "bridee_user_bucket"

  # lifecycle{
  #   prevent_destroy = true
  # }

  tags = {
    Name = "bridee_user",
    IAC = true
  }
}

resource "aws_s3_bucket" "s3_website" {
  bucket = "bridee_ui"

  tags = {
    Name = "bridee_ui",
    IAC = true
  }
}

resource "aws_s3_bucket_website_configuration" "bridee_website"{
  bucket = aws_s3_bucket.s3_website.id

  index_document{
    suffix = "index.html"
  }

  error_document{
    key = "index.html"
  }

  tags = {
    IAC = true
  }
}