variable "vpc_id" {
  description = "Enter the VPC ID"
  type        = string
}
variable "drop_invalid_header_fields" {
  description = "Indicates whether invalid header fields are dropped in application load balancers. Defaults to false."
  type        = bool
  default     = false
}
variable "enable_deletion_protection" {
  description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false."
  type        = bool
  default     = false
}
variable "enable_http2" {
  description = "Indicates whether HTTP/2 is enabled in application load balancers."
  type        = bool
  default     = true
}
variable "enable_cross_zone_load_balancing" {
  description = "Indicates whether cross zone load balancing should be enabled in application load balancers."
  type        = bool
  default     = false
}
variable "idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle."
  type        = number
  default     = 60
}
variable "ip_address_type" {
  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack."
  type        = string
  default     = "ipv4"
}
variable "alb_name" {
  description = "The resource name and Name tag of the load balancer."
  type        = string
  default     = "alb-01"
}
variable "load_balancer_type" {
  description = "The type of load balancer to create. Possible values are application or network."
  type        = string
  default     = "application"
}
variable "is_internal"{
  description ="is ALB internal"
  type = bool
  default = false
}
variable "subnets_id_list" {
  description = "A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f']"
  type        = list(string)
  default     = null
}
variable "elb_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {
      "classificaton" = "internal/sensitive"
  }
}
variable "target_group_name" {
  description = "The resource name and Name tag of the TG"
  type        = string
  default     = "tg-01"
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
variable "target_group_tags" {
  description = "Tags for the target group"
  type = map(string)
  default = {
    tier = "public"
  }
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
variable "instance_role_name" {
  description = "Name of the Instance IAM role"
  default = "instance-role"
  type = string
}
variable "iam_role_tags" {
  description = "Tags for IAM role"
  type = map(string)
  default = {
    "Name" = "instance-role"
  }
}
variable "instance_profile_name" {
  description = "Name of the Instance IAM profile"
  default = "instance-profile"
  type = string
}
variable "instance_access_policy_name" {
  description = "Name of the Instance IAM access policy"
  default = "instance-access-policy"
  type = string
}
variable "key_pair_name" {
  description = "Name of instance key pair"
  type = string
  default = "usw2_keypair"
}
variable "lc_name" {
  description = "Name of launch configuration"
  type = string
  default = "lcv-01"
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
variable "asg_name" {
  description = "Name of ASG"
  type = string
  default = "asg-01"
}
variable "azs" {
  description = "List of AZ"
  type = list(string)
  default = ["us-west-2a","us-west-2b"]
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
variable "health_check_type" {
  description = "Type of health check"
  type = string
  default = ""
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







