data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_vpc" "vpc" {
  id = var.vpc_id
}

#data "aws_acm_certificate" "amazon_issued" {
#  domain      =  var.certificate_domain_name
#  types       = [local.cert_types]
#  most_recent = true
#}