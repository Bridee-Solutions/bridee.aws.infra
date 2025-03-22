resource "aws_ecr_repository" "bridee_repository" {
  name                 = "bridee-repository"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}