variable "db_ami" {
  description = "Enter the ami id of a DB machine"
  type        = string
}
variable "db_instance_type" {
  description = "Type of instance"
  type        = string
  default     = "t2.micro"
}
variable "key_pair_name" {
  description = "Name of instance key pair"
  type        = string
  default     = "usw2_keypair"
}
variable "ec2_sg_id" {
  description = "SG ID of EC2"
  type        = list(string)
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
