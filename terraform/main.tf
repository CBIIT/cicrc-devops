# ALB
module "alb" {
  source              = "./modules/alb"
  vpc_id              = var.vpc_id
  alb_log_bucket_name = module.s3.bucket_name
  env                 = terraform.workspace
  alb_subnet_ids      = local.alb_subnet_ids
  tags                = var.tags
  project             = var.project
  alb_certificate_arn = data.aws_acm_certificate.amazon_issued.arn
}

module "s3" {
  source                        = "./modules/s3"
  bucket_name                   = local.alb_log_bucket_name
  project                       = var.project
  env                           = terraform.workspace
  tags                          = var.tags
  s3_force_destroy              = var.s3_force_destroy
  days_for_archive_tiering      = 125
  days_for_deep_archive_tiering = 180
  s3_enable_access_logging      = false
  s3_access_log_bucket_id       = ""
}

resource "aws_s3_bucket_policy" "alb_bucket_policy" {
  bucket = module.s3.bucket_id
  policy = data.aws_iam_policy_document.s3_alb_policy.json
}

# ECR
module "ecr" {
  count          = var.create_ecr_repos ? 1 : 0
  source         = "./modules/ecr"
  project        = var.project
  ecr_repo_names = var.ecr_repo_names
  tags           = var.tags
}

# ECS
module "ecs" {
  source          = "./modules/ecs"
  project         = var.project
  tags            = var.tags
  vpc_id          = var.vpc_id
  ecs_subnet_ids  = var.private_subnet_ids
  application_url = local.application_url
  env             = terraform.workspace
  microservices   = var.microservices
  alb_https_listener_arn = module.alb.alb_https_listener_arn
  #alb_https_listener_arn  = module.alb.alb_http_listener_arn
  allow_cloudwatch_stream = true
}

# EFS
module "efs" {
  source          = "./modules/efs"
  project         = var.project
  tags            = var.tags
  vpc_id          = var.vpc_id
  efs_subnet_ids  = var.private_subnet_ids
  env             = terraform.workspace
}

# RDS
module "rds" {
  source             = "./modules/rds"
  project            = var.project
  env                = terraform.workspace
  #db_security_groups = var.db_security_groups
  db_subnet_ids      = var.db_subnet_ids
  vpc_id             = var.vpc_id
  tags               = var.tags
}

# S3
module "s3-rds" {
  count                         = var.create_rds_backup_bucket ? 1 : 0
  source                        = "./modules/s3"
  bucket_name                   = local.rds_backup_bucket_name
  project                       = var.project
  env                           = terraform.workspace
  tags                          = var.tags
  s3_force_destroy              = var.s3_force_destroy
  days_for_archive_tiering      = 125
  days_for_deep_archive_tiering = 180
  s3_enable_access_logging      = false
  s3_access_log_bucket_id       = ""
  s3_enable_bucket_expiration   = true
  s3_enable_intelligent_tiering = false
}