module "networking" {
  source               = "../../modules/networking/"
  create_vpc           = var.create_vpc
  cidr                 = var.cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  vpc_tags             = var.vpc_tags
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  azs                  = var.azs
}
