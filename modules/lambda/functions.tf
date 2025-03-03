data "aws_iam_policy_document" "lambda_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.lambda_role.json
}

resource "aws_lambda_function" "wedding_job"{
    function_name = "bridee_wedding_job"
    description = "Job para invalidar casamentos"

    role = aws_iam_role.iam_for_lambda.arn
    image_uri = var.wedding_job_image_uri
    package_type = "Image"
    runtime = "java17"

    vpc_config {
        security_group_ids = [var.private_security_group_id]
        subnet_ids = [var.private_subnet_id]
    }
}

resource "aws_lambda_function" "upload_function"{
    function_name = "bridee_upload_function"
    description = "Upload Servless de arquivos para o bucket"

    role = aws_iam_role.iam_for_lambda.arn
    image_uri = var.upload_function_image_uri
    package_type = "Image"
    runtime = "java17"

    vpc_config {
        security_group_ids = [var.private_security_group_id]
        subnet_ids = [var.private_subnet_id]
    }
}