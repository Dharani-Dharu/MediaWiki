region               = "us-west-2"
create_vpc           = true
cidr                 = "10.0.0.0/16"
enable_dns_hostnames = true
enable_dns_support   = true
vpc_tags             = {
    "Name" = "MediaWiki-VPC"
    "Classification" = "internal/sensitive"
}
public_subnets_cidr  = ["10.0.4.0/27", "10.0.5.0/27"]
private_subnets_cidr = ["10.0.8.0/27", "10.0.9.0/27"]
azs                  = ["us-west-2a", "us-west-2b"]