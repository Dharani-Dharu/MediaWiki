output "this_lb_id" {
  description = "The ID and ARN of the load balancer we created."
  value       = aws_lb.alb.*.id
}

output "this_lb_arn" {
  description = "The ID and ARN of the load balancer we created."
  value       = aws_lb.alb.*.arn
}

output "this_lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = aws_lb.alb.*.dns_name
}

output "private_key" {
  value = tls_private_key.mediawiki_pvt_key.private_key_pem
  sensitive = true
}

