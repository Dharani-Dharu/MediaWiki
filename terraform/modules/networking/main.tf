terraform {
  required_version = "= 0.13.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.8.0"
    }
  }
}

resource "aws_vpc" "vpc" {
  count                = var.create_vpc ? 1 : 0
  cidr_block           = var.cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  tags                 = var.vpc_tags
}

resource "aws_internet_gateway" "igw" {
  count  = var.create_vpc && length(var.public_subnets_cidr) > 0 ? 1 : 0
  vpc_id = aws_vpc.vpc[0].id
  tags   = var.igw_tags
}


## Public ##
resource "aws_route_table" "public_rt" {
  count  = var.create_vpc && length(var.public_subnets_cidr) > 0 ? 1 : 0
  vpc_id = aws_vpc.vpc[0].id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw[0].id
  }
  tags = var.route_table_tags
}

## Public Subnets ##
resource "aws_subnet" "public_subnet" {
  count                   = var.create_vpc && length(var.public_subnets_cidr) > 0 ? length(var.public_subnets_cidr) : 0
  vpc_id                  = aws_vpc.vpc[0].id
  cidr_block              = element(var.public_subnets_cidr, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = format("%s-%s", "PUB-Subnet-0", count.index + 1)
  }
}


## Private Subnets ##
resource "aws_subnet" "private_subnet" {
  count                   = var.create_vpc && length(var.private_subnets_cidr) > 0 ? length(var.private_subnets_cidr) : 0
  vpc_id                  = aws_vpc.vpc[0].id
  cidr_block              = element(var.private_subnets_cidr, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = false
  tags = {
    Name = format("%s-%s", "PVT-Subnet-0", count.index + 1)
  }
}

## NAT ##
resource "aws_eip" "eip" {
  vpc  = true
  tags = var.eip_tags
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet[0].id
}

## Private ##
resource "aws_route_table" "private_rt" {
  count  = var.create_vpc && length(var.private_subnets_cidr) > 0 ? 1 : 0
  vpc_id = aws_vpc.vpc[0].id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = var.route_table_tags
}

## Route table associations ##
resource "aws_route_table_association" "pub" {
  count          = length(var.public_subnets_cidr)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public_rt[0].id
}

## Route table associations ##
resource "aws_route_table_association" "pvt" {
  count          = length(var.private_subnets_cidr)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private_rt[0].id
}


