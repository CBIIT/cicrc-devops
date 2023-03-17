# modules
module "rds" {
  source         = "./modules/ecr"
#  project        = var.project
#  ecr_repo_names = var.ecr_repo_names
#  tags           = var.tags
}