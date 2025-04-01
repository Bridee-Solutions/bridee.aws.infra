terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws",
      version = "5.82.2"
    }
  }

  # backend "s3" {
  #   bucket  = "bridee-terraform-bucket"
  #   region  = "us-east-1"
  #   key     = "terraform.tfstate"
  #   encrypt = true
  # }
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
  token      = var.session_token
}