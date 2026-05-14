module "network" {
  source = "./modules/network"

  vpc_cidr              = var.vpc_cidr
  public_subnet_1_cidr  = var.public_subnet_1_cidr
  public_subnet_2_cidr  = var.public_subnet_2_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
}

module "security" {
  source = "./modules/security"

  vpc_id = module.network.vpc_id
}

module "ec2" {
  source = "./modules/ec2"

  ami_id       = var.ami_id
  instance_type = var.instance_type
  key_name     = var.key_name

  public_subnet_id  = module.network.public_subnet_1_id
  private_subnet_1  = module.network.private_subnet_1_id
  private_subnet_2  = module.network.private_subnet_2_id

  public_sg_id  = module.security.public_sg_id
  private_sg_id = module.security.private_sg_id
}