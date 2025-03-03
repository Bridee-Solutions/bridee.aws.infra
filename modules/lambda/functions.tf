resource "aws_lambda_function" "wedding_job"{
    function_name = "bridee_wedding_job"
    description = "Job para invalidar casamentos"

    image_uri = var.wedding_job_image_uri
    package_type = Image
    runtime = java17

    vpc_config = {
        security_group_ids = [var.private_security_group_id]
        subnets_ids = [var.private_subnet_id]
    }
}

resource "aws_lambda_function" "upload_function"{
    function_name = "bridee_upload_function"
    description = "Upload Servless de arquivos para o bucket"

    image_uri = var.upload_function_image_uri
    package_type = Image
    runtime = java17

    vpc_config = {
        security_group_ids = [var.private_security_group_id]
        subnets_ids = [var.private_subnet_id]
    }
}