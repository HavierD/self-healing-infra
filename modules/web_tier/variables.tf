variable "name" {
  description = "Name prefix for the web tier resources."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where ALB/ASG will be created."
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for ALB and ASG (recommend 2+ across AZs)."
  type        = list(string)

  validation {
    condition     = length(var.subnet_ids) >= 2
    error_message = "subnet_ids must contain at least 2 subnets (for ALB across AZs)."
  }
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "Optional AMI ID. If null, the module will lookup latest Amazon Linux 2023 AMI."
  type        = string
  default     = null
}

variable "min_size" {
  description = "ASG minimum size."
  type        = number
  default     = 2
}

variable "desired_capacity" {
  description = "ASG desired capacity."
  type        = number
  default     = 2
}

variable "max_size" {
  description = "ASG max size."
  type        = number
  default     = 4
}

variable "health_check_grace_period" {
  description = "ASG health check grace period seconds."
  type        = number
  default     = 60
}

variable "tags" {
  description = "Additional tags."
  type        = map(string)
  default     = {}
}

# Optional container bonus
variable "enable_container" {
  description = "If true, user-data will install docker and run container_image."
  type        = bool
  default     = false
}

variable "container_image" {
  description = "Container image to run (e.g., ghcr.io/user/repo:tag). Required when enable_container=true."
  type        = string
  default     = ""
}

variable "container_port" {
  description = "Container exposed port on the instance."
  type        = number
  default     = 80
}