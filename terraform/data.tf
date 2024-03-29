# Global
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_vpc" "vpc" {
  id = var.vpc_id
}

# ALB
data "aws_acm_certificate" "amazon_issued" {
  domain      =  var.certificate_domain_name
  types       = [local.cert_types]
  most_recent = true
}

# S3
data "aws_iam_policy_document" "s3_alb_policy" {
  statement {
    sid    = "allowalbaccount"
    effect = "Allow"
    principals {
      #identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
      identifiers = ["arn:aws:iam::${lookup(var.aws_account_id, var.region, "us-east-1")}:root"]
      type        = "AWS"
    }
    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${module.s3.bucket_name}/*"]
  }
  statement {
    sid    = "allowalblogdelivery"
    effect = "Allow"
    principals {
      identifiers = ["delivery.logs.amazonaws.com"]
      type        = "Service"
    }
    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${module.s3.bucket_name}/*"]
    condition {
      test     = "StringEquals"
      values   = ["bucket-owner-full-control"]
      variable = "s3:x-amz-acl"
    }
  }
  statement {
    sid       = "awslogdeliveryacl"
    effect    = "Allow"
    actions   = ["s3:GetBucketAcl"]
    resources = ["arn:aws:s3:::${module.s3.bucket_name}"]
    principals {
      identifiers = ["delivery.logs.amazonaws.com"]
      type        = "Service"
    }
  }
}