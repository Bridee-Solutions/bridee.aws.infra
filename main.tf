module "network" {
  source = "./modules/vpc"
}

# module "rds" {
#   source = "./modules/rds"
#   private_subnet_id = module.network.private_subnet_id
#   public_subnet_id = module.network.public_subnet_id

#   depends_on = [
#     module.network
#   ]
# }

module "key" {
  source = "./modules/keypair"
}

module "ec2" {
  source                   = "./modules/ec2"
  private_subnet_id        = module.network.private_subnet_id
  public_subnet_id         = module.network.public_subnet_id
  public_subnet_cidr_block = module.network.public_subnet_cidr_block
  vpc_id                   = module.network.vpc_id
  key_pair_name            = module.key.key_pair_name

  depends_on = [
    module.network
  ]
}

module "s3" {
  source = "./modules/s3"
}

# module "lambda_functions"{
#   source = "./modules/lambda"

#   private_security_group_id = module.ec2.private_security_group_id
#   private_subnet_id = module.network.private_subnet_id
#   wedding_job_image_uri = var.wedding_job_image_uri
#   upload_function_image_uri = var.upload_function_image_uri

#   depends_on = [
#     module.network,
#     module.ec2
#   ]
# }

# module "cloudfront"{
#   source = "./modules/cloudfront"

#   bucket_domain_name = module.s3.website_bucket_domain_name
#   origin_id = module.s3.website_bucket_id

#   cdn_price_class    = "PriceClass_200"
#   cdn_tags = {
#     Iac = true
#   }

#   depends_on = [
#     module.s3
#   ]

# }