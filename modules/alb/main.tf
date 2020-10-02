terraform {
  required_version = "= 0.13.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.8.0"
    }
  }
}

resource "aws_lb" "this" {
  count = var.create_lb ? 1 : 0

  name        = var.alb_name

  load_balancer_type = var.load_balancer_type
  internal           = var.is_internal
  security_groups    = var.security_groups_list
  subnets            = var.subnets_id_list

  idle_timeout                     = var.idle_timeout
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  enable_deletion_protection       = var.enable_deletion_protection
  enable_http2                     = var.enable_http2
  ip_address_type                  = var.ip_address_type
  drop_invalid_header_fields       = var.drop_invalid_header_fields


  dynamic "access_logs" {
    for_each = length(keys(var.access_logs)) == 0 ? [] : var.access_logs

    content {
      enabled = lookup(access_logs.value, "enabled")
      bucket  = lookup(access_logs.value, "bucket")
      prefix  = lookup(access_logs.value, "prefix", null)
    }
  }

  dynamic "subnet_mapping" {
    for_each = var.subnet_mapping

    content {
      subnet_id     = subnet_mapping.value.subnet_id
      allocation_id = lookup(subnet_mapping.value, "allocation_id", null)
    }
  }

  tags = var.elb_tags

}
