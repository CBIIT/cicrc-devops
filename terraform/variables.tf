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

#variable "certificate_domain_name" {
#  description = "domain name for the ssl cert"
#  type = string
#}

#variable "internal_alb" {
#  description = "is this alb internal?"
#  default = false
#  type = bool
#}

#variable "lb_type" {
#  description = "Type of loadbalancer"
#  type = string
#  default = "application"
#}

#variable "aws_account_id" {
#  type = map(string)
#  description = "aws account to allow for alb s3 logging"
#  default = {
#    us-east-1 = ""
#  }
#}

#variable "public_subnet_ids" {
#  description = "Provide list of public subnets to use in this VPC. Example 10.0.1.0/24,10.0.2.0/24"
#  type = list(string)
#}

#variable "private_subnet_ids" {
#  description = "Provide list private subnets to use in this VPC. Example 10.0.10.0/24,10.0.11.0/24"
#  type = list(string)
#}

#variable "attach_bucket_policy" {
#  description = "set to true if you want bucket policy and provide value for policy variable"
#  type        = bool
#  default     = true
#}

#variable "microservices" {
#  type = map(object({
#    name = string
#    port = number
#    health_check_path = string
#    priority_rule_number = number
#    image_url = string
#    cpu = number
#    memory = number
#    path = list(string)
#    number_container_replicas = number
#  }))
#}

#variable "domain_name" {
#  description = "domain name for the application"
#  type = string
#}

#variable "application_subdomain" {
#  description = "subdomain of the app"
#  type = string
#}

#variable "s3_force_destroy" {
#  description = "force destroy bucket"
#  default = true
#  type = bool
#}

variable "iam_prefix" {
  type        = string
  default     = "power-user"
  description = "nci iam power user prefix"
}