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
  type = list(string)
}

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

variable "iam_prefix" {
  type        = string
  default     = "power-user"
  description = "nci iam power user prefix"
}