locals {
  name_prefix = var.name

  http_port = 80

  common_tags = merge(
    {
      Project   = var.name
      ManagedBy = "Terraform"
      Module    = "web_tier"
    },
    var.tags
  )
}