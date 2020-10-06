variable "create_vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}
variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}
variable "vpc_tags" {
    description = "Tags to be added for VPC"
    type = map(string)
    default = {
        "classification" = "internal/sensitive"
    }
}
variable "public_subnets_cidr" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}
variable "private_subnets_cidr" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = []
}
variable "igw_tags" {
    description = "Tags to be added for IGW"
    type = map(string)
    default = {
        "classification" = "internal/sensitive"
    }
}
variable "route_table_tags" {
    description = "Tags to be added for Route table"
    type = map(string)
    default = {
        "classification" = "internal/sensitive"
    }
}
variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = []
}
variable "eip_tags" {
    description = "Tags to be added for ElasticIP"
    type = map(string)
    default = {
        "classification" = "internal/sensitive"
    }
}



