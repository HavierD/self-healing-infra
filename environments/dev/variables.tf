variable "aws_region" {
  description = "AWS region to deploy resources into."
  type        = string
  default     = "ap-southeast-2"
}

variable "environment" {
  description = "Environment name (e.g. dev, staging, prod)."
  type        = string
  default     = "dev"
}

variable "name_prefix" {
  description = "Global name prefix for all resources."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks."
  type        = list(string)
}

variable "instance_type" {
  description = "Instance type for web tier."
  type        = string
  default     = "t3.micro"
}

variable "enable_container" {
  description = "Enable container-based web server."
  type        = bool
  default     = false
}

variable "container_image" {
  description = "Container image to run when enable_container=true."
  type        = string
  default     = ""
}
