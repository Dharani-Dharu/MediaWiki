resource "aws_instance" "dbserver" {
  #depends_on = [aws_security_group.mw_sg]
  ami                    = var.db_ami
  instance_type          = var.db_instance_type
  key_name               = var.key_pair_name
  vpc_security_group_ids = var.ec2_sg_id
  subnet_id              = var.db_subnet_id
  tags                   = var.db_ec2_tags
}
