region                  = "us-west-2"
vpc_id                  = "vpc-01cabf9f1088c0e0b"
is_internal                = false
alb_name                = "alb-01"
load_balancer_type      = "application"
subnets_id_list         = ["subnet-05c7b677d8b320aac","subnet-09b9e801c4a2e0938"]
target_group_port       = 80
health_check            = [{
    "path" = "/"
    "port" = "traffic-port"
    "protocol" = "HTTP"
}]
http_listener_port      = 80
http_listener_protocol  = "HTTP"
ami_id                  = "ami-0bc06212a56393ee1"
instance_type           = "t2.micro"
private_subnet_ids      = ["subnet-0048c3e00acd5a3e1","subnet-022f127d86c1ec85f"]
max_instance_count      = 1
min_instance_count      = 1
desired_instance_count  = 1
asg_tags                = {
    "type" = "app"
    "Name" = "asg-ec2"
  }
alb_sg_id = ["sg-0181885552cd2fdce"]
ec2_sg_id = ["sg-05f8b70487372aba0"]
lc_name   = "lcv-03"
db_ami    = "ami-0bc06212a56393ee1"
db_instance_type = "t2.micro"
db_subnet_id = "subnet-0048c3e00acd5a3e1"
db_ec2_tags = {
  "type" = "db"
  "Name" = "db-ec2"
}
key_pair_name = "usw2_keypair"