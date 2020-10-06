variable "region" {
    description = "Region to spin VPC in"
    type        = string
    default     = "us-west-2"
}
variable "vpc_id" {
  description = "Enter the VPC ID"
  type        = string
}
variable "is_internal" {
  description = "Boolean determining if the load balancer is internal or externally facing."
  type        = bool
  default     = false
}
variable "alb_name" {
  description = "The resource name and Name tag of the load balancer."
  type        = string
  default     = null
}
variable "load_balancer_type" {
  description = "The type of load balancer to create. Possible values are application or network."
  type        = string
  default     = "application"
}
variable "subnets_id_list" {
  description = "A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f']"
  type        = list(string)
  default     = null
}
variable "target_group_port" {
  description = "Port of TG"
  type        = number
  default     = 80
}
variable "target_group_protocol" {
  description = "Protocol of TG"
  type  = string
  default = "HTTP"
}
variable "health_check" {
  description = "Health check settings" 
  type = list(map(string))
  default = [{
    "path" = "/"
    "port" = "traffic-port"
    "protocol" = "HTTP"
  }]
}
variable "http_listener_port" {
  description = "Listener port for HTTP"
  type = number
  default = 80
}
variable "http_listener_protocol" {
  description = "Listener protocol"
  type = string
  default = "HTTP"
}
variable "ami_id" {
  description = "Enter the ami id of a  centos machine"
  type = string
}
variable "instance_type" {
  description = "Type of instance"
  type = string
  default = "t2.micro"
}
variable "private_subnet_ids" {
  description = "List of private subnet IDS"
  type = list(string)
  default = []
}
variable "max_instance_count" {
  description = "Max instance count"
  type = number
  default = 1
}
variable "min_instance_count" {
  description = "Min instance count"
  type = number
  default = 1
}
variable "desired_instance_count" {
  description = "Min instance count"
  type = number
  default = 1
}
variable "asg_tags" {
  description = "Tags for ASG instances"
  type = map(string)
  default = {
    "type" = "app"
    "Name" = "asg-ec2"
  }
}
variable "ec2_sg_id" {
  description = "SG ID of EC2"
  type = list(string)
}
variable "alb_sg_id" {
  description = "SG ID of ALB"
  type = list(string)
}
variable "lc_name" {
  description = "Name of launch configuration"
  type = string
  default = "lcv-01"
}
variable "db_ami" {
  description = "Enter the ami id of a DB machine"
  type        = string
}
variable "db_instance_type" {
  description = "Type of instance"
  type        = string
  default     = "t2.micro"
}
variable "db_subnet_id" {
  description = "List of private subnet IDS"
  type        = string
  default     = ""
}
variable "db_ec2_tags" {
  description = "Tags for ASG instances"
  type        = map(string)
  default = {
    "type" = "db"
    "Name" = "db-ec2"
  }
}
variable "key_pair_name" {
  description = "Name of instance key pair"
  type        = string
  default     = "usw2_keypair"
}




