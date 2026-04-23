
module "network" {
  source = "../../modules/network"

  name                = var.name_prefix
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs

  tags = {
    Environment = var.environment
  }
}

module "web_tier" {
  source = "../../modules/web_tier"

  name       = var.name_prefix
  vpc_id     = module.network.vpc_id
  subnet_ids = module.network.public_subnet_ids

  instance_type    = var.instance_type
  desired_capacity = 2
  min_size         = 2
  max_size         = 4

  enable_container = var.enable_container
  container_image  = var.container_image

  tags = {
    Environment = var.environment
  }
}