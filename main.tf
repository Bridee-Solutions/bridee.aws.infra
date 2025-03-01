module "network" {
  source = "./modules/vpc"
}

module "rds" {
  source = "./modules/rds"
  private_subnet_id = module.network.private_subnet_id
  public_subnet_id = module.network.public_subnet_id
}

module "ec2"{
  source = "./modules/ec2"
  private_subnet_id = module.network.private_subnet_id
  public_subnet_id = module.network.public_subnet_id
  vpc_id = module.network.vpc_id
}