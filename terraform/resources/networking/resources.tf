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

## The dynamic object type did not work as expected. So adding the values directly ##
## Check later and remove open to world SGs by launching a Bastion host
resource "aws_security_group" "ec2_sg" {
  name = "mw_sg"
  vpc_id = module.networking.vpc_id[0]
  ingress {
    from_port = 22 
    to_port  = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    from_port = 80
    to_port  = 80
    protocol = "TCP"
    cidr_blocks = ["10.0.0.0/8"]
  }
  ingress {
    from_port = 3306
    to_port  = 3306
    protocol = "TCP"
    cidr_blocks = ["10.0.0.0/8"]
  }
  egress {
    from_port = "0"
    to_port  = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "alb_sg" {
  name = "mw_alb_sg"
  vpc_id = module.networking.vpc_id[0]
   ingress {
    from_port = 80
    to_port  = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = "0"
    to_port  = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

