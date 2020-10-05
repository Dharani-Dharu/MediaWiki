output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.networking.vpc_id
}
output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = module.networking.vpc_arn
}
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.networking.vpc_cidr_block
}
output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = module.networking.vpc_enable_dns_support
}
output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = module.networking.vpc_enable_dns_hostnames
}
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.networking.private_subnets
}
output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = module.networking.private_subnet_arns
}
output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.networking.private_subnets_cidr_blocks
}
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.networking.public_subnets
}
output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = module.networking.public_subnet_arns
}
output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.networking.public_subnets_cidr_blocks
}
output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = module.networking.public_route_table_ids
}
output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = module.networking.private_route_table_ids
}
output "nat_ids" {
  description = "List of allocation ID of Elastic IPs created for AWS NAT Gateway"
  value       = module.networking.nat_ids
}
output "natgw_ids" {
  description = "List of NAT Gateway IDs"
  value       = module.networking.natgw_ids
}
output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = module.networking.igw_id
}
output "igw_arn" {
  description = "The ARN of the Internet Gateway"
  value       = module.networking.igw_arn
}




