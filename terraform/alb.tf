# data
data "aws_iam_policy_document" "s3_alb_policy" {
  statement {
    sid = "allowalbaccount"
    effect = "Allow"
    principals {
      identifiers = ["arn:aws:iam::${lookup(var.aws_account_id,var.region,"us-east-1" )}:root"]
      type        = "AWS"
    }
    actions = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${module.s3.bucket_name}/*"]
  }
  statement {
    sid = "allowalblogdelivery"
    effect = "Allow"
    principals {
      identifiers = ["delivery.logs.amazonaws.com"]
      type        = "Service"
    }
    actions = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${module.s3.bucket_name}/*"]
    condition {
      test     = "StringEquals"
      values   = ["bucket-owner-full-control"]
      variable = "s3:x-amz-acl"
    }
  }
  statement {
    sid = "awslogdeliveryacl"
    effect = "Allow"
    actions = ["s3:GetBucketAcl"]
    resources = ["arn:aws:s3:::${module.s3.bucket_name}"]
    principals {
      identifiers = ["delivery.logs.amazonaws.com"]
      type        = "Service"
    }
  }
}

# locals
locals {
  alb_log_bucket_name = "${var.project}-${terraform.workspace}-alb-access-logs"
  alb_subnet_ids = terraform.workspace == "prod" || terraform.workspace == "stage" ? var.public_subnet_ids : var.private_subnet_ids
  application_url =  terraform.workspace == "prod" ? var.domain_name : "${var.application_subdomain}-${terraform.workspace}.${var.domain_name}"
}

# vars
variable "application_subdomain" {
  description = "subdomain of the app"
  type = string
}

variable "domain_name" {
  description = "domain name for the application"
  type = string
}

variable "s3_force_destroy" {
  description = "force destroy bucket"
  default = true
  type = bool
}

# modules
module "alb" {
  source = "./modules/alb"
  vpc_id = var.vpc_id
  alb_log_bucket_name = module.s3.bucket_name
  env = terraform.workspace
  alb_subnet_ids = local.alb_subnet_ids
  tags = var.tags
  project = var.project
  alb_certificate_arn = data.aws_acm_certificate.amazon_issued.arn
}

module "s3" {
  source = "./modules/s3"
  bucket_name = local.alb_log_bucket_name
  project = var.project
  env = terraform.workspace
  tags = var.tags
  s3_force_destroy = var.s3_force_destroy
  days_for_archive_tiering = 125
  days_for_deep_archive_tiering = 180
  s3_enable_access_logging = false
  s3_access_log_bucket_id = ""
}