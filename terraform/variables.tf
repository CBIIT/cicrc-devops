# Global
variable "project" {
  description = "name of the project"
  type        = string
}

variable "tags" {
  description = "tags to associate with this instance"
  type        = map(string)
}

variable "vpc_id" {
  description = "vpc id to to launch the ALB"
  type        = string
}

variable "region" {
  description = "aws region to use for this resource"
  type        = string
  default     = "us-east-1"
}

variable "private_subnet_ids" {
  description = "Provide list private subnets to use in this VPC. Example 10.0.10.0/24,10.0.11.0/24"
  type        = list(string)
}

variable "microservices" {
  type = map(object({
    name                      = string
    port                      = number
    health_check_path         = string
    priority_rule_number      = number
    image_url                 = string
    cpu                       = number
    memory                    = number
    path                      = list(string)
    number_container_replicas = number
  }))
}

# ALB
#variable "certificate_domain_name" {
#  description = "domain name for the ssl cert"
#  type        = string
#}

variable "public_subnet_ids" {
  description = "Provide list of public subnets to use in this VPC. Example 10.0.1.0/24,10.0.2.0/24"
  type        = list(string)
}

variable "s3_force_destroy" {
  description = "force destroy bucket"
  default     = true
  type        = bool
}

# ECR
variable "ecr_repo_names" {
  description = "list of repo names"
  type        = list(string)
}

variable "create_ecr_repos" {
  type        = bool
  default     = false
  description = "choose whether to create ecr repos or not"
}

# ECS
variable "allow_cloudwatch_stream" {
  type        = bool
  default     = true
  description = "allow cloudwatch stream for the containers"
}

# S3
variable "aws_account_id" {
  type        = map(string)
  description = "aws account to allow for alb s3 logging"
  default = {
    us-east-1 = "127311923021"
  }
}

# RDS
#variable "db_security_groups" {
#  description = "The DB security groups to use"
#  type        = list(string)
#}

variable "db_subnet_ids" {
  description = "Provide list of subnets to use for the RDS DB - this should consist of subnet IDs"
  type        = list(string)
}

####### UNUSED #######
#variable "iam_prefix" {
#  type        = string
#  default     = "power-user"
#  description = "nci iam power user prefix"
#}

#variable "attach_bucket_policy" {
#  description = "set to true if you want bucket policy and provide value for policy variable"
#  type        = bool
#  default     = true
#}