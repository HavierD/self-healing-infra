locals {
  name_prefix = var.name

  common_tags = merge(
    {
      Project   = var.name
      ManagedBy = "Terraform"
      Module    = "network"
    },
    var.tags
  )
}