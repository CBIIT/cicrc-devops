# modules
module "ecr" {
  count          = var.create_ecr_repos ? 1 : 0
  source         = "./modules/ecr"
  project        = var.project
  ecr_repo_names = var.ecr_repo_names
  tags           = var.tags
}