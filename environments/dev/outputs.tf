output "alb_url" {
  description = "Public URL of the web application."
  value       = "http://${module.web_tier.alb_dns_name}"
}

output "vpc_id" {
  description = "VPC ID."
  value       = module.network.vpc_id
}

output "public_subnets" {
  description = "Public subnet IDs."
  value       = module.network.public_subnet_ids
}