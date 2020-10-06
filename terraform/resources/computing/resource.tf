module "asg" {
  source                 = "../../modules/asg"
  vpc_id                 = var.vpc_id
  is_internal            = var.is_internal
  alb_name               = var.alb_name
  load_balancer_type     = var.load_balancer_type
  subnets_id_list        = var.subnets_id_list
  target_group_port      = var.target_group_port
  health_check           = var.health_check
  http_listener_port     = var.http_listener_port
  http_listener_protocol = var.http_listener_protocol
  ami_id                 = var.ami_id
  instance_type          = var.instance_type
  private_subnet_ids     = var.private_subnet_ids
  max_instance_count     = var.max_instance_count
  min_instance_count     = var.min_instance_count
  desired_instance_count = var.desired_instance_count
  asg_tags               = var.asg_tags
  ec2_sg_id              = var.ec2_sg_id
  alb_sg_id              = var.alb_sg_id
  lc_name                = var.lc_name
}

module "dbserver" {

  source             = "../../modules/ec2"
  db_ami             = var.db_ami
  db_instance_type   = var.db_instance_type
  key_pair_name      = var.key_pair_name
  ec2_sg_id          = var.ec2_sg_id
  db_subnet_id = var.db_subnet_id
  db_ec2_tags        = var.db_ec2_tags

}
